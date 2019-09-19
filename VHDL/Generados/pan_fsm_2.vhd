-- pan_fsm_2.vhdl : Achivo VHDL generado automaticamente por el generador de c�digo RAILIB
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--entidad_2 de pan_fsm
entity pan_fsm_2 is
	generic(
		N_RUT : natural := 3;
		N_SEM : natural := 3
	);
	port(
		Clock : in std_logic;
		Reset : in std_logic;
		Estado_ruta_Ruta_2 : in std_logic_vector(20-1 downto 0);
		CV_alarma_total_Ruta_2 : in std_logic_vector(21-1 downto 0);
		CV_alarma_inmediata_Ruta_2 : in std_logic_vector(22-1 downto 0);
		PAN_bloq_temp_solape_Ruta_2 : in std_logic_vector(23-1 downto 0);
		PAN_alto_Ruta_2 : out std_logic;
		PAN_bajo_Ruta_2 : out std_logic;
		PAN_alarma_Ruta_2 : out std_logic;
		PAN_habilitacion_Ruta_2 : out std_logic
	);
end entity pan_fsm_2;
-- Arquitectura de FSM_barreras_2 : Descripcion del comportamiento
architecture pan_fsm_2_ARQ of pan_fsm_2 is
	begin
	process(Clock,Reset)
	begin
		if (Clock ='1' and Clock'Event) then
			PAN_alarma_Ruta_2 <= CV_alarma_inmediata_Ruta_2(1) or CV_alarma_inmediata_Ruta_2(2) or CV_alarma_inmediata_Ruta_2(3);
			PAN_alto_Ruta_2 <= CV_alarma_total_Ruta_2(1) or CV_alarma_total_Ruta_2(2) or CV_alarma_total_Ruta_2(3);
			PAN_bajo_Ruta_2 <= Estado_ruta_Ruta_2(1) or Estado_ruta_Ruta_2(2) or Estado_ruta_Ruta_2(3);
			PAN_habilitacion_Ruta_2 <= PAN_bloq_temp_solape_Ruta_2(1) or PAN_bloq_temp_solape_Ruta_2(2) or PAN_bloq_temp_solape_Ruta_2(3);
		end if;
	end process;
end architecture pan_fsm_2_ARQ;
