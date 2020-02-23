-- nodo_6.vhdl : Achivo VHDL generado automaticamente
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--Declare the package
use work.my_package.all;
	entity nodo_6 is
		generic(
			N : natural := 39;
			N_CVS : natural := 13;
			N_SEM : natural := 12;
			N_PAN : natural := 0;
			N_MDC : natural := 2
		);
		port(
			Clock :  in std_logic;
			Reset :  in std_logic;
			Estado_i :  in std_logic;
			Estado_ante :  out std_logic;
			Estado_post :  out std_logic;
			Semaforo_cercano :  out sem_type;
			Semaforo_lejano :  out sem_type;
			Estado_o :  out std_logic
		);
	end entity nodo_6;
architecture Behavioral of nodo_6 is
begin
	process(Clock,Reset)
	begin
		if (Clock = '1' and Clock'Event) then
			if (Reset = '1') then
				Estado_o <= '0';
			else
				Estado_o <= Estado_i;
			end if;
		end if;
	end process;
end Behavioral;
