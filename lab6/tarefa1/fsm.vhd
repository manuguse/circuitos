library ieee;
use ieee.std_logic_1164.all;
entity fsm is 
port(
	clock: in std_logic;
	reset: in std_logic;
	contagem: out std_logic_vector(3 downto 0));
end fsm;

architecture bhv of fsm is 
	type STATES is (E0, E1, E2, E3, E4);
	signal EA, PE: STATES; 

	begin
		P1: process(clock, reset)
		begin
			if reset = '0' then EA <= E0;
			elsif clock'event and clock = '0' then EA <= PE;
			end if;
		end process;
		
		P2: process(EA)
		begin
		
			case EA is
				when E0 =>
					contagem <= "0001";
					pe <= E1;
				when E1 =>
					contagem <= "0010";
					pe <= E2;
				when E2 =>
					contagem <= "0011";
					pe <= E3;
				when E3 =>
					contagem <= "0100";
					pe <= E4;
				when E4 =>
					contagem <= "0101";
					pe <= E0;
					
			end case;
		end process;
	end bhv;
