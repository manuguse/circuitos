library IEEE;
use IEEE.Std_Logic_1164.all;

entity somasub is
port (SW: in std_logic_vector(9 downto 0);
	  res: out std_logic_vector(3 downto 0));
end somasub;

architecture ss of somasub is
    signal SG0, SG1, SG2, SG3, R0, R1, R2, R3, S, S1, S2, S3, S0: std_logic;

    component fulladder is
        port (A, B, Cin: in std_logic; 
              Sum, Cout: out std_logic);
	end component;

	component modb is
        port (I0, I1, I2: in std_logic; 
              R: out std_logic);
	end component;

	begin 
    
		FA0: fulladder port map(SW(0), R0, SW(8), S0, SG0);
        FA1: fulladder port map(SW(1), R1, SG0, S1, SG1);
        FA2: fulladder port map(SW(2), R2, SG1, S2, SG2);
        FA3: fulladder port map(SW(3), R3, SG2, S3, SG3);

        MD0: modb port map(SW(4), SW(8), SW(9), R0);
		MD1: modb port map(SW(5), SW(8), SW(9), R1);
        MD2: modb port map(SW(6), SW(8), SW(9), R2);
        MD3: modb port map(SW(7), SW(8), SW(9), R3);

        res(0) <= S0;
        res(1) <= S1;
        res(2) <= S2;
        res(3) <= S3;
end ss;
