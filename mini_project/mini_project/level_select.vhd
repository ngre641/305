LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity level_select is    
    port 
    (
        score : in std_logic;
        previous_level: in std_logic_vector(1 downto 0);
        level : out std_logic_vector(1 downto 0);
    );

end entity level_select;


architecture arc of level_select is

begin

    process(score) 

    begin 

    

    end process;

end arc;
