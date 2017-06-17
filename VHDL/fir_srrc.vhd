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
-- Description : VHDL implementation of a Square Root Raised Cosine (SRRC) FIR
--				 filter. In particular, the architecture follows the
--				 specification of a generic symmetrical form FIR filter.
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

-- Entity Description
entity fir_srrc is
	port(
		clk		:	in	std_logic;	-- Clock signal
		reset	:	in	std_logic;  -- Reset signal
		x		:	in	std_logic_vector(15 downto 0);	-- Input signal
		y 		:	out	std_logic_vector(18 downto 0)	-- Output signal
	);
end fir_srrc;

-- Architecture Description
architecture fir_srrc_bhv of fir_srrc is

-- Coefficients definition (Using the symmetrical form we just need half of the
-- coefficients)
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
type mul_out_array is array (0 to 11) of std_logic_vector(32 downto 0);
signal	mul_out		:	mul_out_array;

-- Adders output lines
type add_out_array is array (0 to 10) of std_logic_vector(16 downto 0);
signal	add_out		:	add_out_array;

-- Last adder output line	
signal	add_last	:	std_logic_vector(32 downto 0); 

begin
	
-- Registers declarations and mappings.

reg_gen: for i in 0 to 21 generate
	
	-- First register
	dff_0: if i = 0 generate
		dff_in(i) <= x;
	end generate dff_0;
	
	-- Other registers
	dff_n: if i > 0 generate
		dff_in(i) <= dff_out(i-1);
	end generate dff_n;
	
	-- Mapping for a generic register
	dff_d:	
		entity work.dff_N(dff_N_bhv)
		generic map (N=>16)
		port map (d=>dff_in(i), clk=>clk, reset=>reset, q=>dff_out(i));
			
end generate reg_gen;

	-- Output register
oreg_map:
	entity work.dff_N(dff_N_bhv)
	generic map (N=>19)
	port map (d=>add_last(32 downto 14), clk=>clk, reset=>reset, q=>y);

-- Adder stages. The first adder takes as input the filter input and the output
-- of the first register. The others have both inputs from the registers.

adder_stage:	for i in 0 to 10 generate
	
	first_add: if i = 0 generate
		add_out(i) <= std_logic_vector(resize(signed(x), 17) + 
			resize(signed(dff_out(21-i)), 17));
	end generate first_add;
	
	other_add: if i > 0 generate
		add_out(i) <= std_logic_vector(resize(signed(dff_out(i-1)), 17) + 
			resize(signed(dff_out(21-i)), 17));
	end generate other_add;
	
end generate adder_stage;
			
-- Multiplication stages. We have to distinguish the first 10 multiplications
-- and the last one becouse it takes directly the output of the register as
-- input.

mul_stage: for i in 0 to 11 generate
	
	
	other_mul: if i < 11 generate
		mul_out(i) <= std_logic_vector(signed(add_out(i))*c(i)); 
	end generate other_mul;
	
	last_mul: if i = 11 generate
		mul_out(i) <= std_logic_vector(resize(signed(dff_out(i-1)),17)*c(i));
	end generate last_mul;
	
end generate mul_stage;

-- Final adder stage

add_last <= std_logic_vector(signed(mul_out(0)) + signed(mul_out(1)) +
							 signed(mul_out(2)) + signed(mul_out(3)) +
							 signed(mul_out(4)) + signed(mul_out(5)) +
							 signed(mul_out(6)) + signed(mul_out(7)) +
							 signed(mul_out(8)) + signed(mul_out(9)) +
							 signed(mul_out(10)) + signed(mul_out(11)));
	
end fir_srrc_bhv;