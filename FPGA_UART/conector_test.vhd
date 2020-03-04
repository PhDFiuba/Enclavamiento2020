library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity conector_test is
	port(
		clk_i: in std_logic;
        rst_i: in std_logic;
        switch : in std_logic;
        leds : out std_logic_vector(2-1 downto 0);
        wr_uart_3 : out std_logic;
        N_1 : in integer;
        N_2 : in integer;
        paquete_ok : in std_logic;
        w_data_1: in std_logic_vector(8-1 downto 0);
        w_data_2: in std_logic_vector(8-1 downto 0);
        w_data_3: out std_logic_vector(8-1 downto 0)
	);
    end entity;

architecture Behavioral of conector_test is
        
begin
     
    process(clk_i)
    variable contador: integer := 0;
    variable N_total : integer := 0;
    begin
        if (clk_i = '1' and clk_i'event) then
            if rst_i = '1' then
                N_total := 0; 
                contador := 0; 
            else 
                if switch = '1' then                 
                    w_data_3 <= w_data_2; 
                    --leds <= "10";
                else   
                   if paquete_ok = '1' then
                        w_data_3 <= w_data_1;
                   end if;
                   
                   if N_1 > 0 and N_1 < 50 and N_1 > N_total then             
                        if paquete_ok = '1' then 
                            contador := contador + 1;
                                 
                            if contador = 125E3 then    -- Cuento 100 mseg
                                contador := 0;   
                                N_total := N_total + 1;
                                
                                wr_uart_3 <= '1';
                            else                    
                                wr_uart_3 <= '0';                    
                            end if;
                        else
                            wr_uart_3 <= '0';
                            N_total := 0; 
                        end if;
                    else
                        wr_uart_3 <= '0';  
                    end if;
     
                                       
      
                    --leds <= "01";
                end if;
            end if;
        end if;
    end process;  
    
        
end Behavioral;