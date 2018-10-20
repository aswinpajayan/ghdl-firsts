Library ieee;
use ieee.std_logic_1164.all;

entity half_adder is 
	port(a,b:in bit; sum, carry:out bit);
end half_adder;

architecture struct_arc of half_adder is
begin
	sum<= a xor b;
	carry<= a and b;
	end struct_arc;

