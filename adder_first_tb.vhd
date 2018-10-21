entity adder_first_tb is 
end adder_first_tb; 
--test benches must begin with an empty entity
-- beacuse all vhdl files are supposed to have an entity

--test becnhes are written in behavioural modelas 
-- we can execute sequential instructions 
--this test bench uses , test by assertion  
architecture test_by_assertion of adder_first_tb is

--component is like an black box which just have a set of pins(ports) , each of which can be input, output , inout or buffer.	
--additionaly a component may have a set of generic values(example when if you use make a generic N BIT adder ) more details can be found here at https://www.ics.uci.edu/~jmoorkan/vhdlref/generics.html
	--this port names has to be exactly same as that of work.adder 
	component adder_comp is port(
		a,b :in bit;
		sum,carry : out bit);
	end component;
	

	--here we are making an instance <adder_inst>  of the component <adder_comp>. 
	--notice that during component instantiation we are assigning the entity<work.adder>
	-- and the architecture to be used by the entity in parenthesis <struct_arc> - in this  case  
	for adder_inst0:adder_comp use entity work.half_adder(struct_arc);
	--Please refer to the component instantiation 
	--(http://web.engr.oregonstate.edu/~traylor/ece474/vhdl_lectures/component_instantiaton.pdf)
	signal s_a , s_b,s_sum,s_carry : bit;
	-- these signals are for interconnection instantiate on need basis
	begin 
		adder_inst0: adder_comp port map(a =>s_a,
						b => s_b,
						sum => s_sum,
						carry =>s_carry);
	--component instatiation 
	--notice that pin_a (adder_inst0 is wired to signals 
	

	--now we sequentially give the inputs and check for outputs 
	process
		type pattern_type is 
			record --we are defining the bits inside record <patter-type> here
 				input_a,input_b:bit;
				expected_sum,expected_carry:bit;
			end record;
		--we have done something similar to a type def in c, cpp
		--now pattern_type is a data type which can be used store the inout patterns
		--ie the truth table of the half-adder 
		
		type pattern_array is array (natural range <>) of pattern_type;
		--storing the truth table 
		constant patterns : pattern_array :=
			( ('0', '0','0', '0'),
	  		  ('0', '1','1', '0'),
	  		  ('1', '0','1', '0'),
	 		  ('1', '1','0', '1'));
		begin --begin sequential operations 
			for i in patterns'range loop
				 --setting the signal values from pattern 
				 s_a <= patterns(i).input_a;
				 s_b <= patterns(i).input_b;
				 --wait for results 
				 wait for 10 ns ;
				 assert s_sum = patterns(i).expected_sum;
					report "sum defers from expected value" severity error;
				assert s_carry = patterns(i).expected_carry;
					report "carry defers from expected value" severity error;
			end loop;
			assert false report "end of test" severity note;
			wait; --wait forever
		end process; 
end test_by_assertion;
 
		
