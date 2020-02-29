library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity detector is
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
end detector;

architecture Behavioral of detector is
    
    type estados_t is (inicio,lectura,final,error);
    signal estado, estado_siguiente : estados_t; 
  
    signal data_in :  std_logic_vector(8-1 downto 0);
    
    signal data_ok: std_logic;
    
    signal contador : integer range 0 to 23 := 0;
    signal ticks : integer range 0 to 407 := 0;
    
    signal paquete_aux : std_logic_vector(21-1 downto 0);
    signal paquete_ready : std_logic;
    
    signal nuevo : std_logic;
    signal largo_ok : std_logic;
    signal tags_ok : std_logic;
    signal tags_izq : std_logic;
    signal tags_der : std_logic;
    
    signal tag_inicial : std_logic_vector(8-1 downto 0) := "00111100"; -- r_data = '<'
    signal tag_final : std_logic_vector(8-1 downto 0) := "00111110"; -- r_data = '>'
    signal char_0 : std_logic_vector(8-1 downto 0) := "00110000"; -- r_data = '0'
    signal char_1 : std_logic_vector(8-1 downto 0) := "00110001"; -- r_data = '1'
    

begin
    
    cambio_estados : process(clk_i)
    begin
        if (clk_i = '1' and clk_i'event) then
            if rst_i = '1' then          
                estado <= inicio;
            else
                estado <= estado_siguiente;       
            end if;
        end if;
    end process;
   
   procesamiento : process(clk_i,r_data) 
   begin 
        if (clk_i = '1' and clk_i'event) then
            if rst_i = '1' then          
                contador <= 0; 
            else
                
                if estado = lectura then         
                    if ticks = 100 then           
                        if contador < 21 then
                            if data_in = char_0 then
                                paquete_aux(contador) <= '0';
                            end if;
                            if data_in = char_1 then
                                paquete_aux(contador) <= '1';
                            end if;     
                        end if;
                            
                    end if;
                end if;                    
           end if;
        end if;
             
    end process;
   
     estados : process(estado,r_data,contador)      
     begin
 
        estado_siguiente <= estado;   
        -- LED4 = RGB2 | LED5 => RGB1
        -- BGR -> 001 = R | 010 = G | 100 = B
        case(estado) is                  
                    
          when inicio =>    
            paquete_ready <= '0'; 
               
            --led_rgb_1 <= "100";   -- azul LD5
            if data_in = tag_inicial then -- r_data = '<'
                tags_izq <= '1';
                estado_siguiente <= lectura;                    
            end if;               
          when lectura => 
            paquete_ready <= '0';  
            if contador = 22 then -- 21 (asi entran 21)
                if data_in = tag_final then --  r_data = '>'
                    tags_der <= '1';  
                    contador <= 0;                
                    estado_siguiente <= final;
                else 
                    tags_izq <= '0';
                    tags_der <= '0';  
                    contador <= 0;    
                    estado_siguiente <= error;                       
                end if;                      
            else
                --led_rgb_1 <= "101"; -- azul
                --led_rgb_2 <= "100"; -- azul
            end if; 
          when final =>  
            --led_rgb_1 <= "111"; -- blanco   
            --led_rgb_2 <= "010"; -- verde
            paquete_ready <= '1';
            if data_in = tag_inicial then -- r_data = '<'
                tags_izq <= '1';
                estado_siguiente <= lectura;                    
            end if;           
          when error => 
            --led_rgb_1 <= "111"; -- blanco        
            --led_rgb_2 <= "001"; -- rojo
            paquete_aux <= (others => '0');
            if data_in = tag_inicial then -- r_data = '<'
                tags_izq <= '1';
                estado_siguiente <= lectura;                    
            end if;                
          when others => null;
        end case;
      end process;
    
    lector_pulsos : process(clk_i)
    begin
        if rising_edge(clk_i) then
            if rst_i = '1' then
                ticks <= 0; 
            else  
                if ticks < 407 then
                    ticks <= ticks + 1;
                end if;
                if ticks = 407 then
                    data_in <= r_data;
                    ticks <= 0;
                    contador <= contador + 1;
                end if;
            end if;
        end if;
    end process;
    
    analizar_tags : process(clk_i)
    begin
        if (clk_i = '1' and clk_i'event) then
            if rst_i = '1' then
                tags_ok <= '0'; 
                led_rgb_1 <= "001"; -- rojo
            else  
                tags_ok <= tags_izq and tags_der;
                
                if tags_ok = '1' then
                    led_rgb_1 <= "010"; -- verde
                else
                    led_rgb_1 <= "001"; -- rojo
                end if;
            end if;
        end if;
    end process;
    
    analizar_largo : process(clk_i)
    begin
        if (clk_i = '1' and clk_i'event) then
            if rst_i = '1' then
                largo_ok <= '0'; 
                led_rgb_2 <= "001"; -- rojo 
            else  
                if N = 23 then
                    largo_ok <= '1';                   
                    led_rgb_2 <= "010"; -- verde
                else
                    largo_ok <= '0'; 
                    led_rgb_2 <= "001"; -- rojo       
                end if;
            end if;
        end if;
    end process;
    
    paquete_valido : process(clk_i)
    begin
        if (clk_i = '1' and clk_i'event) then
            if rst_i = '1' then
                paquete_ok <= '0'; 
            else  
                paquete_ok <= largo_ok and tags_ok;           
            end if;
        end if;
    end process;
    
    --char_data <= r_data;
    w_data <= r_data;      
        
end Behavioral;
