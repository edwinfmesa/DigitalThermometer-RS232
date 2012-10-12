
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_rx_module IS
END tb_rx_module;
 
ARCHITECTURE behavior OF tb_rx_module IS 
 
    COMPONENT rx_module
    PORT(
         clk_div_freq : IN  std_logic;
         dato_serial : IN  std_logic;
         enable_out : OUT  std_logic;
         dato : OUT  std_logic_vector(7 downto 0);
			aux_enable2: out std_logic 
        );
    END COMPONENT;
    

   signal clk_div_freq : std_logic := '0';
   signal dato_serial : std_logic := '0';
	signal enable_out : std_logic;
   signal dato : std_logic_vector(7 downto 0);
	signal aux_enable2: std_logic ;

 
BEGIN 
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx_module PORT MAP (
          clk_div_freq => clk_div_freq,
          dato_serial => dato_serial,
          enable_out => enable_out,
          dato => dato,
			 aux_enable2 => aux_enable2
        );

   -- Clock process definitions
   clk_div_freq_process :process
   begin
		clk_div_freq <= '0';
		wait for 10 ns;
		clk_div_freq <= '1';
		wait for 10 ns;
   end process;
 
	dato_serial_process :process
   begin
		dato_serial <= '1';
		wait for 134 ns;
		dato_serial <= '0';
		wait for 20 ns;
		
		dato_serial <= '1';
		wait for 20 ns;
		dato_serial <= '0';
		wait for 20 ns;
		dato_serial <= '1';
		wait for 20 ns;
		dato_serial <= '0';
		wait for 20 ns;
		dato_serial <= '1';
		wait for 20 ns;
		dato_serial <= '0';
		wait for 20 ns;
		dato_serial <= '1';
		wait for 20 ns;
		dato_serial <= '0';
		
		wait for 20 ns;
		dato_serial <= '1';
		wait;
   end process;
  

END;
