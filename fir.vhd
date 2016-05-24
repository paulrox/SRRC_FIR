-------------------------------------------------------------------------------
--
-- Title       : FIR
-- Design      : FadingFilter
-- Author      : Paolo Sassi
-- Company     : University of Pisa
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\FadingFilter\src\FIR.vhd
-- Generated   : Wed May  4 10:19:29 2016
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
--{entity {FIR} architecture {FIR_bhv}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.numeric_std.all;

entity FIR is
	port(
		clk		:	in	std_logic;
		reset	:	in	std_logic;
		x		:	in	std_logic_vector(5 downto 0);
		y		:	out	std_logic_vector(15 downto 0);
		
end FIR;

--}} End of automatically maintained section

architecture FIR_bhv of FIR is

constant b0	:	signed(9 downto 0) := TO_SIGNED(8,  10);
constant b1 : 	signed(9 downto 0) := TO_SIGNED(37, 10);
constant b2 : 	signed(9 downto 0) := TO_SIGNED(93, 10);
constant b3 : 	signed(9 downto 0) := TO_SIGNED(161,10);
constant b4 :	signed(9 downto 0) := TO_SIGNED(209,10);
constant b5 :	signed(9 downto 0) := TO_SIGNED(209,10);
constant b6 : 	signed(9 downto 0) := TO_SIGNED(161,10);
constant b7 : 	signed(9 downto 0) := TO_SIGNED(93, 10);
constant b8 : 	signed(9 downto 0) := TO_SIGNED(37, 10);
constant b9	:	signed(9 downto 0) := TO_SIGNED(8,	 10);

signal	dff_in_0	:	std_logic_vector(15 downto 0);
signal	dff_in_1	:	std_logic_vector(15 downto 0);
signal	dff_in_2	:	std_logic_vector(15 downto 0);
signal	dff_in_3	:	std_logic_vector(15 downto 0);
signal	dff_in_4	:	std_logic_vector(15 downto 0);
signal	dff_in_5	:	std_logic_vector(15 downto 0);
signal	dff_in_6	:	std_logic_vector(15 downto 0);
signal	dff_in_7	:	std_logic_vector(15 downto 0);
signal	dff_in_8	:	std_logic_vector(15 downto 0);
signal	dff_in_9	:	std_logic_vector(15 downto 0); 

signal	dff_out_0	:	std_logic_vector(15 downto 0);
signal	dff_out_1	:	std_logic_vector(15 downto 0);
signal	dff_out_2	:	std_logic_vector(15 downto 0);
signal	dff_out_3	:	std_logic_vector(15 downto 0);
signal	dff_out_4	:	std_logic_vector(15 downto 0);
signal	dff_out_5	:	std_logic_vector(15 downto 0);
signal	dff_out_6	:	std_logic_vector(15 downto 0);
signal	dff_out_7	:	std_logic_vector(15 downto 0);
signal	dff_out_8	:	std_logic_vector(15 downto 0);
signal	dff_out_9	:	std_logic_vector(15 downto 0);

begin

dff_in_0 <= std_logic_vector(signed(x) * b0);
dff0_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_0, clk=>clk, reset=>reset, q=>dff_out_0);

dff_in_1 <= std_logic_vector((signed(x) * b1) + signed(dff_out_0));
dff1_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_1, clk=>clk, reset=>reset, q=>dff_out_1);

dff_in_2 <= std_logic_vector((signed(x) * b2) + signed(dff_out_1));
dff2_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_2, clk=>clk, reset=>reset, q=>dff_out_2);
			
dff_in_3 <= std_logic_vector((signed(x) * b3) + signed(dff_out_2));
dff3_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_3, clk=>clk, reset=>reset, q=>dff_out_3);
			
dff_in_4 <= std_logic_vector((signed(x) * b4) + signed(dff_out_3));
dff4_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_4, clk=>clk, reset=>reset, q=>dff_out_4);
			
dff_in_5 <= std_logic_vector((signed(x) * b5) + signed(dff_out_4));
dff5_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_5, clk=>clk, reset=>reset, q=>dff_out_5);
			
dff_in_6 <= std_logic_vector((signed(x) * b6) + signed(dff_out_5));
dff6_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_6, clk=>clk, reset=>reset, q=>dff_out_6);

dff_in_7 <= std_logic_vector((signed(x) * b7) + signed(dff_out_6));
dff7_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_7, clk=>clk, reset=>reset, q=>dff_out_7);
			
dff_in_8 <= std_logic_vector((signed(x) * b8) + signed(dff_out_7));
dff8_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_8, clk=>clk, reset=>reset, q=>dff_out_8);
			
dff_in_9 <= std_logic_vector((signed(x) * b9) + signed(dff_out_8));
dff9_map:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_9, clk=>clk, reset=>reset, q=>y);
	

end FIR_bhv;
										