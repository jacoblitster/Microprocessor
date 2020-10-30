--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:02:08 03/26/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/Tristate_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Tristate
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
 
ENTITY Tristate_tb IS
END Tristate_tb;
 
ARCHITECTURE behavior OF Tristate_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tristate
    PORT(
         data : INOUT  std_logic_vector(7 downto 0);
         result : IN  std_logic_vector(7 downto 0);
			int_bus : OUT std_logic_vector(7 downto 0);
         r_w : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal result : std_logic_vector(7 downto 0) := (others => '0');
   signal r_w : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(7 downto 0);
 
	--Outputs
	signal int_bus : std_logic_vector(7 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tristate PORT MAP (
          data => data,
          result => result,
          r_w => r_w,
			 int_bus => int_bus
        );
 

   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      r_w <= '0';
		result <= "00001111";
		wait for 100 ns;
		
		r_w <= '1';
		result <= "11110000";
		wait for 100 ns; 
     
		data <= "10101010";

      wait;
   end process;

END;
