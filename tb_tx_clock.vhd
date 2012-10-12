LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_tx_clock IS
END tb_tx_clock;
 
ARCHITECTURE behavior OF tb_tx_clock IS 
 
    COMPONENT tx_clock
    PORT(
         clk : IN  std_logic;
         enable : IN  std_logic;
			dato_in: in std_logic:='0';
			dato_in2: in std_logic_vector(7 downto 0);
         dato_serial : OUT  std_logic;
			freq_out: out std_logic
        );
    END COMPONENT;
    
	signal dato_in: std_logic;
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
	signal dato_in2: std_logic_vector(7 downto 0);
   signal dato_serial : std_logic;
	signal freq_out: std_logic;
 
BEGIN
			
   uut: tx_clock PORT MAP (
          clk => clk,
          enable => enable,
			 dato_in2 => dato_in2,
          dato_serial => dato_serial,
			 freq_out  => freq_out
        ); 
		  
	dato_process :process
   begin
		dato_in2 <= "11000001";
		wait;
   end process;  

	enable_process :process
   begin
		enable <='0';
		wait for 6000 ns;
		enable <= '1'; 
		wait for 93 us;
		enable <= '0'; 
		wait for 20000 ns;
		enable <= '1'; 
		wait for 93 us;
		enable <= '0'; 
		wait;
   end process;
	  
	 
   clk_process :process
   begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
   end process;
   

END;
