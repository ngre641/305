library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity word_decoder_score is
    port (
        -- I'm keeping this here so your box has a clean label in the schematic
        column_select : in std_logic_vector(2 downto 0); 
        char_address  : out std_logic_vector(5 downto 0);
        h_count       : in std_logic_vector(9 downto 0); 
        v_count       : in std_logic_vector(9 downto 0) -- FIXED: Semicolon removed
    );
end word_decoder_score;

architecture behavior of word_decoder_score is
begin
    process(h_count, v_count, column_select)
    begin
        -- Define a strict box: X from 500 to 600, Y from 0 to 30
        if (unsigned(h_count) >= 500 and unsigned(h_count) <= 600) and 
        (unsigned(v_count) >= 10  and unsigned(v_count) <= 40) then
            
            case column_select is 
                when "000" => char_address <= "010011"; -- S
                when "001" => char_address <= "000011"; -- C
                when "010" => char_address <= "001111"; -- O
                when "011" => char_address <= "010010"; -- R
                when "100" => char_address <= "000101"; -- E
                when others => char_address <= "000000"; -- BLANK
            end case;
        else
            -- THIS IS CRITICAL: Tell the ROM to be totally blank outside the box
            char_address <= "000000"; 
        end if;
    end process;
end behavior;