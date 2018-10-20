library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	generic(
		N_BITS : positive range 2 to positive'right
		);
	port(
		operand_1 : in std_logic_vector(N_BITS -1 downto 0); 	--N bit input 1
		operand_2 : in std_logic_vector(N_BITS - 1 downto 0);
		sum : out std_logic_vector(N_BITS downto 0)
		);
end entity adder;

architecture adder_generic_arc of adder is

	signal clock : std_logic;

begin

end adder_generic_arc;

