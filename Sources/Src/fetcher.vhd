----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:46 04/02/2019 
-- Design Name: 
-- Module Name:    fetcher - Behavioral 
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

entity fetcher is
    Port ( fetch : in  STD_LOGIC;
           mars : in  STD_LOGIC_VECTOR (7 downto 0);
           pcs : in  STD_LOGIC_VECTOR (7 downto 0);
           address_bus : out  STD_LOGIC_VECTOR (7 downto 0));
end fetcher;

architecture Behavioral of fetcher is

begin

	process(fetch, mars, pcs)
	begin
	
		if(fetch = '0') then
			address_bus <= mars;
		else
			address_bus <= pcs;
		end if;
		
	end process;
	
end Behavioral;

