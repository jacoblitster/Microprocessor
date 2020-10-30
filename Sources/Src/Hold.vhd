----------------------------------------------------------------------------------
-- Course: ECE 2700
-- Engineer: Jacob Litster and Brock Wilson 
-- 
-- Create Date:    14:01:55 02/26/2019 
-- Design Name: 
-- Module Name:    Hold - Behavioral 
-- Project Name: ALU
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

entity Hold is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           co : out  STD_LOGIC;
			  cin : in  STD_LOGIC
           );
end Hold;

architecture Behavioral of Hold is

begin

	co <= cin;

	sum <= a;


end Behavioral;

