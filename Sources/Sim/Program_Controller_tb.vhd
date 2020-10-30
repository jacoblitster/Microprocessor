--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:28:56 03/26/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/Program_Controller_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Program_Counter
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
 
ENTITY Program_Controller_tb IS
END Program_Controller_tb;
 
ARCHITECTURE behavior OF Program_Controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_Counter
    PORT(
         load : IN  std_logic;
         inc : IN  std_logic;
         clk : IN  std_logic;
         outs : OUT  std_logic_vector(7 downto 0);
         ins : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT; 
    

   --Inputs
   signal load : std_logic := '0';
   signal inc : std_logic := '0';
   signal clk : std_logic := '0';
   signal ins : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal outs : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          load => load,
          inc => inc,
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
      wait for 10 ns;	

      load <= '1';
		ins <= "01010101";
		wait for 100 ns;
		
		load <= '0';
		wait for 100 ns;
		
		inc <= '1';
		wait for 200 ns;

      

      wait;
   end process;

END;
