library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tx_module is
    Port ( clk_div_freq : in  STD_LOGIC;
			  dato: in std_logic_vector (7 downto 0);
			  enable_in: in STD_LOGIC;
           dato_serial : out  STD_LOGIC);
--			  freq_out: out std_logic);
end tx_module;

architecture Behavioral of tx_module is

signal cont: integer range 0 to 7;
signal cont2: std_logic:='0';
signal enable2: std_logic:= '0';
signal enable3: std_logic:= '0';

begin
	process(clk_div_freq, enable_in, dato)
			 begin
--			 freq_out <= clk_div_freq;
				enable2 <= enable_in;
				
				if enable2 = '0' then
					dato_serial <= '1';
					cont <= 7;
					cont2 <= '0';
				elsif enable2 = '1' then  
					if rising_edge(clk_div_freq) then
						if cont2 = '1' then
			 				if cont >= 0 and cont <= 7  then
								dato_serial <= dato(7 - cont);
								cont <= cont - 1; 
							else
								dato_serial <= '1';
							end if;
						else
							dato_serial <= '0';
							cont2 <= '1'; 
						end if;
					end if;
				end if;
	end process;

end Behavioral;