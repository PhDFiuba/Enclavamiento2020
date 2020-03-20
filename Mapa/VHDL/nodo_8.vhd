-- nodo_8.vhdl : Achivo VHDL generado automaticamente
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--Declare the package
use work.my_package.all;
	entity nodo_8 is
		generic(
			N : natural := 32;
			N_SEM : natural := 10;
			N_MDC : natural := 2;
			N_CVS : natural := 10
		);
		port(
			Clock :  in std_logic;
			Reset :  in std_logic;
			Estado_i :  in std_logic;
			Estado_ante :  in std_logic;
			Estado_post :  in std_logic;
			Semaforo_propio_i_1 :  in sem_type;
			Semaforo_propio_o_1 :  out sem_type;
			Semaforo_cercano :  out sem_type;
			Semaforo_lejano :  out sem_type;
			Estado_o :  out std_logic
		);
	end entity nodo_8;
architecture Behavioral of nodo_8 is
begin
	process(Clock,Reset)
	begin
		if (Clock = '1' and Clock'Event) then
			if (Reset = '1') then
				Semaforo_propio_o_1.msb <= '0';
				Semaforo_propio_o_1.lsb <= '0';
			else
				Estado_o <= Estado_i;
				if ( Estado_i = '0' ) then
					Semaforo_propio_o_1.msb <= '0';
					Semaforo_propio_o_1.lsb <= '0';
				else
					if ( Estado_ante = '0' ) then
					Semaforo_propio_o_1.msb <= '1';
					Semaforo_propio_o_1.lsb <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;