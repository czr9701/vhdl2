library ieee;

use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity led is

port(led_out : out std_logic_vector(7 downto 0); 
         clk : in std_logic;
         rst_n : in std_logic
);
end led;

architecture behavior of led is

signal light : std_logic_vector (7 downto 0); 
begin
 process(clk, rst_n) 
   begin
    if(rst_n='0')then
       light <= "00000010";
    elsif(clk' event and clk='1')then
     if(light = "00000000" ) then
        light <= "00000001";
     else
        if(light = "10000000" ) then
           light <= "00000001";
        else
           light <= light(6 downto 0)&'0'; 
        end if;
     end if;
    end if;
 end process; 
 led_out <= light;

end behavior;