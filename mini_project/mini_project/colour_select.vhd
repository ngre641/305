LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY colour_select IS
    PORT
    (
        l1_red, l1_green, l1_blue, 
        l2_red, l2_green, l2_blue, 
        l3_red, l3_green, l3_blue : IN STD_LOGIC;
        pixel_row, pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        red, green, blue : OUT STD_LOGIC
    );
END colour_select;

ARCHITECTURE behavior OF colour_select IS

BEGIN

    PROCESS(pixel_row, pixel_column)
    BEGIN
        IF (l1_red OR l1_green OR l1_blue) = '1' THEN
            red   <= l1_red;
            green <= l1_green;
            blue  <= l1_blue;
        ELSIF (l2_red OR l2_green OR l2_blue) = '1' THEN
            red   <= l2_red;
            green <= l2_green;
            blue  <= l2_blue;
        ELSIF (l3_red OR l3_green OR l3_blue) = '1' THEN
            red   <= l3_red;
            green <= l3_green;
            blue  <= l3_blue;
        ELSE
            red   <= '0';
            green <= '0';
            blue  <= '0';
        END IF;
    END PROCESS;

END behavior;