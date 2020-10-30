--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:38:39 04/02/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/fetcher_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fetcher
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
 
ENTITY fetcher_tb IS
END fetcher_tb;
 
ARCHITECTURE behavior OF fetcher_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fetcher
    PORT(
         fetch : IN  std_logic;
         mars : IN  std_logic_vector(7 downto 0);
         pcs : IN  std_logic_vector(7 downto 0);
         address_bus : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal fetch : std_logic := '0';
   signal mars : std_logic_vector(7 downto 0) := (others => '0');
   signal pcs : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal address_bus : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fetcher PORT MAP (
          fetch => fetch,
          mars => mars,
          pcs => pcs,
          address_bus => address_bus
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		mars <= "10101010";
		pcs <= "01010101";
		fetch <= '1';
		
		wait for 100 ns;
		fetch <= '0';
		
		wait for 100 ns;
		pcs <= "00001111";
		
		wait for 100 ns;
		fetch <= '1'; 
		mars <= "11110000";

      -- insert stimulus here 

      wait;
   end process;

END;
