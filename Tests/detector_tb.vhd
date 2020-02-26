-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 11.2.2020 22:32:39 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_detector is
end tb_detector;

architecture tb of tb_detector is

    component detector
        port (clk_i     : in std_logic;
              rst_i     : in std_logic;
              r_data    : in std_logic_vector (8-1 downto 0);
              led_rgb_1 : out std_logic_vector (3-1 downto 0);
              led_rgb_2 : out std_logic_vector (3-1 downto 0);
              paquete   : out std_logic_vector (21-1 downto 0);
	      paquete_ok : out std_logic;
              w_data    : out std_logic_vector (8-1 downto 0));
    end component;

    signal clk_i     : std_logic;
    signal rst_i     : std_logic;
    signal r_data    : std_logic_vector (8-1 downto 0);
    signal led_rgb_1 : std_logic_vector (3-1 downto 0);
    signal led_rgb_2 : std_logic_vector (3-1 downto 0);
    signal paquete   : std_logic_vector (21-1 downto 0); 
    signal paquete_ok : std_logic;
    signal w_data    : std_logic_vector (8-1 downto 0);

    constant TbPeriod : time := 8 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : detector
    port map (clk_i      => clk_i,
              rst_i      => rst_i,
              r_data     => r_data,
              led_rgb_1  => led_rgb_1,
              led_rgb_2  => led_rgb_2,
              paquete    => paquete,
	      paquete_ok => paquete_ok,
              w_data     => w_data);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk_i is really your main clock signal
    clk_i <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        --r_data <= (others => '0');

        -- Reset generation
        -- EDIT: Check that rst_i is really your reset signal
        rst_i <= '1';
        wait for 100 ns;
        rst_i <= '0';
        wait for 1000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

    datos : process
    begin
        
	wait for 100 ns;
	-- 21
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00111110"; -- >

	wait for 100 ns;
	-- 22
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00111110"; -- >
	
	wait for 100 ns;
	-- 23
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110000"; -- 0
	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00111110"; -- >


	wait for 100 ns;
	--7
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110010"; -- 2
	wait for 50 ns;
	r_data <= "00110011"; -- 3
	wait for 50 ns;
	r_data <= "00110100"; -- 4
	wait for 50 ns;
	r_data <= "00110101"; -- 5
	wait for 50 ns;
	r_data <= "00110110"; -- 6
	wait for 50 ns;
	r_data <= "00110111"; -- 7
	wait for 50 ns;
	r_data <= "00111110"; -- >

	wait for 100 ns;
	--8
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110010"; -- 2
	wait for 50 ns;
	r_data <= "00110011"; -- 3
	wait for 50 ns;
	r_data <= "00110100"; -- 4
	wait for 50 ns;
	r_data <= "00110101"; -- 5
	wait for 50 ns;
	r_data <= "00110110"; -- 6
	wait for 50 ns;
	r_data <= "00110111"; -- 7
	wait for 50 ns;
	r_data <= "00111000"; -- 8
	wait for 50 ns;
	r_data <= "00111110"; -- >

	wait for 100 ns;
	--9
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110010"; -- 2
	wait for 50 ns;
	r_data <= "00110011"; -- 3
	wait for 50 ns;
	r_data <= "00110100"; -- 4
	wait for 50 ns;
	r_data <= "00110101"; -- 5
	wait for 50 ns;
	r_data <= "00110110"; -- 6
	wait for 50 ns;
	r_data <= "00110111"; -- 7
	wait for 50 ns;
	r_data <= "00111000"; -- 8
	wait for 50 ns;
	r_data <= "00111001"; -- 9
	wait for 50 ns;
	r_data <= "00111110"; -- >

	wait for 100 ns;
	--10
        r_data <= "00111100"; -- <
 	wait for 50 ns;
	r_data <= "00110001"; -- 1
	wait for 50 ns;
	r_data <= "00110010"; -- 2
	wait for 50 ns;
	r_data <= "00110011"; -- 3
	wait for 50 ns;
	r_data <= "00110100"; -- 4
	wait for 50 ns;
	r_data <= "00110101"; -- 5
	wait for 50 ns;
	r_data <= "00110110"; -- 6
	wait for 50 ns;
	r_data <= "00110111"; -- 7
	wait for 50 ns;
	r_data <= "00111000"; -- 8
	wait for 50 ns;
	r_data <= "00111001"; -- 9
	wait for 50 ns;
	r_data <= "01000001"; -- A
	wait for 50 ns;
	r_data <= "00111110"; -- >

        wait for 100 * TbPeriod;
	TbSimEnded <= '1';
    end process;
	
end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_detector of tb_detector is
    for tb
    end for;
end cfg_tb_detector;