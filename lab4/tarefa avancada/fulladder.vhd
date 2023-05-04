library IEEE;
use IEEE.Std_logic_1164.all;
entity fulladder is 
	port (A, B, Cin: in std_logic; 
		  Sum, Cout: out std_logic);
end fulladder;

architecture fadder of fulladder is
	begin
		Sum <= (A xor B) xor Cin;
		Cout <= (A and B) or (Cin and (A xor B));
	end fadder;
