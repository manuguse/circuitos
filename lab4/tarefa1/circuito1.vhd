library IEEE;
use IEEE.Std_Logic_1164.all;

entity circuito1 is
port (A,B: in std_logic_vector(2 downto 0);
		F1, F2, F3, F4: out std_logic_vector(3 downto 0));
end circuito1;

architecture c1 of circuito1 is 
begin
	F1 <= '0' & A;
	F2 <= A & '0';
	F3 <= '0' & B;
	F4 <= B & '0';
end c1;
