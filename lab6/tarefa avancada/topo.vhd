library ieee;
use ieee.std_logic_1164.all;

entity topo is 
port (
	LEDR: out std_logic_vector(3 downto 0);
	CLOCK_50: in std_logic;
	KEY: in std_logic_vector(3 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	SW: in std_logic_vector(9 downto 0));
end topo;

architecture tp of topo is

	signal F: std_logic_vector(3 downto 0);
	signal C2Hz: std_logic;
	
	component frequencia is
	port (
		reset, clock: in std_logic;
		C2Hz: out std_logic);
	end component;
		
	component fsm is
	port(
		clock: in std_logic;
		reset: in std_logic;
		x: in std_logic;
		contagem: out std_logic_vector(3 downto 0));
	end component;
		
	component decod is
	port (
		C: in std_logic_vector(3 downto 0);      
		F: out std_logic_vector(6 downto 0));
	end component;
	
begin
		
	freq: frequencia port map(KEY(0), CLOCK_50, C2Hz);
	fsm_port: fsm port map(C2Hz, KEY(0), SW(0), F);
	decoder: decod port map(F, HEX0);
	LEDR <= F;
end tp;