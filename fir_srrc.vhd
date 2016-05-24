-------------------------------------------------------------------------------
--
-- Title       : fir_srrc
-- Design      : FIR_SRRC
-- Author      : Paolo Sassi
-- Company     : University of Pisa
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\DSS_Project\src\fir_srrc.vhd
-- Generated   : Sat May 21 10:56:40 2016
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
--{entity {fir_srrc} architecture {fir_srrc_bhv}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity fir_srrc is
	port(
		clk		:	in	std_logic;
		reset	:	in	std_logic;
		x		:	in	std_logic_vector(15 downto 0);
		y 		:	out	std_logic_vector(15 downto 0)
	);
end fir_srrc;

--}} End of automatically maintained section

architecture fir_srrc_bhv of fir_srrc is

-- Coefficients definition

constant c0		:	signed(15 downto 0)	:=	to_signed(-271, 16);
constant c1		:	signed(15 downto 0)	:=	to_signed(-246, 16);
constant c2		:	signed(15 downto 0)	:=	to_signed(253, 16);
constant c3		:	signed(15 downto 0)	:=	to_signed(694, 16);
constant c4		:	signed(15 downto 0)	:=	to_signed(253, 16);
constant c5		:	signed(15 downto 0)	:=	to_signed(-1229, 16);
constant c6		:	signed(15 downto 0)	:=	to_signed(-2570, 16);
constant c7		:	signed(15 downto 0)	:=	to_signed(-1739, 16);
constant c8		:	signed(15 downto 0)	:=	to_signed(2569, 16);
constant c9		:	signed(15 downto 0)	:=	to_signed(9479, 16);
constant c10	:	signed(15 downto 0)	:=	to_signed(15966, 16);
constant c11	:	signed(15 downto 0)	:=	to_signed(18622, 16);
constant c12	:	signed(15 downto 0)	:=	to_signed(15966, 16);
constant c13	:	signed(15 downto 0)	:=	to_signed(9479, 16);
constant c14	:	signed(15 downto 0)	:=	to_signed(2569, 16);
constant c15	:	signed(15 downto 0)	:=	to_signed(-1739, 16);
constant c16	:	signed(15 downto 0)	:=	to_signed(-2570, 16);
constant c17	:	signed(15 downto 0)	:=	to_signed(-1229, 16);
constant c18	:	signed(15 downto 0)	:=	to_signed(253, 16);
constant c19	:	signed(15 downto 0)	:=	to_signed(694, 16); 
constant c20	:	signed(15 downto 0)	:=	to_signed(253, 16);
constant c21	:	signed(15 downto 0)	:=	to_signed(-246, 16);
constant c22	:	signed(15 downto 0)	:=	to_signed(-271, 16);

-- Registers input lines
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
signal	dff_in_10	:	std_logic_vector(15 downto 0);
signal	dff_in_11	:	std_logic_vector(15 downto 0);
signal	dff_in_12	:	std_logic_vector(15 downto 0);
signal	dff_in_13	:	std_logic_vector(15 downto 0);
signal	dff_in_14	:	std_logic_vector(15 downto 0);
signal	dff_in_15	:	std_logic_vector(15 downto 0);
signal	dff_in_16	:	std_logic_vector(15 downto 0);
signal	dff_in_17	:	std_logic_vector(15 downto 0);
signal	dff_in_18	:	std_logic_vector(15 downto 0);
signal	dff_in_19	:	std_logic_vector(15 downto 0);
signal	dff_in_20	:	std_logic_vector(15 downto 0);
signal	dff_in_21	:	std_logic_vector(15 downto 0);

-- Registers output lines
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
signal	dff_out_10	:	std_logic_vector(15 downto 0);
signal	dff_out_11	:	std_logic_vector(15 downto 0);
signal	dff_out_12	:	std_logic_vector(15 downto 0);
signal	dff_out_13	:	std_logic_vector(15 downto 0);
signal	dff_out_14	:	std_logic_vector(15 downto 0);
signal	dff_out_15	:	std_logic_vector(15 downto 0);
signal	dff_out_16	:	std_logic_vector(15 downto 0);
signal	dff_out_17	:	std_logic_vector(15 downto 0);
signal	dff_out_18	:	std_logic_vector(15 downto 0);
signal	dff_out_19	:	std_logic_vector(15 downto 0);
signal	dff_out_20	:	std_logic_vector(15 downto 0);
signal	dff_out_21	:	std_logic_vector(15 downto 0);

-- Multiplication stages output lines
signal	mul_out_0	:	std_logic_vector(31	downto 0);
signal	mul_out_1	:	std_logic_vector(31	downto 0);
signal	mul_out_2	:	std_logic_vector(31	downto 0);
signal	mul_out_3	:	std_logic_vector(31	downto 0);
signal	mul_out_4	:	std_logic_vector(31	downto 0);
signal	mul_out_5	:	std_logic_vector(31	downto 0);
signal	mul_out_6	:	std_logic_vector(31	downto 0);
signal	mul_out_7	:	std_logic_vector(31	downto 0);
signal	mul_out_8	:	std_logic_vector(31	downto 0);
signal	mul_out_9	:	std_logic_vector(31	downto 0);
signal	mul_out_10	:	std_logic_vector(31	downto 0);
signal	mul_out_11	:	std_logic_vector(31	downto 0);
signal	mul_out_12	:	std_logic_vector(31	downto 0);
signal	mul_out_13	:	std_logic_vector(31	downto 0);
signal	mul_out_14	:	std_logic_vector(31	downto 0);
signal	mul_out_15	:	std_logic_vector(31	downto 0);
signal	mul_out_16	:	std_logic_vector(31	downto 0);
signal	mul_out_17	:	std_logic_vector(31	downto 0);
signal	mul_out_18	:	std_logic_vector(31	downto 0);
signal	mul_out_19	:	std_logic_vector(31	downto 0);
signal	mul_out_20	:	std_logic_vector(31	downto 0);
signal	mul_out_21	:	std_logic_vector(31	downto 0);
signal	mul_out_22	:	std_logic_vector(31	downto 0);

-- Adders output lines
signal	add_out_0	:	std_logic_vector(32 downto 0);
signal	add_out_1	:	std_logic_vector(32 downto 0);
signal	add_out_2	:	std_logic_vector(32 downto 0);
signal	add_out_3	:	std_logic_vector(32 downto 0);
signal	add_out_4	:	std_logic_vector(32 downto 0);
signal	add_out_5	:	std_logic_vector(32 downto 0);
signal	add_out_6	:	std_logic_vector(32 downto 0);
signal	add_out_7	:	std_logic_vector(32 downto 0);
signal	add_out_8	:	std_logic_vector(32 downto 0);
signal	add_out_9	:	std_logic_vector(32 downto 0);
signal	add_out_10	:	std_logic_vector(32 downto 0);
signal	add_out_11	:	std_logic_vector(32 downto 0);
signal	add_out_12	:	std_logic_vector(32 downto 0);
signal	add_out_13	:	std_logic_vector(32 downto 0);
signal	add_out_14	:	std_logic_vector(32 downto 0);
signal	add_out_15	:	std_logic_vector(32 downto 0);
signal	add_out_16	:	std_logic_vector(32 downto 0);
signal	add_out_17	:	std_logic_vector(32 downto 0);
signal	add_out_18	:	std_logic_vector(32 downto 0);
signal	add_out_19	:	std_logic_vector(32 downto 0);
signal	add_out_20	:	std_logic_vector(32 downto 0);
signal	add_out_21	:	std_logic_vector(32 downto 0);

begin

-- Registers mapping

dff_in_0 <= x;
dff_map_0:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_0, clk=>clk, reset=>reset, q=>dff_out_0);
			
dff_in_1 <= dff_out_0;
dff_map_1:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_1, clk=>clk, reset=>reset, q=>dff_out_1);

dff_in_2 <= dff_out_1;
dff_map_2:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_2, clk=>clk, reset=>reset, q=>dff_out_2);

dff_in_3 <= dff_out_2;
dff_map_3:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_3, clk=>clk, reset=>reset, q=>dff_out_3);

dff_in_4 <= dff_out_3;			
dff_map_4:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_4, clk=>clk, reset=>reset, q=>dff_out_4);

dff_in_5 <= dff_out_4;			
dff_map_5:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_5, clk=>clk, reset=>reset, q=>dff_out_5);

dff_in_6 <= dff_out_5;			
dff_map_6:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_6, clk=>clk, reset=>reset, q=>dff_out_6);

dff_in_7 <= dff_out_6;			
dff_map_7:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_7, clk=>clk, reset=>reset, q=>dff_out_7);

dff_in_8 <= dff_out_7;			
dff_map_8:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_8, clk=>clk, reset=>reset, q=>dff_out_8);

dff_in_9 <= dff_out_8;			
dff_map_9:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_9, clk=>clk, reset=>reset, q=>dff_out_9);

dff_in_10 <= dff_out_9;			
dff_map_10:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_10, clk=>clk, reset=>reset, q=>dff_out_10);

dff_in_11 <= dff_out_10;			
dff_map_11:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_11, clk=>clk, reset=>reset, q=>dff_out_11);
			
dff_in_12 <= dff_out_11;			
dff_map_12:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_12, clk=>clk, reset=>reset, q=>dff_out_12);
			
dff_in_13 <= dff_out_12;			
dff_map_13:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_13, clk=>clk, reset=>reset, q=>dff_out_13);
			
dff_in_14 <= dff_out_13;			
dff_map_14:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_14, clk=>clk, reset=>reset, q=>dff_out_14);			
			
dff_in_15 <= dff_out_14;			
dff_map_15:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_15, clk=>clk, reset=>reset, q=>dff_out_15);		
			
dff_in_16 <= dff_out_15;			
dff_map_16:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_16, clk=>clk, reset=>reset, q=>dff_out_16);		
			
dff_in_17 <= dff_out_16;			
dff_map_17:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_17, clk=>clk, reset=>reset, q=>dff_out_17);
			
dff_in_18 <= dff_out_17;			
dff_map_18:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_18, clk=>clk, reset=>reset, q=>dff_out_18);
			
dff_in_19 <= dff_out_18;			
dff_map_19:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_19, clk=>clk, reset=>reset, q=>dff_out_19);
			
dff_in_20 <= dff_out_19;			
dff_map_20:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_20, clk=>clk, reset=>reset, q=>dff_out_20);
			
dff_in_21 <= dff_out_20;			
dff_map_21:	entity work.dff_N(dff_N_bhv)
			generic map(N=>16)
			port map(d=>dff_in_21, clk=>clk, reset=>reset, q=>dff_out_21);
			
-- Multiplication stages

mul_out_0 <= std_logic_vector(signed(x) * signed(c0));
mul_out_1 <= std_logic_vector(signed(dff_out_0) * signed(c1));
mul_out_2 <= std_logic_vector(signed(dff_out_1) * signed(c2));
mul_out_3 <= std_logic_vector(signed(dff_out_2) * signed(c3));
mul_out_4 <= std_logic_vector(signed(dff_out_3) * signed(c4));
mul_out_5 <= std_logic_vector(signed(dff_out_4) * signed(c5));
mul_out_6 <= std_logic_vector(signed(dff_out_5) * signed(c6));
mul_out_7 <= std_logic_vector(signed(dff_out_6) * signed(c7));
mul_out_8 <= std_logic_vector(signed(dff_out_7) * signed(c8));
mul_out_9 <= std_logic_vector(signed(dff_out_8) * signed(c9));
mul_out_10 <= std_logic_vector(signed(dff_out_9) * signed(c10));
mul_out_11 <= std_logic_vector(signed(dff_out_10) * signed(c11));
mul_out_12 <= std_logic_vector(signed(dff_out_11) * signed(c12));
mul_out_13 <= std_logic_vector(signed(dff_out_12) * signed(c13));
mul_out_14 <= std_logic_vector(signed(dff_out_13) * signed(c14));
mul_out_15 <= std_logic_vector(signed(dff_out_14) * signed(c15));
mul_out_16 <= std_logic_vector(signed(dff_out_15) * signed(c16));
mul_out_17 <= std_logic_vector(signed(dff_out_16) * signed(c17));
mul_out_18 <= std_logic_vector(signed(dff_out_17) * signed(c18));
mul_out_19 <= std_logic_vector(signed(dff_out_18) * signed(c19));
mul_out_20 <= std_logic_vector(signed(dff_out_19) * signed(c20));
mul_out_21 <= std_logic_vector(signed(dff_out_20) * signed(c21));
mul_out_22 <= std_logic_vector(signed(dff_out_21) * signed(c22));

-- Adder stage

add_out_0 <=	std_logic_vector(resize(signed(mul_out_0) + signed(mul_out_1), 33));
add_out_1 <=    std_logic_vector(signed(add_out_0) + signed(mul_out_2));
add_out_2 <=    std_logic_vector(signed(add_out_1) + signed(mul_out_3));
add_out_3 <=    std_logic_vector(signed(add_out_2) + signed(mul_out_4));
add_out_4 <=    std_logic_vector(signed(add_out_3) + signed(mul_out_5));
add_out_5 <=    std_logic_vector(signed(add_out_4) + signed(mul_out_6));
add_out_6 <=    std_logic_vector(signed(add_out_5) + signed(mul_out_7));
add_out_7 <=    std_logic_vector(signed(add_out_6) + signed(mul_out_8));
add_out_8 <=    std_logic_vector(signed(add_out_7) + signed(mul_out_9));
add_out_9 <=    std_logic_vector(signed(add_out_8) + signed(mul_out_10));
add_out_10 <=	std_logic_vector(signed(add_out_9) + signed(mul_out_11));
add_out_11 <=   std_logic_vector(signed(add_out_10) + signed(mul_out_12));
add_out_12 <=   std_logic_vector(signed(add_out_11) + signed(mul_out_13));
add_out_13 <=   std_logic_vector(signed(add_out_12) + signed(mul_out_14));
add_out_14 <=   std_logic_vector(signed(add_out_13) + signed(mul_out_15));
add_out_15 <=   std_logic_vector(signed(add_out_14) + signed(mul_out_16));
add_out_16 <=   std_logic_vector(signed(add_out_15) + signed(mul_out_17));
add_out_17 <=   std_logic_vector(signed(add_out_16) + signed(mul_out_18));
add_out_18 <=   std_logic_vector(signed(add_out_17) + signed(mul_out_19));
add_out_19 <=   std_logic_vector(signed(add_out_18) + signed(mul_out_20));
add_out_20 <=	std_logic_vector(signed(add_out_19) + signed(mul_out_21));
add_out_21 <=	std_logic_vector(signed(add_out_20) + signed(mul_out_22));  

-- Output update

y <= add_out_21(32 downto 17);

	
end fir_srrc_bhv;
