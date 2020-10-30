----------------------------------------------------------------------------------
-- Course: ECE 2700
-- Engineer: Jacob Litster and Brock Wilson
-- 
-- Create Date:    13:27:08 02/26/2019 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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

entity Adder is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           co : out  STD_LOGIC
			  );
end Adder;

architecture Behavioral of Adder is

signal int_co : STD_LOGIC_VECTOR(6 downto 0);

begin


	sum(0) <= a(0) XOR b(0);
	int_co(0) <= a(0) AND b(0);

	sum(1) <= a(1) XOR b(1) XOR int_co(0);
	int_co(1) <= (a(1) AND b(1)) OR ((a(1) XOR b(1)) AND int_co(0));

	sum(2) <= a(2) XOR b(2) XOR int_co(1);
	int_co(2) <= (a(2) AND b(2)) OR ((a(2) XOR b(2)) AND int_co(1));

	sum(3) <= a(3) XOR b(3) XOR int_co(2);
	int_co(3) <= (a(3) AND b(3)) OR ((a(3) XOR b(3)) AND int_co(2));

	sum(4) <= a(4) XOR b(4) XOR int_co(3);
	int_co(4) <= (a(4) AND b(4)) OR ((a(4) XOR b(4)) AND int_co(3));

	sum(5) <= a(5) XOR b(5) XOR int_co(4);
	int_co(5) <= (a(5) AND b(5)) OR ((a(5) XOR b(5)) AND int_co(4));

	sum(6) <= a(6) XOR b(6) XOR int_co(5);
	int_co(6) <= (a(6) AND b(6)) OR ((a(6) XOR b(6)) AND int_co(5));

	sum(7) <= a(7) XOR b(7) XOR int_co(6);
	co <= (a(7) AND b(7)) OR ((a(7) XOR b(7)) AND int_co(6));


end Behavioral;

