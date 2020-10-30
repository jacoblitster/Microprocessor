----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:14 03/12/2019 
-- Design Name: 
-- Module Name:    Accumulator - Behavioral 
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

entity Accumulator is
    Port ( sum : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
			  clk	:	in	STD_LOGIC;
			  rst : in STD_LOGIC);
end Accumulator;

architecture Behavioral of Accumulator is

begin

	process(rst, clk)
	begin
		if(rst = '1') then
		
			if(rising_edge(clk)) then
		
			result <= sum;
			cout <= cin;
		
			end if;
		else 
			result <= "00000000";
			cout <= '0';
		end if;
	end process;

end Behavioral;

