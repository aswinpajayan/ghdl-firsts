use std.textio.all; -- Imports the standard library for textio methods
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--This is where we design the Entity , notice that there are no ports
entity hello_world_entity is 
	end hello_world_entity;

--the below part is similar to a function defintion
architecture behaviour of hello_world_entity is
begin
	process
		variable l : line;
	begin
		write(l,String'("Hello world from hdl"));
		writeline(output, l);
		wait;
	end process;
end behaviour;


entity heart_beat is 
	port( clk_out: out std_logic);
--this is the list of input and ouput port for this partticular entity
end heart_beat;

--heart_beat entity just generates an out clock, the definition is given below

architecture behaviour of heart_beat is 
begin
--given below is a definition for a clock process 
	clk_process: process 
	begin
		clk_out <= '0';
		wait for clk_period/2;
	end process;
end behaviour;


