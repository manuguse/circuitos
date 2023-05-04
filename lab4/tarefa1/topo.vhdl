library IEEE;
use IEEE.Std_Logic_1164.all;

entity topo is
port (SW: in std_logic_vector(9 downto 0);
		LEDR: out std_logic_vector(3 downto 0);
		HEX0: out std_logic_vector(6 downto 0));
end topo;

architecture tp of topo is 
	signal F1,F2,F3,F4,F,G: std_logic_vector(3 downto 0);
	
component circuito1 is
port (A,B: in std_logic_vector(2 downto 0);
		F1, F2, F3, F4: out std_logic_vector(3 downto 0));
end component;

component multiplexador is
port  (sel: in std_logic_vector(9 downto 8);  
		w,x,y,z: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(3 downto 0));
end component;

component somador is
port  (A: in std_logic_vector(3 downto 0);      
		 B: in std_logic_vector(3 downto 0);
		 F:out std_logic_vector(3 downto 0));
end component;

component decoder is
port (C: in std_logic_vector(3 downto 0);      
		F: out std_logic_vector(6 downto 0));
end component;

begin

C1: circuito1 port map (SW(2 downto 0), SW(6 downto 4), F1, F2, F3, F4);
MUX: multiplexador port map (SW(9 downto 8), F1, F2, F3, F4, F);
SUM: somador port map (F1, F, G);
DEC: decoder port map (G, HEX0(6 downto 0));

LEDR(3 downto 0) <= G;

end tp;
