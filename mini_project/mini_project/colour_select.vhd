USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY colour_select IS
    PORT
    (
        l1_red, l1_green, l1_blue, l2_red, l2_green, l2_blue, l3_red, l3_green, l3_blue : IN STD_LOGIC;
        pixel_row, pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        red, green, blue : OUT STD_LOGIC
    );
END colour_select;

ARCHITECTURE behavior OF colour_select IS

BEGIN
    
    if (l1_red or l1_green or l1_blue) = '1' then
        red <= l1_red;
        green <= l1_green;
        blue <= l1_blue;
    elsif (l2_red or l2_green or l2_blue) = '1' then
            red <= l2_red;
            green <= l2_green;
            blue <= l2_blue;
    elsif (l3_red or l3_green or l3_blue) = '1' then
            red <= l3_red;
            green <= l3_green;
            blue <= l3_blue;
    else
        red <= '0';
        green <= '0';
         blue <= '0';
    end if;

END behavior;
