library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sistema is
	port(
		clk_i: in std_logic;
        rst_i: in std_logic;
		r_data: in std_logic_vector(8-1 downto 0);
		switch1 : in std_logic;
		switch2 : in std_logic;
		reset_uart : out std_logic;
		N : in integer;
		--leds : out std_logic_vector(2-1 downto 0);
		leds : out std_logic_vector(4-1 downto 0);
		led_rgb_1  : out std_logic_vector(3-1 downto 0);
		led_rgb_2  : out std_logic_vector(3-1 downto 0);
		w_data: out std_logic_vector(8-1 downto 0)
	);
end sistema;

architecture Behavioral of sistema is

    component detector is
	port(
		clk_i: in std_logic;
        rst_i: in std_logic;
		r_data: in std_logic_vector(8-1 downto 0);	
		led_rgb_1  : out std_logic_vector(3-1 downto 0);
		led_rgb_2  : out std_logic_vector(3-1 downto 0);
		paquete: out std_logic_vector(21-1 downto 0);
		paquete_ok : out std_logic;
		N : in integer;
		w_data: out std_logic_vector(8-1 downto 0)
	);
    end component;

    component enclavamiento is
	port(
		Clock: in std_logic;
        Reset: in std_logic;
        paquete_ok : in std_logic;
        Paquete_i: in std_logic_vector(21-1 downto 0);
        Paquete_o: out std_logic_vector(15-1 downto 0)
	);
    end component;
    
--    component fifo_enclavamiento is
--	port(
--		clk_i: in std_logic;
--        rst_i: in std_logic;
--        paquete_ok : in std_logic;
--        paquete_i: in std_logic_vector(15-1 downto 0);
--        w_data: out std_logic_vector(8-1 downto 0)
--	);
--    end component;
    
--    component retardador is
--	port(
--		clk_i: in std_logic;
--        rst_i: in std_logic;
--        paquete_ok : in std_logic;
--        r_data: in std_logic_vector(8-1 downto 0);
--        w_data: out std_logic_vector(8-1 downto 0)
--	);
--    end component;
    
    component conector_test is
	port(
		clk_i: in std_logic;
        rst_i: in std_logic;
        switch : in std_logic;
        --leds : out std_logic_vector(2-1 downto 0);
        w_data_1: in std_logic_vector(8-1 downto 0);
        w_data_2: in std_logic_vector(8-1 downto 0);
        w_data_3: out std_logic_vector(8-1 downto 0)
	);
    end component;
    
    component registro is
	port(
		clk_i: in std_logic;
        rst_i: in std_logic;
        paquete_ok : in std_logic;
        paquete_i: in std_logic_vector(15-1 downto 0);
        w_data: out std_logic_vector(8-1 downto 0)
	);
    end component;
    
    signal paquete_i : std_logic_vector(21-1 downto 0);
    signal paquete_o : std_logic_vector(15-1 downto 0);
    signal prueba : std_logic_vector(15-1 downto 0);
    
    signal w_data_1,w_data_2,w_data_3,w_data_aux : std_logic_vector(8-1 downto 0);
    signal paquete_ok_s : std_logic;
begin
    
    detector_i: detector
		port map(
			clk_i 		=>  clk_i,
			rst_i       =>  rst_i,
			r_data     => r_data,
			led_rgb_1 => led_rgb_1,
			led_rgb_2 => led_rgb_2,
			N        => N,
			paquete_ok => paquete_ok_s,
			paquete  => paquete_i,
			w_data     => w_data_1
		);	
	
	enclavamiento_i: enclavamiento
		port map(
			Clock 		=>  clk_i,
			Reset       =>  rst_i,
			paquete_ok  => paquete_ok_s,
			Paquete_i     => paquete_i,
			Paquete_o     => paquete_o
		);	
	
--	   fifo_enclavamiento_i: fifo_enclavamiento
--		port map(
--			clk_i 		=>  clk_i,
--			rst_i       =>  rst_i,
--			paquete_ok  => paquete_ok_s,
--			paquete_i   => paquete_o,
--			--paquete_i   => prueba,
--			w_data     => w_data_aux
--		);	
		
		registro_i: registro
		port map(
			clk_i 		=>  clk_i,
			rst_i       =>  rst_i,
			paquete_ok  => paquete_ok_s,
			paquete_i   => paquete_o,
			--paquete_i   => prueba,
			w_data     => w_data_2
			--w_data     => open
		);
		

		
		conector_test_i: conector_test
		port map(
			clk_i 		=>  clk_i,
			rst_i       =>  rst_i,
			switch      => switch1,
			--leds(0)       => leds(0),
			--leds(1)       => leds(1),
			w_data_1     => w_data_1,
			w_data_2     => w_data_2,
			w_data_3     => w_data_3
		);
		
		w_data <= w_data_3;
		--prueba <= "0011001" & btn;
		prueba <= "101010101010101";	
        --w_data <= r_data;
        
        process(clk_i)
        variable contador : integer range 0 to 125e6 := 0;
        begin
            if (clk_i = '1' and clk_i'event) then
            
--                if contador <= 407*5 then --"U"
--                    w_data_2(0) <= paquete_o(0);
--                    w_data_2(1) <= paquete_o(1);
--                    w_data_2(2) <= paquete_o(2);
--                    w_data_2(3) <= paquete_o(3);
--                    w_data_2(4) <= paquete_o(4);
--                    w_data_2(5) <= paquete_o(5);
--                    w_data_2(6) <= paquete_o(6);
--                    w_data_2(7) <= paquete_o(7);
--                    contador := contador + 1;
--                end if;
--                --if contador < 125e6 then
--                --     contador := contador + 1;
--                --end if;
--                if contador = 125e6 then
--                    w_data_2 <= "01000001"; -- "A"
--                end if;
                
                if switch2 = '1' then  
                    leds <= std_logic_vector(to_unsigned(N,3)) & paquete_ok_s;                
                else
                    leds <= "000" & paquete_ok_s; 
                end if;
            end if;
        end process;  
    
        process(clk_i)
        variable count: integer := 0;
            begin
                if (clk_i = '1' and clk_i'event) then
                    if rst_i = '1' then          
                        reset_uart <= '0'; 
                    else 
                        count := count + 1;
                      
                        if count = 10*125E6 then    -- Cuento 10 mseg
                            count := 0;
                            reset_uart <= '1'; 
                        else
                            reset_uart <= '0'; 
                        end if;

                    end if;
                end if;
  
            end process;
    
        
end Behavioral;