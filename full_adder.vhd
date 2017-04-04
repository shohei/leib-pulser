library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity full_adder is port (
	a : in STD_LOGIC;
	b : in STD_LOGIC;
	c : in STD_LOGIC;
	s : out STD_LOGIC;
	cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin

	s <= a xor b xor c;
	cout <= (a and b) or (b and c) or (c and a);

end Behavioral;
