LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY collisions IS
    PORT
    (
        ball_red, ball_green, ball_blue : IN STD_LOGIC;
        obsticals_red, obsticals_green, obsticals_blue : IN STD_LOGIC;
        coin_red, coin_green, coin_blue : IN STD_LOGIC;
        collision_coin, collision_obsticals : OUT STD_LOGIC
    );
END collisions;

ARCHITECTURE behavior OF collisions IS
    BEGIN
    
    PROCESS(ball_red, ball_green, ball_blue, obsticals_red, obsticals_green, obsticals_blue, coin_red, coin_green, coin_blue)

    variable V_Ball_here : STD_LOGIC;
    variable V_Obstical_here : STD_LOGIC;
    variable V_Coin_here : STD_LOGIC;
    BEGIN
        if rising edge clock_25MHz then
            V_Ball_here := ball_red; -- set balls colour here
            V_Obstical_here := obsticals_green; -- use obsticals colour here
            V_Coin_here := coin_green and coin_red; -- use coin colour here

            if (V_Ball_here = '1' and V_Obstical_here = '1') then
                collision_obsticals <= '1';
            else
                collision_obsticals <= '0';
            end if;

            if (V_Ball_here = '1' and V_Coin_here = '1') then
                collision_coin <= '1';
            else
                collision_coin <= '0';
            end if;
        end if;    
    END PROCESS; 

END behavior;