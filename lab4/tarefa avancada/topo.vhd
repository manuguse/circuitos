library IEEE;
use IEEE.Std_Logic_1164.all;

entity topo is
port (SW: in std_logic_vector(9 downto 0);
	  HEX0, HEX1: out std_logic_vector(6 downto 0));
end topo;

architecture tp of topo is 
    signal res, comp, sig1: std_logic_vector(3 downto 0);

component somasub is
    port (
        SW: in std_logic_vector(9 downto 0);
        res: out std_logic_vector(3 downto 0));
end component;
	
component compl2 is
    port (
        X: in std_logic_vector(3 downto 0);
        Y: out std_logic_vector(3 downto 0));
end component;

component multiplexador is
    port (
        sel: in std_logic;  
        w,x: in std_logic_vector(3 downto 0);
        saida: out std_logic_vector(3 downto 0));
end component;

component decoder is
    port (
        C: in std_logic_vector(3 downto 0);      
        F: out std_logic_vector(6 downto 0));
    end component;

begin

SS: somasub port map(SW(9 downto 0), res);
C22: compl2 port map(res, comp);
MUX: multiplexador port map(res(3), res, comp, sig1);
DEC: decoder port map(sig1, HEX0(6 downto 0));


HEX1(6 downto 0) <= "1111111" when res(3) = '0' else
                    "0111111" when res(3) = '1';

end tp;
