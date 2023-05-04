library IEEE;
use IEEE.Std_Logic_1164.all;

entity multiplexador is
port   (sel: in std_logic;  
		w,x: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(3 downto 0));

end multiplexador;

architecture mux of multiplexador is
begin
	saida <= w when sel = '0' else
			 x when sel = '1';
end mux;
