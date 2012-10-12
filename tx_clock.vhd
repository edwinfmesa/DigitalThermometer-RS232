
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tx_clock is
	Port (   clk : IN  STD_LOGIC;
				dato_in: IN std_logic;
            dato_out : OUT  STD_LOGIC );
--				freq_out: OUT std_logic );
--				enable2: OUT std_logic);
end tx_clock;

architecture Behavioral of tx_clock is

COMPONENT div_freq
	PORT(
		clk_in : IN std_logic;          
		clk_out : OUT std_logic
		);
	END COMPONENT;

COMPONENT tx_module
	PORT(
		clk_div_freq : IN std_logic;
		dato : IN std_logic_vector(7 downto 0);
		enable_in : IN std_logic;          
		dato_serial : OUT std_logic
--		freq_out : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT rx_module
	PORT(
		clk_div_freq : IN std_logic;
		dato_serial : IN std_logic;          
		enable_out : OUT std_logic;
		dato : OUT std_logic_vector(7 downto 0)
--		aux_enable2 : OUT std_logic
		);
	END COMPONENT;

signal aux1: std_logic;
signal aux2: std_logic;
signal ENE: std_logic;
signal DA: std_logic_vector (7 downto 0);


begin

	Inst_div_freq: div_freq PORT MAP(
			clk_in => clk,
			clk_out => aux1
		);
		
	Inst_tx_module: tx_module PORT MAP(
		clk_div_freq => aux1,
		dato => DA,
		enable_in => ENE,
		dato_serial => dato_out
--		freq_out => freq_out
	);
	
	Inst_rx_module: rx_module PORT MAP(
		clk_div_freq => aux1,
		dato_serial => dato_in,
		enable_out => ENE,
		dato => DA
--		aux_enable2 => enable2
	);
	
end Behavioral;

