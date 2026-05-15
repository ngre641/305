LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity lfsr is    
    port 
    (
        Clk : in std_logic;
        Q : out std_logic_vector(7 downto 0);
    );

end entity lfsr;

architecture arc of lfsr is
    signal reg : std_logic_vector(7 downto 0) := "00000001";
begin

    process(Clk) 
        variable feedback, feedback_1, feedback_2, feedback_3 : std_logic;

    begin 
        if rising_edge(clk) then 

            feedback := reg(0);
            feedback_1 := reg(0) xor reg(6);
            feedback_2 := reg(0) xor reg(5);
            feedback_3 := reg(0) xor reg(4);

            reg(0) <= reg(1);
            reg(1) <= reg(2);
            reg(2) <= reg(3);
            reg(3) <= feedback_3;
            reg(4) <= feedback_2;
            reg(5) <= feedback_1;
            reg(6) <= reg(7);
            reg(7) <= feedback;
        end if;
        Q <= reg;
    end process;

end arc;