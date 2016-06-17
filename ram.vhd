library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram is
		
	port(
		clock:   in  std_logic;
		data:    in  std_logic_vector(31 downto 0);
		wr_addr: in  integer range 0 to 1023;
		rd_addr: in  integer range 0 to 1023;
		we:      in  std_logic;
		q:       out std_logic_vector(31 downto 0)
	);

end ram;

architecture a of ram is
	type mem is array(0 to 1023) of std_logic_vector(31 downto 0);
	signal storage: mem := (X"0000000f", X"0000000a");
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
