----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:00:18 04/09/2019 
-- Design Name: 
-- Module Name:    Dataflow - Behavioral 
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

entity Dataflow is
    Port ( fetch : in  STD_LOGIC;
           mar_load : in  STD_LOGIC;
           pc_inc : in  STD_LOGIC;
           address_bus : out  STD_LOGIC_VECTOR (7 downto 0);
			  int_buses : out STD_LOGIC_VECTOR (7 downto 0);
           pc_load : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           r_w : in  STD_LOGIC;
			  rst	: in STD_LOGIC;
           clk : in  STD_LOGIC;
           co : out  STD_LOGIC;
           data : inout  STD_LOGIC_VECTOR (7 downto 0));
end Dataflow;

architecture Behavioral of Dataflow is

COMPONENT ALU
Port ( 
	a : in  STD_LOGIC_VECTOR (7 downto 0);
   b : in  STD_LOGIC_VECTOR (7 downto 0);
   sum : out  STD_LOGIC_VECTOR (7 downto 0);
   cin : in  STD_LOGIC;
   co : out  STD_LOGIC;
   op : in  STD_LOGIC_VECTOR (2 downto 0)
	);
END COMPONENT;

COMPONENT ACCUMULATOR
Port ( 
	sum : in  STD_LOGIC_VECTOR (7 downto 0);
   result : out  STD_LOGIC_VECTOR (7 downto 0);
   cin : in  STD_LOGIC;
   cout : out  STD_LOGIC;
	clk	:	in	STD_LOGIC;
	rst :	in STD_LOGIC
	);
END COMPONENT;

COMPONENT TRISTATE
Port ( 
	data : inout  STD_LOGIC_VECTOR (7 downto 0);
   result : in  STD_LOGIC_VECTOR (7 downto 0);
	r_w : in STD_LOGIC;
	int_bus : out STD_LOGIC_VECTOR (7 downto 0)
	);
END COMPONENT;	

COMPONENT MAR
Port ( load : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outs : out  STD_LOGIC_VECTOR (7 downto 0);
			  rst :	in STD_LOGIC;
           ins : in  STD_LOGIC_VECTOR (7 downto 0)
			  );
END COMPONENT;		

COMPONENT Program_Counter
 PORT(
		load : IN  std_logic;
		inc : IN  std_logic;
		clk : IN  std_logic;
		outs : OUT  std_logic_vector(7 downto 0);
		rst :	in STD_LOGIC;
		ins : IN  std_logic_vector(7 downto 0)
	  );
 END COMPONENT; 	  
 
 COMPONENT fetcher
    Port ( fetch : in  STD_LOGIC;
           mars : in  STD_LOGIC_VECTOR (7 downto 0);
           pcs : in  STD_LOGIC_VECTOR (7 downto 0);
           address_bus : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

signal sum, results, int_bus, mars, pcs	:	STD_LOGIC_VECTOR(7 downto 0);
signal c1, c2:	STD_LOGIC;


begin

int_buses <= int_bus;
myAccumulator	:	Accumulator port map(sum => sum, result => results, cin => c1, cout => c2, rst => rst, clk => clk);
myALU	:	ALU port map(a => results, b => int_bus, sum => sum, cin => c2, co => c1, op => op);
myTristate : Tristate port map(data => data, result => results, r_w => r_w, int_bus => int_bus); 
myMAR : MAR port map(load => mar_load, clk => clk, outs => mars, ins => int_bus, rst => rst);
myPC	:	Program_Counter port map(load => pc_load, inc => pc_inc, clk => clk, outs => pcs, ins => int_bus, rst => rst);
myFetcher	: fetcher port map(fetch => fetch, mars => mars, pcs => pcs, address_bus => address_bus);


co <= c2;

end Behavioral;

