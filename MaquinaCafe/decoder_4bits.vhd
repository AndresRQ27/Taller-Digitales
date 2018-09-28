library ieee;

use ieee.std_logic_1164.all;
 
ENTITY decoder_4bits is
Port ( BCDin : in STD_LOGIC_VECTOR (3 downto 0);
Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0));
end decoder_4bits;
 
architecture Behavioral of decoder_4bits is
 
begin
 
process(BCDin)
begin
 
case BCDin is
when "0000" =>
Seven_Segment <= "0000001"; ---0
when "0001" =>
Seven_Segment <= "1001111"; ---1
when "0010" =>
Seven_Segment <= "0010010"; ---2
when "0011" =>
Seven_Segment <= "0000110"; ---3
when "0100" =>
Seven_Segment <= "1001100"; ---4
when "0101" =>
Seven_Segment <= "0100100"; ---5
when "0110" =>
Seven_Segment <= "0100000"; ---6
when "0111" =>
Seven_Segment <= "0001111"; ---7
when "1000" =>
Seven_Segment <= "0000000"; ---8
when "1001" =>
Seven_Segment <= "0000100"; ---9
when "1010" =>
Seven_Segment <= "0001000"; ---A
when "1011" =>
Seven_Segment <= "1100000"; ---B
when "1100" =>
Seven_Segment <= "0110001"; ---C
when "1101" =>
Seven_Segment <= "1000010"; ---D
when "1110" =>
Seven_Segment <= "0110000"; ---E
when "1111" =>
Seven_Segment <= "0111000"; ---F
when others =>
Seven_Segment <= "1111111"; ---Default
end case;
 
end process;
 
end Behavioral;