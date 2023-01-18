library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_7_seg is
	port(
		in_s : in std_logic_vector(3 downto 0);
		out_s : out std_logic_vector(7 downto 0));
	
end entity bin_to_7_seg;

architecture arch of bin_to_7_seg is
	signal s_in : std_logic_vector(3 downto 0);
	begin
		s_in <= in_s;
		process(s_in)
		begin
			case(s_in) is
				when "0000" => out_s <= not("00111111");
				when "0001" => out_s <= not("00000110");
				when "0010" => out_s <= not("01011011");
				when "0011" => out_s <= not("01001111");
				when "0100" => out_s <= not("01100110");
				when "0101" => out_s <= not("01101101");
				when "0110" => out_s <= not("01111101");
				when "0111" => out_s <= not("01000111");
				when "1000" => out_s <= not("01111111");
				when "1001" => out_s <= not("01100111");
				when others => out_s <= "00000000";
			end case;
		end process;
end architecture;