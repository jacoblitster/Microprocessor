----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:38:45 03/26/2019 
-- Design Name: 
-- Module Name:    Tristate - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tristate is
    Port ( data : inout  STD_LOGIC_VECTOR (7 downto 0);
           result : in  STD_LOGIC_VECTOR (7 downto 0);
			  r_w : in STD_LOGIC;
			  int_bus : out STD_LOGIC_VECTOR (7 downto 0)
			  );
end Tristate; 

architecture Behavioral of Tristate is

--signal a : STD_LOGIC_VECTOR (7 downto 0);

begin
 
	process(r_w, data, result)
	begin
	
		if (r_w = '0') then
			data <= result;
			int_bus <= result;
		else
			data <= "ZZZZZZZZ"; 
			int_bus <= data;
		end if;
		
	
	end process;	
end Behavioral;

