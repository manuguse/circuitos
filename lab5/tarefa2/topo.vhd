library IEEE;
use IEEE.Std_Logic_1164.all;

entity topo2 is
port (
	CLOCK_50:in std_logic;
	CLK_500Hz:in std_logic;
	KEY:in std_logic_vector(3 downto 0);     
	SW:in std_logic_vector(17 downto 0);     
	LEDR:out std_logic_vector(17 downto 0);     
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0));
end topo2;

architecture tp of topo2 is 
	signal F1, F2, F3, F4, F, G, H: std_logic_vector(3 downto 0);

component multiplexador is
    port (
		sel: in std_logic_vector(9 downto 8);  
		w,x,y,z: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(3 downto 0));
end component;
	
component somador is
    port  (
		A: in std_logic_vector(3 downto 0);      
		B: in std_logic_vector(3 downto 0);
		F: out std_logic_vector(3 downto 0));
end component;

component registrador is
	port (
		D: in std_logic_vector(3 downto 0);  
		EN, CLK, RST: in std_logic;
	   H: out std_logic_vector(3 downto 0));
end component;

component decoder is
    port (
		C: in std_logic_vector(3 downto 0);      
		F: out std_logic_vector(6 downto 0));
end component;

begin
	
	F1 <= '0' & SW(2 downto 0);
	F2 <= SW(2 downto 0) & '0';
	F3 <= '0' & SW(6 downto 4);
	F4 <= SW(6 downto 4) & '0';
	
	MUX: multiplexador port map(SW(9 downto 8), F1, F2, F3, F4, F);
	SUM: somador port map(F1, F, G);
	REG: registrador port map(G, KEY(1), CLOCK_50, KEY(0), H);
	DEC0: decoder port map(H, HEX0);
	DEC3: decoder port map('0'&SW(6 downto 4), HEX3);
	DEC2: decoder port map('0'&SW(2 downto 0), HEX2);
	
	LEDR(3 downto 0) <= H;

end tp;
