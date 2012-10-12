
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_tx_module IS
END tb_tx_module;
 
ARCHITECTURE behavior OF tb_tx_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_module
    PORT(
         clk_div_freq : IN  std_logic;
         dato : IN  std_logic_vector(7 downto 0);
         enable_in : IN  std_logic;
         dato_serial : OUT  std_logic;
         freq_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_div_freq : std_logic := '0';
   signal dato : std_logic_vector(7 downto 0) := "11110000";
   signal enable_in : std_logic := '0';

 	--Outputs
   signal dato_serial : std_logic;
   signal freq_out : std_logic;

   -- Clock period definitions
   constant clk_div_freq_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_module PORT MAP (
          clk_div_freq => clk_div_freq,
          dato => dato,
          enable_in => enable_in,
          dato_serial => dato_serial,
          freq_out => freq_out
        );

   -- Clock process definitions
   clk_div_freq_process :process
   begin
		clk_div_freq <= '0';
		wait for 4340 ns;
		clk_div_freq <= '1';
		wait for 4340 ns;
   end process;
 
	enable_process :process
   begin
		enable_in <='0';
		wait for 6500 ns;
		enable_in <= '1'; 
		wait for 90000 ns;
		enable_in <= '0'; 
		wait ;
   end process;
	
	
END;
