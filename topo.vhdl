library IEEE;
use IEEE.Std_Logic_1164.all;

entity topo is
port (
	CLOCK_1:in std_logic;	CLK_1Hz:in std_logic;
	KEY:in std_logic_vector(3 downto 0);     
    SW: in std_logic_vector(1 downto 0);
	LEDR:out std_logic_vector(17 downto 0));     
end topo;

architecture tp of topo is
	signal sig, N: std_logic_vector(1 downto 0);
	signal N1, N0, s1, s0: std_logic;

component registrador is
    port (D: in std_logic_vector(1 downto 0);  
		  CLK, RST: in std_logic;
	      H: out std_logic_vector(1 downto 0));
end component;

component combinacional is
	port (A,B, s1, s0: in std_logic;
	        F, N1, N0: out std_logic);
end component;

begin

    REG: registrador port map(N, CLOCK_1, KEY(0), sig);
	CB: combinacional port map(SW(1), SW(0), s1, s0, LEDR(0), N1, N0);

	s1 <= sig(1);
	s0 <= sig(0);
	N <= N1&N0;

	end tp;
