library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter is
	generic(
		  n: integer);
	port (
		clk:  in  std_logic;
		q: out std_logic_vector(n downto 0));
end counter;

architecture a of counter is
	signal count: unsigned(n downto 0);
begin
	p: process(clk)
	begin
		if rising_edge(clk) then
			count <= count + 1;
		end if;
	end process p;
	q <= std_logic_vector(count);
end a;
