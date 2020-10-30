----------------------------------------------------------------------------------
-- Course: ECE 2700
-- Engineer: Jacob Litster and Brock Wilson
-- 
-- Create Date:    15:25:01 02/26/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           co : out  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (2 downto 0));
end ALU;

architecture Behavioral of ALU is

signal	add 	: STD_LOGIC_VECTOR (8 downto 0);
signal	addC 	: STD_LOGIC_VECTOR (8 downto 0);
signal	ExOR 	: STD_LOGIC_VECTOR (8 downto 0);
signal	Holds 	: STD_LOGIC_VECTOR (8 downto 0);
signal	Loads	: STD_LOGIC_VECTOR (8 downto 0);

    COMPONENT Adder
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT AdderC
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic;
			cin: in	STD_LOGIC
        );
    END COMPONENT;
	 
	 COMPONENT ExclusiveOR
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic;
			cin: in	STD_LOGIC
        );
    END COMPONENT;
	 
	 COMPONENT Hold
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic;
			cin: in	STD_LOGIC
        );
    END COMPONENT;
	 
    COMPONENT Load
    PORT(
         b : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic;
			cin: in	STD_LOGIC
        );
    END COMPONENT;	 

    COMPONENT Mux
    PORT(
         add : IN  std_logic_vector(8 downto 0);
         addC : IN  std_logic_vector(8 downto 0);
         ExOR : IN  std_logic_vector(8 downto 0);
         Hold : IN  std_logic_vector(8 downto 0);
         Load : IN  std_logic_vector(8 downto 0);
         op : IN  std_logic_vector(2 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;

begin

myAdd		: Adder port map(a => a, b => b, sum => add(7 downto 0), co => add(8));
myAddC	: AdderC port map(a => a, b => b, sum => addC(7 downto 0), co => addC(8), cin => cin);
myXOR		: ExclusiveOR port map(a => a, b => b, sum => ExOR(7 downto 0), co => ExOR(8), cin => cin);
myHold	: Hold port map(a => a, sum => Holds(7 downto 0), co => Holds(8), cin => cin);
myLoad	: Load port map(b => b, sum => Loads(7 downto 0), co => Loads(8), cin => cin);

myMux		: Mux port map(add => add, addC => addC, ExOR => ExOR, Hold => Holds, Load => Loads, op => op, sum => sum, co => co);

end Behavioral;

