----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:42 04/02/2019 
-- Design Name: 
-- Module Name:    Controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller is
    Port ( int_bus : in  STD_LOGIC_VECTOR (7 downto 0);
			  rst : in STD_LOGIC;
           pc_inc : out  STD_LOGIC;
           pc_load : out  STD_LOGIC;
           mar_load : out  STD_LOGIC;
           op : out  STD_LOGIC_VECTOR (2 downto 0);
           r_w : out  STD_LOGIC;
           fetch : out  STD_LOGIC;
			  ci : in	STD_LOGIC;
			  clk : in STD_LOGIC
			  );
end Controller;

architecture Behavioral of Controller is

type state_type is (scan, ldi, ldm, ldm2, addi, addm, addm2, adci,
						  adcm, adcm2, xori, xorm, xorm2, stm, stm2, jmp,
						  jc, jnc, halt, reset);


signal c_s : state_type;

begin

	process (clk, rst) --Registers/Flip flops
	begin

		if(rst = '0') then --asyncronous reset
			
			c_s <= reset;
		elsif(rising_edge(clk)) then --updates registers on clk
			case c_s is
			
			when scan =>
				case int_bus is
				
				when X"01" =>
					c_s <= jmp;
				when X"02" =>
					c_s <= jc;
				when X"03" =>
					c_s <= jnc;
				when X"10" =>
					c_s <= ldi;
				when X"11" =>
					c_s <= addi;
				when X"12" =>
					c_s <= adci;
				when X"13" =>
					c_s <= xori;
				when X"20" =>
					c_s <= ldm;
				when X"21" =>
					c_s <= addm;
				when X"22" =>
					c_s <= adcm;
				when X"23" =>
					c_s <= xorm;
				when X"30" =>
					c_s <= stm;
				when others =>
					c_s <= halt;
						
				end case;
			when ldi =>
				c_s <= scan;
				
			when ldm =>
				c_s <= ldm2;
				
			when ldm2 =>
				c_s <= scan;
				
			when addi =>
				c_s <= scan;
				
			when addm =>
				c_s <= addm2;
				
			when addm2 =>
				c_s <= scan;
				
			when adci =>
				c_s <= scan;
				
			when adcm =>
				c_s <= adcm2;
				
			when adcm2 =>
				c_s <= scan;
				
			when xori =>
				c_s <= scan;
				
			when xorm =>
				c_s <= xorm2;
				
			when xorm2 =>
				c_s <= scan;
				
			when stm =>
				c_s <= stm2;
				
			when stm2 =>
				c_s <= scan;
				
			when jmp =>
				c_s <= scan;
				
			when jc =>
				c_s <= scan;
				
			when jnc =>
				c_s <= scan;
				
			when reset =>
				c_s <= scan;
				
			when halt =>
				c_s <= halt;
		
			end case;
	
		else
			c_s <= c_s;
		end if;

	end process;

	process(c_s, ci,rst)
	begin
		if(rst = '0') then
			pc_inc <= '0';
			pc_load <= '0';
			mar_load <= '0';
			fetch <= '1';
			op <= "011";
			r_w <= '1';
		else
			case c_s is
			when scan =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
				
			when ldi =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '1';
				op <= "100";
				r_w <= '1';
				
			when ldm =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '1';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
				
			when ldm2 =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '0';
				op <= "100";
				r_w <= '1';
				
			when addi =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '1';
				op <= "000";
				r_w <= '1'; --read is 1
				
			when addm =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '1';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
				
			when addm2 =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '0';
				op <= "000";
				r_w <= '1';
				
			when adci =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '1';
				op <= "001";
				r_w <= '1';	
				
			when adcm =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '1';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
				
			when adcm2 =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '0';
				op <= "001";
				r_w <= '1';
				
			when xori =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '1';
				op <= "010";
				r_w <= '1';	

			when xorm =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '1';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
				
			when xorm2 =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '0';
				op <= "010";
				r_w <= '1';
				
			when stm =>
				pc_inc <= '1';
				pc_load <= '0';
				mar_load <= '1';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
				
			when stm2 =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '0';
				op <= "011";
				r_w <= '0';
				
			when jmp =>
				pc_inc <= '0';
				pc_load <= '1';
				mar_load <= '0';
				fetch <= '1';
				op <= "011";
				r_w <= '1';	
				
			when jc =>
				if(ci = '1') then
					pc_inc <= '0';
					pc_load <= '1';
					mar_load <= '0';
					fetch <= '1';
					op <= "011";
					r_w <= '1';
				else
					pc_inc <= '1';
					pc_load <= '0';
					mar_load <= '0';
					fetch <= '1';
					op <= "011";
					r_w <= '1';
				end if;
			
			when jnc =>
				if(ci = '0') then
					pc_inc <= '0';
					pc_load <= '1';
					mar_load <= '0';
					fetch <= '1';
					op <= "011";
					r_w <= '1';
				else
					pc_inc <= '1';
					pc_load <= '0';
					mar_load <= '0';
					fetch <= '1';
					op <= "011";
					r_w <= '1';
				end if;	

			when halt =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '0';
				op <= "011";
				r_w <= '1';
				
			when reset =>
				pc_inc <= '0';
				pc_load <= '0';
				mar_load <= '0';
				fetch <= '1';
				op <= "011";
				r_w <= '1';
			end case;
		end if;
	end process;

end Behavioral;
 
