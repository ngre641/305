library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity word_decoder_lives is
    port (
        column_select : in std_logic_vector(3 downto 0); 
        char_address  : out std_logic_vector(5 downto 0);
        h_count       : in std_logic_vector(9 downto 0); 
        v_count       : in std_logic_vector(9 downto 0) -- REMOVED semicolon here
    ); -- The closing parenthesis goes here
end word_decoder_lives;

architecture behavior of word_decoder_lives is
begin
    process(h_count, v_count, column_select)
    begin
        -- Define the Box: X from 10 to 100, Y from 10 to 40
        if (unsigned(h_count) >= 10 and unsigned(h_count) <= 100) and 
        (unsigned(v_count) >= 10 and unsigned(v_count) <= 40) then
            

        case column_select is 
            when "0000" => char_address <= "001100"; -- L
            when "0001" => char_address <= "001001"; -- I
            when "0010" => char_address <= "010110"; -- V
            when "0011" => char_address <= "000101"; -- E
            when "0100" => char_address <= "010011"; -- S
            when others => char_address <= "000000";
        end case;

        else
            -- This prevents the "Wallpaper" effect!
            char_address <= "000000"; 
        end if;
    end process;
end behavior;