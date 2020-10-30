--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:04:18 04/09/2019
-- Design Name:   
-- Module Name:   E:/ALU/Microprocessor/Dataflow_tb.vhd
-- Project Name:  Microprocessor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Dataflow
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
 
ENTITY Dataflow_tb IS
END Dataflow_tb;
 
ARCHITECTURE behavior OF Dataflow_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dataflow
    PORT(
         fetch : IN  std_logic;
         mar_load : IN  std_logic;
         pc_inc : IN  std_logic;
         address_bus : OUT  std_logic_vector(7 downto 0);
         pc_load : IN  std_logic;
         op : IN  std_logic_vector(2 downto 0);
         r_w, rst : IN  std_logic;
         clk : IN  std_logic;
         co : OUT  std_logic;
         data : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal fetch : std_logic := '0';
   signal ld_mar : std_logic := '0';
   signal inc_pc : std_logic := '0';
   signal ld_pc : std_logic := '0';
   signal op : std_logic_vector(2 downto 0) := (others => '0');
   signal rd, wr: std_logic := '0';
   signal clk : std_logic := '0';
	signal rst : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal address_bus : std_logic_vector(7 downto 0);
   signal co : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dataflow PORT MAP (
          fetch => fetch,
          mar_load => ld_mar,
          pc_inc => inc_pc,
          address_bus => address_bus,
          pc_load => ld_pc,
          op => op,
          r_w => rd,
			 rst => rst,
          clk => clk,
          co => co,
          data => data
        );

  -- clock process
process
begin
clk <= '0';
wait for 10ns;
for i in 1 to 80 loop
clk <= not clk;
wait for 5ns;
end loop;
wait;
end process;
-- Stimulus process
process
begin


wait for 20 ns;
wait for 20 ns;
-- PC = 00, LDI 9E
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 5ns; rst <= '0'; wait for 6ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "100";
data <= "10011110"; rst <= '1'; wait for 10ns;
-- PC = 02, ADDI AA (A = 48, C=1)
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "000";
data <= "10101010"; wait for 10ns;
-- PC = 04, STO 3F
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111111"; wait for 10ns;
-- data should be "01001000"
rd <= '0'; wr <= '1'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "ZZZZZZZZ"; wait for 5ns;
assert data = "01001000" report "incorrect data value"; wait for 5ns;
-- PC = 06, ADC 3F (A = 91, C = 0)
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111111"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "001";
data <= "01001000"; wait for 10ns;
-- PC = 08, STO 3F
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111111"; wait for 10ns;
-- data should be "10010001"
rd <= '0'; wr <= '1'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "ZZZZZZZZ"; wait for 5ns;
assert data = "10010001" report "incorrect data value"; wait for 5ns;
-- PC = 0A ADCI 7B (A = 0C, C = 1)
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "001";
data <= "01111011"; wait for 10ns;
-- PC = 0C, XOR 3F (A = 9D, C = 1)
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111111"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "010";
data <= "10010001"; wait for 10ns;
-- PC = 0E, ADCI 4A (A = E8, C = 0)
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "001";
data <= "01001010"; wait for 10ns;
-- PC = 10, STO 3E
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111110"; wait for 10ns;
-- data should be "11101000"
rd <= '0'; wr <= '1'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "ZZZZZZZZ"; wait for 5ns;
assert data = "11101000" report "incorrect data value"; wait for 5ns;
-- PC = 12, LD 3F
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111111"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "100";
data <= "10010001"; wait for 10ns;
-- PC = 14, XORI FF
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "010";
data <= "11111111"; wait for 10ns;
-- PC = 16, ADD 3E (C =1)
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111110"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "000";
data <= "11101000"; wait for 10ns;
-- PC = 18, JC 28
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '0'; ld_pc <= '1'; ld_mar <= '0'; op <= "011";
data <= "00101000"; wait for 5ns;
assert address_bus = x"19" report "incorrect address value"; wait for 5ns;
-- PC = 28, ADDI 01
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "000";
data <= "00000001"; wait for 5ns;
assert address_bus = x"29" report "incorrect address value"; wait for 5ns;
-- PC = 2A, STO 3E
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '1'; op <= "011";
data <= "00111110"; wait for 10ns;
-- data should be 57
rd <= '0'; wr <= '1'; fetch <= '0'; inc_pc <= '0'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "ZZZZZZZZ"; wait for 5ns;
assert data = "01010111" report "incorrect data value"; wait for 5ns;
-- PC = 2C, JMP 12
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 10ns;
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '1'; ld_mar <= '0'; op <= "011";
data <= "00010010"; wait for 10ns;
-- PC = 12
rd <= '1'; wr <= '0'; fetch <= '1'; inc_pc <= '1'; ld_pc <= '0'; ld_mar <= '0'; op <= "011";
data <= "XXXXXXXX"; wait for 5ns;
assert address_bus = x"12" report "incorrect address value"; wait for 5ns;
wait;
end process;

END;
