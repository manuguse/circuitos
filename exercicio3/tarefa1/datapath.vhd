library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is port (
    SW: in std_logic_vector(9 downto 0);
    KEY: in std_logic_vector(1 downto 0);
    LEDR: out std_logic_vector(3 downto 0);
    HEX0: out std_logic_vector(6 downto 0));
end Datapath;
        
architecture arqdtp of Datapath is
    
    signal Qmux, Q_reg, F1, F2, F3, F4, F, I: std_logic_vector(3 downto 0);
    signal Q_decod: std_logic_vector(6 downto 0);
    signal sel: std_logic_vector(1 downto 0);
    signal shr_in, shl_in: std_logic;

    component reg is
        port (D: in std_logic_vector(3 downto 0);  
              CLK, RST: in std_logic;
              H: out std_logic_vector(3 downto 0));
    end component;

    component mux is
        port (F1,F2,F3,F4: in std_logic_vector(3 downto 0);
              sel: in std_logic_vector(1 downto 0);
              F: out std_logic_vector(3 downto 0));
    end component;

    component decod is
        port (C: in std_logic_vector(3 downto 0);
              F: out std_logic_vector(6 downto 0));
    end component;
    
    begin
    
    registrador: reg port map(Qmux, KEY(1), KEY(0), Q_reg);
    multiplex: mux port map(F1, F2, F3, F4, sel, Qmux);
    decoder: decod port map(Q_reg, Q_decod);

    I <= SW(3 downto 0);
    shr_in <= SW(4);
    shl_in <= SW(5);
    sel <= SW(9 downto 8);

    F1 <= I; -- carrega
    F2 <= I + Q_reg; -- soma
    F3 <= shr_in&Q_reg(3 downto 1); -- shr
    F4 <= Q_reg(2 downto 0)&shl_in; -- shl
      
    LEDR <= Q_reg(3 downto 0);
    HEX0 <= Q_decod;

end arqdtp;
