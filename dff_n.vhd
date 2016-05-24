-------------------------------------------------------------------------------
-- (Behavioral)
--
-- File name : dff_N.vhdl
-- Purpose   : D Edged Triggered Flip Flop - Asynchronous Reset N version
--           :
-- Library   : IEEE
-- Author(s) : 
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY dff_N is

	generic (N : INTEGER:=4);	-- default value of N is 4
	port(	d          : in  std_logic_VECTOR (N-1 downto 0);
         	clk        : in  std_logic;
         	reset      : in  std_logic;
         	q          : out std_logic_VECTOR (N-1 downto 0));
END dff_N;

architecture dff_N_bhv of dff_N is

BEGIN
    DFF:process(clk, reset)
     begin
      IF (reset = '1') THEN
         q <= (others =>'0');
       ELSIF (clk'EVENT AND clk='1') THEN
         q <= d;
      END IF;
     END process DFF;

END dff_N_bhv;
