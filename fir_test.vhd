-------------------------------------------------------------------------------
--
-- Title       : FIR_tb
-- Design      : FadingFilter
-- Author      : Paolo Sassi
-- Company     : University of Pisa
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\FadingFilter\src\FIR_test.vhd
-- Generated   : Thu May  5 15:56:26 2016
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
--{entity {FIR_tb} architecture {FIR_tb_bhv}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity FIR_tb is
	-- Empty entity
end FIR_tb;

--}} End of automatically maintained section

architecture FIR_tb_bhv of FIR_tb is


-- Constants
constant 	MckPer  :	time     	:= 8 ns;	-- Master Clk period
constant 	TestLen :	integer  	:= 4000;    -- No. of Count (MckPer/2) for test
	
-- Input Signals
signal		clk		:	std_logic	:= '0';
signal		test_x	:	std_logic_vector(5 downto 0) := "000000";
signal		reset	:	std_logic	:= '1';

-- Output Signals
signal		test_y		:	std_logic_vector(15 downto 0);	-- DDFS output
signal		clk_cycle	:	integer;
signal		testing		:	boolean := True;
signal		trunc		:	std_logic_vector(5 downto 0);

begin

map_fir:	entity work.FIR(FIR_bhv)
			port map(clk=>clk, reset=>reset, x=>test_x, y=>test_y, dd1_out=>test_dd1);
	
-- Generate clock
	
clk		<=	not clk after MckPer/2 when testing else '0';
	
trunc	<= test_y(15 downto 10);
	
test_proc:	process(clk)
	variable count : integer := 0;
	
	begin
		clk_cycle <= (count+1)/2;
	case count is
		when 100 	=>	reset	<= '0';
		when 400	=>	reset	<= '1';
		when 460	=>	reset	<= '0';
		when 600	=>	test_x	<= "100001";
		when (TestLen - 1) => testing <= False;
		when others => null;
	end case;
	
	count := count + 1;	
	
	end process test_proc;


end FIR_tb_bhv;