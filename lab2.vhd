library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity lab2 is
	port(
		clk : in std_logic ;
		rst : in std_logic ;
		seg : out std_logic_vector(23 downto 0);
		button : in std_logic);
		
end entity lab2;
	
architecture arch of lab2 is
	component lab2_sys is
		port (
			button_external_connection_export : in  std_logic                     := 'X'; -- export
			clk_clk                           : in  std_logic                     := 'X'; -- clk
			reset_reset_n                     : in  std_logic                     := 'X'; -- reset_n
			seg_0_external_connection_export  : out std_logic_vector(11 downto 0)         -- export
		);
	end component lab2_sys;

		component bin_to_7_seg is
					port (
						in_s : in std_logic_vector(3 downto 0);
						out_s : out std_logic_vector(7 downto 0)
					);
		end component bin_to_7_seg;

	 signal in_bin : std_logic_vector(11 downto 0);
	
begin


	u0 : component lab2_sys
		port map (
			button_external_connection_export =>button, -- button_external_connection.export
			clk_clk                           => clk,                           --                        clk.clk
			reset_reset_n                     => rst,                     --                      reset.reset_n
			seg_0_external_connection_export  => in_bin   --  seg_0_external_connection.export
		);


		u1 : component bin_to_7_seg
			port map(
				in_s => in_bin(3 downto 0),
				out_s => seg(7 downto 0)
			);
		
		u2 : component bin_to_7_seg
			port map(
				in_s => in_bin(7 downto 4),
				out_s => seg(15 downto 8)
			);
		
		u3 : component bin_to_7_seg
			port map(
				in_s => in_bin(11 downto 8),
				out_s=> seg(23 downto 16)
			);
end architecture;