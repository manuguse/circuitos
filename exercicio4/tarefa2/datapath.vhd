library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is port (
    I: in std_logic_vector(3 downto 0);
    sel: in std_logic_vector(1 downto 0);
    CLK, RST: in std_logic;
    saidaReg: out std_logic_vector(3 downto 0));
end Datapath;
        
architecture arqdtp of Datapath is
    
    signal Qmux, Q_reg, F1, F2, F3, F4, F: std_logic_vector(3 downto 0);
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

    begin
    
    registrador: reg port map(Qmux, CLK, RST, Q_reg);
    multiplex: mux port map(F1, F2, F3, F4, sel, Qmux);

    shr_in <= '0';
    shl_in <= '0';

    saidaReg <= Q_reg;

    F1 <= I; -- carrega
    F2 <= I + Q_reg; -- soma
    F3 <= shr_in&Q_reg(3 downto 1); -- shr
    F4 <= Q_reg(2 downto 0)&shl_in; -- shl

end arqdtp;