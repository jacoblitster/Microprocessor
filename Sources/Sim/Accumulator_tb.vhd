--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:05:28 03/12/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/Accumulator_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Accumulator
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
 
ENTITY Accumulator_tb IS
END Accumulator_tb;
 
ARCHITECTURE behavior OF Accumulator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Accumulator
    PORT(
         sum : IN  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(7 downto 0);
         cin : IN  std_logic;
         cout : OUT  std_logic;
			clk	: IN	std_logic;
			clk_en :	IN std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sum : std_logic_vector(7 downto 0) := (others => '0');
   signal cin : std_logic := '0';
	signal clk	:	std_logic;
	signal clk_en	:	std_logic := '1';
	
 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal cout : std_logic;
	
 
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Accumulator PORT MAP (
          sum => sum,
          result => result,
          cin => cin,
          cout => cout,
			 clk => clk,
			 clk_en => clk_en
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
		
		sum <= x"AA";
		cin <= '1';
		
		wait for 100 ns;	
		
		sum <= x"BB";
		cin <= '0';
		
		wait for 100 ns;	
		
		sum <= x"8C";
		cin <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      
   end process;

END;
