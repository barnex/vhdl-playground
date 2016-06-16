-- Top-level entity for the DE0-Nano-SoC (Atlas SoC) board.
-- Defines how the core is wired to the baseboard.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.prescaler;
use work.counter;

entity DE0_Nano_SoC is
	port (
		CLOCK_50: in   std_logic;
		KEY:      in   std_logic_vector(1 downto 0);
		LED:      out  std_logic_vector(7 downto 0);
		SW:       in   std_logic_vector(3 downto 0);
		GPIO_0: inout std_logic_vector(35 downto 0);
		GPIO_1: inout std_logic_vector(35 downto 0));
end DE0_Nano_SoC;

architecture a of DE0_Nano_SoC is
	signal slow_clk: std_logic;
begin

	prescale: entity prescaler generic map(25000000) port map(CLOCK_50, slow_clk);
	count: entity counter generic map(7) port map(slow_clk, LED);	

end a;
