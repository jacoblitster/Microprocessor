--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:27:21 02/26/2019
-- Design Name:   
-- Module Name:   C:/Users/brockwilson1/Xilinx/Arithmetic_Logic_Unit/Hold_Tb.vhd
-- Project Name:  Arithmetic_Logic_Unit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Hold
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
 
ENTITY Hold_Tb IS
END Hold_Tb;
 
ARCHITECTURE behavior OF Hold_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Hold
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         sum : OUT  std_logic_vector(7 downto 0);
         cin : IN  std_logic;
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(7 downto 0);
   signal co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Hold PORT MAP (
          a => a,
          b => b,
          sum => sum,
          cin => cin,
          co => co
        );
 
 
 process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= "00000000";
		b <= "00000000";
		cin <= '1';
		wait for 100 ns;
		
		a <= "01111111";
		b <= "10000001";
		cin <= '0';
		wait for 100 ns;
		
		a <= "10011010";
		b <= "01100101";
		cin <= '1';
		wait for 100 ns;
		
		a <= "01101011";
		b <= "10001111";
		cin <= '1';
		wait for 100 ns;
	 

      wait;
   end process;

END;
