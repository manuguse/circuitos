library IEEE;
use IEEE.Std_logic_1164.all;

entity modb is 
	port (I0, I1, I2: in std_logic; 
	      R: out std_logic);
end modb;

architecture modb of modb is
	begin
            R <= ((not I1) and I0) or ((not I0) and I2);
	end modb;
