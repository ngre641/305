library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mode_select is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        btn_start   : in  STD_LOGIC;
        dip_mode0   : in  STD_LOGIC;
        dip_mode1   : in  STD_LOGIC;
        lives       : in  STD_LOGIC_VECTOR(1 downto 0);
        mode_out    : out STD_LOGIC_VECTOR(1 downto 0)
        -- 00=START, 01=TRAINING, 10=GAME, 11=DEATH
    );
end mode_select;

architecture Behavioral of mode_select is
    type state_type is (START, TRAINING, GAME, PAUSED, DEATH);
    signal current_state, next_state : state_type;
begin

 
    process(clk, reset)
    begin
        if reset = '0' then
            current_state <= START;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;


    process(current_state, btn_start, dip_mode0, dip_mode1, lives)
    begin
        next_state <= current_state;  
        case current_state is

            when START =>
                if btn_start = '0' then
                    if dip_mode1 = '0' and dip_mode0 = '1' then
                        next_state <= TRAINING;
                    elsif dip_mode1 = '1' and dip_mode0 = '1' then
                        next_state <= GAME;
                    end if;
                end if;

            when TRAINING =>
                if lives = "00" then
                    next_state <= DEATH;
                end if;

            when GAME =>
                if lives = "00" then
                    next_state <= DEATH;
                end if;

            when PAUSED =>
                -- add pause/resume logic here when ready
                null;

            when DEATH =>
                if btn_start = '0' then
                    next_state <= START;
                end if;

            when others =>
                next_state <= START;

        end case;
    end process;


    process(current_state)
    begin
        case current_state is
            when START    => mode_out <= "00";
            when TRAINING => mode_out <= "01";
            when GAME     => mode_out <= "10";
            when PAUSED   => mode_out <= "10";
            when DEATH    => mode_out <= "11";
            when others   => mode_out <= "00";
        end case;
    end process;

end Behavioral;