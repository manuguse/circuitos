library ieee;
use ieee.std_logic_1164.all;
 
entity Controle is port (
clock,ctrl: in std_logic;
sel: out std_logic_vector(1 downto 0));
end Controle;

architecture bhv of controle is
    type STATES is (E0,E1,E2,E3,E4,E5);
    signal EA, PE: STATES;


begin
    
    P1: process(clock)
    begin
    if (clock'event AND clock = '1') then
        EA <= PE;
        end if;
    end process;
    
    P2: process(EA,ctrl)
    begin
        case EA is

        when E0 => 
            sel <= "00";
            if ctrl ='1' then
                PE <= E1;
            elsif ctrl='0' then
                PE <= E2;
            end if;

        when E1 =>
            sel <= "11";
            if ctrl ='0' then
                PE <= E0;
            elsif ctrl='1' then
                PE <= E1;
            end if;

        when E2 =>
            sel <= "01";
            if ctrl ='0' then
                PE <= E3;
            elsif ctrl='1' then
                PE <= E0;
            end if;
        
        when E3 => 
            sel <= "01";
            if ctrl ='0' then
                PE <= E4;
            elsif ctrl='1' then
                PE <= E0;
            end if;

        when E4 => 
            sel <= "01";
            if ctrl ='0' then
                PE <= E5;
            elsif ctrl='1' then
                PE <= E0;
            end if;
            
        when E5 => 
            sel <= "01";
            PE <= E0;

        end case;
    end process;
end bhv;
