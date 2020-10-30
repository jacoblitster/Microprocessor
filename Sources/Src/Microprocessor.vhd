----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:21 03/12/2019 
-- Design Name: 
-- Module Name:    Accumlator_ALU_Unit - Behavioral 
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

entity Microprocessor is
    Port (clk	: in STD_LOGIC;
			rst : in STD_LOGIC;
			data : inout STD_LOGIC_VECTOR(7 downto 0);
			r_w : out STD_LOGIC;
			address : out STD_LOGIC_VECTOR(7 downto 0));
	 
end Microprocessor;

architecture Behavioral of Microprocessor is

COMPONENT Dataflow
    PORT(
         fetch : IN  std_logic;
         mar_load : IN  std_logic;
         pc_inc : IN  std_logic;
         address_bus : OUT  std_logic_vector(7 downto 0);
			int_buses : out STD_LOGIC_VECTOR (7 downto 0);
         pc_load : IN  std_logic;
         op : IN  std_logic_vector(2 downto 0);
         r_w, rst : IN  std_logic;
         clk : IN  std_logic;
         co : OUT  std_logic;
         data : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

    COMPONENT Controller
    PORT(
         int_bus : IN  std_logic_vector(7 downto 0);
         pc_inc : OUT  std_logic;
         pc_load : OUT  std_logic;
         mar_load : OUT  std_logic;
         op : OUT  std_logic_vector(2 downto 0);
         r_w : OUT  std_logic;
         fetch : OUT  std_logic;
         ci : IN  std_logic;
			clk : in std_logic;
			rst : in std_logic
        );
    END COMPONENT;

signal op : STD_LOGIC_VECTOR (2 downto 0);
signal int_bus :	STD_LOGIC_VECTOR(7 downto 0);
signal co, r, pc_inc, pc_load, mar_load, fetch	:	STD_LOGIC;

begin

myDataflow	:	Dataflow PORT MAP (fetch => fetch, mar_load => mar_load, pc_inc => pc_inc, 
				address_bus => address, pc_load => pc_load, op => op, r_w => r, rst => rst, 
         clk => clk, co => co, data => data, int_buses => int_bus);
myController : Controller PORT MAP (int_bus => int_bus, pc_inc => pc_inc, pc_load => pc_load, 
				mar_load => mar_load, op => op, r_w => r,
				fetch => fetch, ci => co, clk => clk, rst => rst);
r_w <= r;

end Behavioral;

