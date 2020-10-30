--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:57:40 03/26/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/MAR_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MAR
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
 
ENTITY MAR_tb IS
END MAR_tb;
 
ARCHITECTURE behavior OF MAR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAR
    PORT(
         load : IN  std_logic;
         clk : IN  std_logic;
         outs : OUT  std_logic_vector(7 downto 0);
         ins : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal load : std_logic := '0';
   signal clk : std_logic := '0';
   signal ins : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal outs : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAR PORT MAP (
          load => load,
          clk => clk,
          outs => outs,
          ins => ins
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

      load <= '0';
		ins <= "10101010";
		wait for 100 ns;
		
		load <= '1';
		wait for 100 ns;
		
		load <= '0';
		wait for 200 ns;
		
		ins <= "11110000";
		wait for 100 ns;

      wait;
   end process;

END;
