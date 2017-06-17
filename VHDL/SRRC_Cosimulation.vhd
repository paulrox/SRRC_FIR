library FIR_SRRC;
library ieee;

use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

entity SRRC_Cosimulation is
end SRRC_Cosimulation;

architecture COSIMULATION of SRRC_Cosimulation is


component fir_srrc
	port (
	clk : in  STD_LOGIC;
	reset : in  STD_LOGIC;
	x : in  STD_LOGIC_VECTOR(15 downto 0);
	y : out STD_LOGIC_VECTOR(18 downto 0));
end component;


for \SRRC_Cosimulation/VHDL_SRRC_FIR\ : fir_srrc use entity FIR_SRRC.fir_srrc(fir_srrc_bhv);
signal CLK_0 : std_logic := '0';

--Signals declaration for module SRRC_Cosimulation/VHDL_SRRC_FIR(fir_srrc_bhv)
signal \SRRC_Cosimulation/VHDL_SRRC_FIR/reset\ : STD_LOGIC;
signal \SRRC_Cosimulation/VHDL_SRRC_FIR/x\ : STD_LOGIC_VECTOR(15 downto 0);
signal \SRRC_Cosimulation/VHDL_SRRC_FIR/y\ : STD_LOGIC_VECTOR(18 downto 0);

begin

	\SRRC_Cosimulation/VHDL_SRRC_FIR\ : fir_srrc
	port map(
	clk => CLK_0,
	reset => \SRRC_Cosimulation/VHDL_SRRC_FIR/reset\,
	x => \SRRC_Cosimulation/VHDL_SRRC_FIR/x\,
	y => \SRRC_Cosimulation/VHDL_SRRC_FIR/y\);

--Clock signal generator CLK_0
CLOCK_GEN_CLK_0: process
	begin
	loop
		CLK_0 <= '0';
		wait for 4000 us;
		CLK_0 <= '1';
		wait for 4000 us;
	end loop;
end process;


end COSIMULATION;

