library ieee;
use ieee.std_logic_1164.all;


entity ram is
		port(
			clock:   in  std_logic;
			data:    in  std_logic_vector(31 downto 0);
			wr_addr: in  integer range 0 to 31;
			rd_addr: in  integer range 0 to 31;
			we:      in  std_logic;
			q:       out std_logic_vector(31 downto 0));
end ram;

