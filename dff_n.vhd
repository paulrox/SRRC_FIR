-------------------------------------------------------------------------------
--
-- Title       : dff_n
-- Design      : FIR_SRRC
-- Author      : Paolo Sassi
-- Company     : University of Pisa
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\DSS_Project\src\dff_n.vhd
-- Generated   : Sat May 21 10:56:40 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Implementation of a Flip Flop D-Edge Triggered with generic
--				 architecture and asynchronous active high reset.
--
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- Entity Description
entity dff_N is

	generic (N : INTEGER:=4);	-- default value of N is 4
	port(	d          : in  std_logic_VECTOR (N-1 downto 0); -- FF input
         	clk        : in  std_logic;	-- Clock Signal
         	reset      : in  std_logic;	-- Reset Signal(Active high)
         	q          : out std_logic_VECTOR (N-1 downto 0)); -- FF output
end dff_N;

-- Architecture Description
architecture dff_N_bhv of dff_N is

begin
    dff:process(clk, reset)
     begin
      if (reset = '1') then
		 -- When the reset signal is active, set the output to 0
         q <= (others =>'0');
       elsif (clk'EVENT AND clk='1') then
         q <= d;
      end if;
     end process dff;

end dff_N_bhv;
