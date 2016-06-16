library ieee;
use ieee.std_logic_1164.all;


entity ram is
	generic(
		  width: integer;
		  n_words: integer);
		port(
			clock:   in  std_logic;
			data:    in  std_logic_vector(width downto 0);
			wr_addr: in  integer range 0 to n_words;
			rd_addr: in  integer range 0 to n_words;
			we:      in  std_logic;
			q:       out std_logic_vector(width downto 0));
end ram;

architecture a of ram is
		type mem is array(0 to n_words) of std_logic_vector(width downto 0);
		signal storage: mem;
begin
  	process(clock)
	begin
		if (clock'event and clock = '1') then
			if(we = '1') then
					storage(wr_addr) <= data;
			end if;
			q <= storage(rd_addr);
		end if;
	end process;
end a;
