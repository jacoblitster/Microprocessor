----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:12 03/26/2019 
-- Design Name: 
-- Module Name:    MAR - Behavioral 
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

entity MAR is
    Port ( load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outs : out  STD_LOGIC_VECTOR (7 downto 0);
           ins : in  STD_LOGIC_VECTOR (7 downto 0);
			  rst	:	in STD_LOGIC);
end MAR;

architecture Behavioral of MAR is

signal c_s : STD_LOGIC_VECTOR (7 downto 0);

begin

outs <= c_s;

	process(rst,clk)
	begin
		if(rst = '0') then
			c_s <= "00000000";
		elsif(rising_edge(clk)) then
			if(load = '1') then
				c_s <= ins;
			else
				c_s <= c_s;
			end if;
		end if;

	end process;

end Behavioral;

