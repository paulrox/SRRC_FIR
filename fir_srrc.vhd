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
type coeff is array (0 to 11) of signed(15 downto 0);
constant c		:	coeff := (	to_signed(-271, 16),
								to_signed(-246, 16),
								to_signed(253, 16),
								to_signed(694, 16),
								to_signed(253, 16),
								to_signed(-1229, 16),
								to_signed(-2570, 16),
								to_signed(-1739, 16),
								to_signed(2569, 16),
								to_signed(9479, 16),
								to_signed(15966, 16),
								to_signed(18622, 16));

-- Registers input lines
type dff_input_array is array (0 to 21) of std_logic_vector(15 downto 0);
signal	dff_in		:	dff_input_array;

-- Registers output lines
type dff_output_array is array (0 to 21) of std_logic_vector(15 downto 0);
signal	dff_out		:	dff_output_array;

-- Multiplication stages output lines 
type mul_out_array is array (0 to 11) of std_logic_vector(31 downto 0);
signal	mul_out		:	mul_out_array;

-- Adders output lines
type add_out_array is array (0 to 10) of std_logic_vector(15 downto 0);
signal	add_out		:	add_out_array;

-- Last adder output line
signal	add_last	:	std_logic_vector(31 downto 0);

begin

-- Adder stage

adder_stage:	for i in 0 to 10 generate
	
	add_out(i) <= std_logic_vector(signed(dff_out(i)) + 
	signed(dff_out(21-i)));
	
end generate adder_stage;
			
-- Multiplication stages
mul_stage: for i in 0 to 11 generate
	
	last_mul: if i = 11 generate
		mul_out(i) <= std_logic_vector(signed(dff_out(i-1)) * 
		signed(c(i)));
	end generate last_mul;
		
	other_mul: if i < 11 generate
		mul_out(i) <= std_logic_vector(signed(add_out(i)) * 
		signed(c(i))); 
	end generate other_mul;
	
end generate mul_stage;

-- Registers mapping

reg_gen: for i in 0 to 21 generate
	
	dff_0: if i = 0 generate
		dff_in(i) <= x;
	end generate dff_0;
	
	dff_n: if i > 0 generate
		dff_in(i) <= dff_out(i-1);
	end generate dff_n;
	
	dff_d:	
		entity work.dff_N(dff_N_bhv)
		generic map (N=>16)
		port map (d=>dff_in(i), clk=>clk, reset=>reset, q=>dff_out(i));
			
end generate reg_gen;

-- Final adder stage

add_last <= std_logic_vector(signed(mul_out(0)) + signed(mul_out(1)) +
							signed(mul_out(2)) + signed(mul_out(3)) +
							signed(mul_out(4)) + signed(mul_out(5)) +
							signed(mul_out(6)) + signed(mul_out(7)) +
							signed(mul_out(8)) + signed(mul_out(9)) +
							signed(mul_out(10)) + signed(mul_out(11)));

-- Output update

--y <= std_logic_vector(shift_left(signed(add_last(31 downto 16)), 2));

y <= add_last(31 downto 16);
	
end fir_srrc_bhv;
