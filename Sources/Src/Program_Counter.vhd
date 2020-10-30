----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:36 03/26/2019 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

entity Program_Counter is
    Port ( load : in  STD_LOGIC;
           inc : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           outs : out  STD_LOGIC_VECTOR (7 downto 0);
           ins : in  STD_LOGIC_VECTOR (7 downto 0);
			  rst	: in STD_LOGIC);
end Program_Counter;

architecture Behavioral of Program_Counter is

signal c_s : STD_LOGIC_VECTOR (7 downto 0);
signal incs : STD_LOGIC_VECTOR(7 downto 0);
signal int_co : STD_LOGIC_VECTOR(6 downto 0);

begin


	outs <= c_s;
	incs(0) <= NOT c_s(0);
	int_co(0) <= c_s(0);

	incs(1) <= c_s(1) XOR int_co(0);
	int_co(1) <= c_s(1) AND int_co(0);

	incs(2) <= c_s(2) XOR int_co(1);
	int_co(2) <= c_s(2) AND int_co(1);

	incs(3) <= c_s(3) XOR int_co(2);
	int_co(3) <= c_s(3) AND int_co(2);

	incs(4) <= c_s(4) XOR int_co(3);
	int_co(4) <= c_s(4) AND int_co(3);

	incs(5) <= c_s(5) XOR int_co(4);
	int_co(5) <= c_s(5) AND int_co(4);

	incs(6) <= c_s(6) XOR int_co(5);
	int_co(6) <= c_s(6) AND int_co(5);
	
	incs(7) <= c_s(7) XOR int_co(6);
			
	process(rst, clk)
	begin
		if(rst = '1') then
			if(rising_edge(clk)) then
			
				if(load = '1') then
					c_s <= ins;
				
				elsif(inc = '1') then
					c_s <= incs;
				
				else
					c_s <= c_s;
				
				end if;
			end if;
		else
			c_s <= "00000000";
		end if;
		
	end process;

end Behavioral;

