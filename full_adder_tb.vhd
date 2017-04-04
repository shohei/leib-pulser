library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity full_adder_tb is

end full_adder_tb;

architecture Behavioral of full_adder_tb is
	component full_adder port (
		a : in STD_LOGIC;
		b : in STD_LOGIC;
		c : in STD_LOGIC;
		s : out STD_LOGIC;
		cout : out STD_LOGIC);
	end component;

	signal a : STD_LOGIC;
	signal b : STD_LOGIC;
	signal c : STD_LOGIC;
	signal s : STD_LOGIC;
	signal cout : STD_LOGIC;

begin
	u0: full_adder port map (
		a => a,
		b => b,
		c => c,
		s => s,
		cout => cout);

process
	type pattern_type is record
		a : STD_LOGIC;
		b : STD_LOGIC;
		c : STD_LOGIC;
		s : STD_LOGIC;
		cout : STD_LOGIC;
	end record;

	type pattern_array is array (natural range <>) of pattern_type;
	constant patterns : pattern_array :=
	(('0','0','0','0','0'),
	('0','0','1','1','0'),
	('0','1','0','1','0'),
	('0','1','1','0','1'),
	('1','0','0','1','0'),
	('1','0','1','0','1'),
	('1','1','0','0','1'),
	('1','1','1','1','1'));

begin
	for i in patterns'range loop
		a <= patterns(i).a;
		b <= patterns(i).b;
		c <= patterns(i).c;
		wait for 1 ns;
		assert patterns(i).s = s and patterns(i).cout = cout
		report "wrong result for patterns " & integer'image(i) severity error;
	end loop;

	assert false report "end of test" severity note;
	wait;

end process;
end Behavioral;
