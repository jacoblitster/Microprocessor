--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:15:54 02/26/2019
-- Design Name:   
-- Module Name:   C:/Users/brockwilson1/Xilinx/Arithmetic_Logic_Unit/Mux_Tb.vhd
-- Project Name:  Arithmetic_Logic_Unit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux
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
 
ENTITY Mux_Tb IS
END Mux_Tb;
 
ARCHITECTURE behavior OF Mux_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal add : std_logic_vector(8 downto 0) := (others => '0');
   signal addC : std_logic_vector(8 downto 0) := (others => '0');
   signal ExOR : std_logic_vector(8 downto 0) := (others => '0');
   signal Hold : std_logic_vector(8 downto 0) := (others => '0');
   signal Load : std_logic_vector(8 downto 0) := (others => '0');
   signal op : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal sum : std_logic_vector(7 downto 0);
   signal co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          add => add,
          addC => addC,
          ExOR => ExOR,
          Hold => Hold,
          Load => Load,
          op => op,
          sum => sum,
          co => co
        );

process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		add  <= '1' & x"56";
		addC <= '1' & x"95";
		ExOR <= '1' & x"cf";
		Hold <= '0' & x"4d";
		Load <= '0' & x"3b";
		
		op <= "000";
		wait for 100 ns;

		op <= "001";
		wait for 100 ns;
		
		op <= "010";
		wait for 100 ns;
		
		op <= "011";
		wait for 100 ns;
		
		op <= "100";
		wait for 100 ns;
		
		op <= "101";
		wait for 100 ns;
		
		op <= "110";
		wait for 100 ns;
		
		
		op <= "111";
		wait for 100 ns;


      wait;
   end process;

END;
