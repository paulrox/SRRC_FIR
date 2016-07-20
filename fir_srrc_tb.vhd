-------------------------------------------------------------------------------
--
-- Title       : fir_srrc_tb
-- Design      : FIR_SRRC
-- Author      : Paolo Sassi
-- Company     : University of Pisa
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\DSS_Project\src\fir_srrc_tb.vhd
-- Generated   : Mon May 23 12:41:07 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Testbench for SRRC FIR, implements a simple boundary
--				 testing.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entity Description
entity fir_srrc_tb is 
	-- Empty entity
end fir_srrc_tb;

-- Architecture Description
architecture fir_srrc_tb_bhv of fir_srrc_tb is
	
-- Constants
constant 	MckPer  :	time     	:= 8 ns;-- Master Clk period
constant 	TestLen :	integer  	:= 500;	-- No. of Count (MckPer/2) for test
	
-- Input Signals
signal		clk		:	std_logic	:= '0';	-- Clock signal
-- SRRC FIR input signal
signal		tb_x	:	std_logic_vector(15 downto 0) := "0000000000000000";
signal		reset	:	std_logic	:= '1';	-- Reset signal

-- Output Signals
signal		tb_y	:	std_logic_vector(18 downto 0);	-- SRRC FIR output
signal		testing	:	boolean := True;

begin

-- Declaration and mapping for the SRRC FIR component
map_fir:
	entity work.fir_srrc(fir_srrc_bhv)
	port map(clk=>clk, reset=>reset, x=>tb_x, y=>tb_y);
	
-- Generate clock
clk	<=	not clk after MckPer/2 when testing else '0';

-- Testing process
test_proc:	process(clk)
	variable count : integer := 0;
	
	-- Generate the test vector
	begin
	case count is
		when 100 	=>	reset	<= '0';
		when 200	=>	tb_x	<= "1000000000000000"; -- "-32768"
		when 204	=>	tb_x  	<= "1000000000000001"; -- "-32767"
		when 208	=>	tb_x	<= "0111111111111110"; -- "32766"
		when 212	=>	tb_x	<= "0111111111111111"; -- "32767"
		when 216	=>	tb_x	<= "0000000000000000";
		-- By setting 'testing' to zero the simulation ends
		when (TestLen - 1) => testing <= False;
		when others => null;
	end case;

	count := count + 1;	
	
	end process test_proc;

end fir_srrc_tb_bhv;