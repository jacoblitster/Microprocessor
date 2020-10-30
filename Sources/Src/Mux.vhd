----------------------------------------------------------------------------------
-- Course: ECE 2700
-- Engineer: Jacob Litster and Brock Wilson
-- 
-- Create Date:    14:33:41 02/26/2019 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
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

entity Mux is
    Port ( add : in  STD_LOGIC_VECTOR (8 downto 0);
           addC : in  STD_LOGIC_VECTOR (8 downto 0);
			  ExOR : in  STD_LOGIC_VECTOR (8 downto 0);
			  Hold : in  STD_LOGIC_VECTOR (8 downto 0);
			  Load : in  STD_LOGIC_VECTOR (8 downto 0);
			  op : in  STD_LOGIC_VECTOR (2 downto 0);
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           co : out  STD_LOGIC);
end Mux;



architecture Behavioral of Mux is

begin

	process(op, add, addC, ExOR, Hold, Load) 
	begin
		case op is

		when "000" => 

			sum <= add(7 downto 0);
			co <= add(8);


		when "001" =>  

			sum <= addC(7 downto 0);
			co <= addC(8);


		when "010" => 

			sum <= ExOR(7 downto 0);
			co <= ExOR(8);


		when "011" => 

			sum <= Hold(7 downto 0);
			co <= Hold(8);


		when "100" => 

			sum <= Load(7 downto 0);
			co <= Load(8);


		when others =>

			sum <= "00000000";
			co <= '0';


		end case;
	end process;
end Behavioral;

