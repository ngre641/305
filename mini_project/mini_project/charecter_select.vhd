LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY char_position IS
    PORT (
        pixel_row         : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        pixel_column      : IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
        --character_address : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
        size              : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);

        font_row          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        font_col          : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        char_address_out  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
    );
END char_position;

ARCHITECTURE behavior OF char_position IS

    CONSTANT CENTER_ROW  : STD_LOGIC_VECTOR(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(240, 10);
    CONSTANT CENTER_COL  : STD_LOGIC_VECTOR(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(320, 10);
    CONSTANT character_address : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000111";

    SIGNAL half_size     : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL top_left_row  : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL top_left_col  : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL rel_row       : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL rel_col       : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL char_size     : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN

    PROCESS(size)
    BEGIN
        CASE size IS
            WHEN "000" => char_size <= CONV_STD_LOGIC_VECTOR(0,   10);
            WHEN "001" => char_size <= CONV_STD_LOGIC_VECTOR(8,   10);
            WHEN "010" => char_size <= CONV_STD_LOGIC_VECTOR(16,  10);
            WHEN "011" => char_size <= CONV_STD_LOGIC_VECTOR(32,  10);
            WHEN "100" => char_size <= CONV_STD_LOGIC_VECTOR(64,  10);
            WHEN "101" => char_size <= CONV_STD_LOGIC_VECTOR(128, 10);
            WHEN "110" => char_size <= CONV_STD_LOGIC_VECTOR(256, 10);
            WHEN "111" => char_size <= CONV_STD_LOGIC_VECTOR(512, 10);
            WHEN OTHERS => char_size <= CONV_STD_LOGIC_VECTOR(0,  10);
        END CASE;
    END PROCESS;

    half_size    <= '0' & char_size(9 DOWNTO 1);
    top_left_row <= CENTER_ROW - half_size;
    top_left_col <= CENTER_COL - half_size;
    rel_row      <= pixel_row    - top_left_row;
    rel_col      <= pixel_column - top_left_col;

    PROCESS(size, rel_row, rel_col)
    BEGIN
        CASE size IS
            WHEN "001" =>
                font_row <= rel_row(2 DOWNTO 0);
                font_col <= rel_col(2 DOWNTO 0);
            WHEN "010" =>
                font_row <= rel_row(3 DOWNTO 1);
                font_col <= rel_col(3 DOWNTO 1);
            WHEN "011" =>
                font_row <= rel_row(4 DOWNTO 2);
                font_col <= rel_col(4 DOWNTO 2);
            WHEN "100" =>
                font_row <= rel_row(5 DOWNTO 3);
                font_col <= rel_col(5 DOWNTO 3);
            WHEN "101" =>
                font_row <= rel_row(6 DOWNTO 4);
                font_col <= rel_col(6 DOWNTO 4);
            WHEN "110" =>
                font_row <= rel_row(7 DOWNTO 5);
                font_col <= rel_col(7 DOWNTO 5);
            WHEN "111" =>
                font_row <= rel_row(8 DOWNTO 6);
                font_col <= rel_col(8 DOWNTO 6);
            WHEN OTHERS =>
                font_row <= (OTHERS => '0');
                font_col <= (OTHERS => '0');
        END CASE;
    END PROCESS;

    char_address_out <= character_address;

END behavior;