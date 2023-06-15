library IEEE;
use IEEE.Std_Logic_1164.all;

entity reg is
port (D: in std_logic_vector(3 downto 0);  
	  CLK, RST: in std_logic;
	  H: out std_logic_vector(3 downto 0));
end reg;

architecture reg of reg is
begin 
	process(CLK, D, RST)
	begin
		if (RST = '1') then H <= "0000";
		elsif (CLK'event and CLK = '1') then H <= D;
		end if;
	end process;
end reg;
