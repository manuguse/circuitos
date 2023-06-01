library ieee;
use ieee.std_logic_1164.all;
entity fsm is 
port(
	clock: in std_logic;
	reset: in std_logic;
	x: in std_logic;
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
					if x = '0' then pe <= E1; else pe <= E4; end if;
				when E1 =>
					contagem <= "0010";
					if x = '0' then pe <= E2; else pe <= E0; end if;
				when E2 =>
					contagem <= "0011";
					if x = '0' then pe <= E3; else pe <= E1; end if;
				when E3 =>
					contagem <= "0100";
					if x = '0' then pe <= E4; else pe <= E2; end if;
				when E4 =>
					contagem <= "0101";
					if x = '0' then pe <= E0; else pe <= E3; end if;
			end case;
		end process;
	end bhv;
