
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_global IS
END tb_global;
 
ARCHITECTURE behavior OF tb_global IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_clock
    PORT(
         clk : IN  std_logic;
         dato_in : IN  std_logic;
         dato_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal dato_in : std_logic ;

 	--Outputs 
   signal dato_out : std_logic;

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_clock PORT MAP (
          clk => clk,
          dato_in => dato_in,
          dato_out => dato_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
 
	dato_in_process :process
   begin
		dato_in <= '1';
		wait for 10000 ns;
		dato_in <= '0';
		wait for 8680 ns;
		
		dato_in <= '1';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '1';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '1';
		wait for 8680 ns;
		dato_in <= '0';
		
		wait for 8680 ns;
		dato_in <= '1';
		wait for 8.68 us;
		
		dato_in <= '0';
		wait for 8680 ns;
		
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '0';
		wait for 8680 ns;
		dato_in <= '1';
		wait for 8680 ns;
		dato_in <= '0';
		
		wait for 8680 ns;
		dato_in <= '1';
		
		wait;
   end process;

END;
