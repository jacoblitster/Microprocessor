----------------------------------------------------------------------------------
-- Course: ECE 2700
-- Engineer: Jacob Litster and Brock Wilson 
-- 
-- Create Date:    13:57:21 02/26/2019 
-- Design Name: 
-- Module Name:    ExclusiveOR - Behavioral 
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

entity ExclusiveOR is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           co : out  STD_LOGIC;
           cin : in  STD_LOGIC);
end ExclusiveOR;

architecture Behavioral of ExclusiveOR is

begin


	co <= cin;

	sum(0) <= a(0) XOR b(0);

	sum(1) <= a(1) XOR b(1);

	sum(2) <= a(2) XOR b(2);

	sum(3) <= a(3) XOR b(3);

	sum(4) <= a(4) XOR b(4);

	sum(5) <= a(5) XOR b(5);

	sum(6) <= a(6) XOR b(6);

	sum(7) <= a(7) XOR b(7);


end Behavioral;

