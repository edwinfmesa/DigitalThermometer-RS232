LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_div_freq IS
END tb_div_freq;
 
ARCHITECTURE behavior OF tb_div_freq IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div_freq
    PORT(
         clk : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;
 
BEGIN
   uut: div_freq PORT MAP (
          clk => clk,
          clk_out => clk_out
        );
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
END;
