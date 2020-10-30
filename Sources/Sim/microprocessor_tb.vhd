-- microprocessor_tb Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use IEEE.std_logic_unsigned.all;

  ENTITY microprocessor_tb IS
  END microprocessor_tb;

  ARCHITECTURE behavior OF microprocessor_tb IS 
  
  
constant op_halt: std_logic_vector(7 downto 0) := X"00";
constant op_jmp: std_logic_vector(7 downto 0) := X"01";
constant op_jc: std_logic_vector(7 downto 0) := X"02";
constant op_jnc: std_logic_vector(7 downto 0) := X"03";
constant op_ldi: std_logic_vector(7 downto 0) := X"10";
constant op_addi: std_logic_vector(7 downto 0) := X"11";
constant op_adci: std_logic_vector(7 downto 0) := X"12";
constant op_xori: std_logic_vector(7 downto 0) := X"13";
constant op_ldm: std_logic_vector(7 downto 0) := X"20";
constant op_addm: std_logic_vector(7 downto 0) := X"21";
constant op_adcm: std_logic_vector(7 downto 0) := X"22";
constant op_xorm: std_logic_vector(7 downto 0) := X"23";
constant op_stm: std_logic_vector(7 downto 0) := X"30";

  -- Component Declaration
          COMPONENT microprocessor
          PORT(
                  clk	: in STD_LOGIC;
						rst : in STD_LOGIC;
						data : inout STD_LOGIC_VECTOR(7 downto 0);
						r_w : out STD_LOGIC;
						address : out STD_LOGIC_VECTOR(7 downto 0)
                  );
          END COMPONENT;

          SIGNAL rst:  std_logic := '0';
			 SIGNAL r_w : std_logic;
			 signal clk : std_logic;
          SIGNAL data, address :  std_logic_vector(7 downto 0);
			 
			 constant clk_period : time := 100 ns;
			 
     type ram_type is array (0 to 255) of STD_LOGIC_VECTOR (7 downto 0);
signal ram: ram_type := (
op_ldi, X"9E", -- 00 LDI 9E
op_addi, X"AA", -- 02 ADDI AA (A = 48, C=1)
op_stm, X"3F", -- 04 STM 3F
op_adcm, X"3F", -- 06 ADCM 3F (A = 91, C = 0)
op_stm, X"3F", -- 08 STM 3F
op_adci, X"7B", -- 0A ADCI 7B (A = 0C, C = 1)
op_xorm, X"3F", -- 0C XORM 3F (A = 9D, C = 1)
op_adci, X"4A", -- 0E ADCI 4A (A = E8, C = 0)
op_stm, X"3E", -- 10 STM 3E
op_ldm, X"3F", -- 12 LDM 3F
op_xori, X"FF", -- 14 XORI FF
op_addm, X"3E", -- 16 ADDM 3E (C if [3E]>[3F])
op_jc, X"28", -- 18 JC 28
op_ldm, X"3E", -- 1A LDM 3E
op_xori, X"FF", -- 1C XORI FF
op_addm, X"3F", -- 1E ADDM 3F (C if [3F]>[3E])
op_jnc, X"2E", -- 20 JNC 2E (done)
op_addi, X"01", -- 22 ADDI 01
op_stm, X"3F", -- 24 STM 3F
op_jmp, X"12", -- 26 JMP 12 (top of loop)
op_addi, X"01", -- 28 ADDI 01
op_stm, X"3E", -- 2A STM 3E
op_jmp, X"12", -- 2C JMP 12 (top of loop)
op_halt, -- 2E HALT
others=>X"FF" );     

  BEGIN

  -- Component Instantiation
          uut: microprocessor PORT MAP(
                  clk => clk, 
						rst => rst,
						data => data,
						r_w => r_w,
						address => address
          );


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;



process (clk)
begin
 if clk'event and clk='1' then
 if r_w = '0' then
 ram(conv_integer(address))<=data;
 end if;
 end if;
end process;
data <= ram(conv_integer(address)) when r_w = '1' else "ZZZZZZZZ";


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
			rst <= '0';
        wait for 105 ns; -- wait until global set/reset completes

			rst <= '1';
        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
