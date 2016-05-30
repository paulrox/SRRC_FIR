-------------------------------------------------------------------------------
--
-- Title       : fir_srrc_tb
-- Design      : FIR_SRRC
-- Author      : Paolo Sassi
-- Company     : University of Pisa
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\DSS_Project\src\fir_srrc_test.vhd
-- Generated   : Mon May 23 12:41:07 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {fir_srrc_tb} architecture {fir_srrc_tb_bhv}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fir_srrc_tb is 
	-- Empty entity
end fir_srrc_tb;

--}} End of automatically maintained section

architecture fir_srrc_tb_bhv of fir_srrc_tb is
	
-- Constants
constant 	MckPer  :	time     	:= 8 ns;	-- Master Clk period
constant 	TestLen :	integer  	:= 4000;    -- No. of Count (MckPer/2) for test
	
-- Input Signals
signal		clk		:	std_logic	:= '0';
signal		test_x	:	std_logic_vector(15 downto 0) := "0000000000000000";
signal		reset	:	std_logic	:= '1';

-- Output Signals
signal		test_y		:	std_logic_vector(31 downto 0);	-- DDFS output
signal		clk_cycle	:	integer;
signal		testing		:	boolean := True;

begin

map_fir:	entity work.fir_srrc(fir_srrc_bhv)
			port map(clk=>clk, reset=>reset, x=>test_x, y=>test_y);
	
-- Generate clock
	
clk		<=	not clk after MckPer/2 when testing else '0';
	
test_proc:	process(clk)
	variable count : integer := 0;
	
	begin
		clk_cycle <= (count+1)/2;
	case count is
		when 100 	=>	reset	<= '0';
		when 400	=>	reset	<= '1';
		when 460	=>	reset	<= '0';
		when 600	=>	test_x	<= "0111111111110000";
		--when 603	=>	test_x	<= "0000000000000000";
		when (TestLen - 1) => testing <= False;
		when others => null;
	end case;
	
	count := count + 1;	
	
	end process test_proc;

end fir_srrc_tb_bhv;
