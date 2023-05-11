library IEEE;
use IEEE.Std_Logic_1164.all;

entity multiplexador is
port  (sel: in std_logic_vector(9 downto 8);  
		w,x,y,z: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(3 downto 0));

end multiplexador;

architecture mux of multiplexador is
begin
	saida <= w when sel = "00" else
				x when sel = "01" else
				y when sel = "10" else
				z; -- 11
end mux;