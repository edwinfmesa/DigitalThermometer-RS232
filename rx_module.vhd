library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rx_module is
Port (     clk_div_freq : in  STD_LOGIC;
			  dato_serial: in std_logic ;
			  enable_out: out STD_LOGIC:= '0';
           dato : out  STD_LOGIC_vector (7 downto 0):= "00000000" );
--			  aux_enable2: out std_logic );
end rx_module;

architecture Behavioral of rx_module is

signal cont: integer range 0 to 7 :=0;
--signal cont2: std_logic:='0';
--signal cont3: std_logic:='0';
signal cont4: integer range 0 to 7 :=0;
signal enable2: std_logic:='0';
signal aux: std_logic_vector (7 downto 0);

begin
process(clk_div_freq, dato_serial)
	begin
--			aux_enable2 <= enable2;
			if enable2 = '0' then
				if falling_edge(dato_serial) then
					if cont4 = 0 then
						enable2 <= '1';
						cont4 <= 1;
					end if;
				end if;
			elsif rising_edge(clk_div_freq) then
					cont <= cont4;
					if cont >= 1 and cont <= 8 then
--						if cont3 = '1' then
							if enable2 = '1' then
								dato(cont - 1) <= dato_serial;
								cont <= cont + 1;
							end if;
--						else
--							cont3 <= '1';
--						end if;
					elsif cont >= 9 and cont <= 18 then 
						enable_out <= '1';
						cont <= cont +1;
					elsif cont >=19 then 
						enable2 <= '0';
						cont <= 0;
						enable_out <= '0';
					end if;
			end if; 
end process;

end Behavioral; 

