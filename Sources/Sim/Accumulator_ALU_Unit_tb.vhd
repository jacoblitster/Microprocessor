--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:44:35 03/12/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/Accumulator_ALU_Unit_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Accumlator_ALU_Unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Accumulator_ALU_Unit_tb IS
END Accumulator_ALU_Unit_tb;
 
ARCHITECTURE behavior OF Accumulator_ALU_Unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Accumlator_ALU_Unit
    PORT(
         operand : IN  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(7 downto 0);
         op : IN  std_logic_vector(2 downto 0);
         clk : IN  std_logic;
			co	:	OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand : std_logic_vector(7 downto 0) := (others => '0');
   signal op : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';
	

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
	signal co	:	std_logic;
	
   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Accumlator_ALU_Unit PORT MAP (
          operand => operand,
          result => result,
          op => op,
          clk => clk,
			 co => co
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		operand <= x"AA";
		op <= "100";
		
		wait for 100 ns;
		
		operand <= x"BB";
		op <= "011";
		
		wait for 100 ns;
		
		operand <= x"AA";
		op <= "011";
		
		wait for 100 ns;
		
		operand <= x"BB";
		op <= "000";
		
		wait for 100 ns;
		
		operand <= x"CC";
		op <= "100";
		
		wait for 100 ns;
		
		operand <= x"AA";
		op <= "100";
	

      wait for clk_period*10;

      -- insert stimulus here 

     
   end process;

END;
