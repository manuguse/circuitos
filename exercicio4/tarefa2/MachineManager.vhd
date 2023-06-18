
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity MachineManager is port (
        LEDR: out std_logic_vector(9 downto 0);
        CLK_1: in std_logic;
        KEY: in std_logic_vector(3 downto 0);
        HEX0: out std_logic_vector(6 downto 0);
        SW: in std_logic_vector(9 downto 0));
end MachineManager;

architecture arqmachine of MachineManager is
        signal Q_reg, entradaI: std_logic_vector(3 downto 0); -- declaração dos sinais
	signal sel: std_logic_vector(1 downto 0);
        signal Q_decod: std_logic_vector(6 downto 0);

component Datapath is port (
        I: in std_logic_vector(3 downto 0);
        sel: in std_logic_vector(1 downto 0);
        CLK, RST: in std_logic;
        saidaReg: out std_logic_vector(3 downto 0));
end component;

component decod is port (
        C:  in std_logic_vector(3 downto 0);
        F:  out std_logic_vector(6 downto 0));
end component;

component Controle is port (
        clock,ctrl, rst: in std_logic;
        sel: out std_logic_vector(1 downto 0));
end component;

begin

L1: datapath port map (entradaI, sel, CLK_1, KEY(0), Q_reg);
L2: decod port map (Q_reg, Q_decod);
L3: controle port map (CLK_1, SW(0), key(0),sel);

entradaI <= "0001"; 
ledr(3 downto 0)<= Q_reg;
Hex0 <= Q_decod;

end arqmachine;
