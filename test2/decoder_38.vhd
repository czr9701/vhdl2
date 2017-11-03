LIBRARY IEEE;  --decoder_38
USE IEEE.std_logic_1164.ALL;
ENTITY decoder_38 IS
PORT(a,b,c,en:IN std_logic;
            y:OUT std_logic_vector(7 DOWNTO 0));
END decoder_38;
ARCHITECTURE behav OF decoder_38 IS
 SIGNAL indata:std_logic_vector(2 DOWNTO 0);
BEGIN
 indata<=c&b&a;
 PROCESS(indata,en)
 BEGIN
     IF(en='0')THEN
       CASE indata IS
         WHEN "000"=> y<="11111110";
         WHEN "001"=> y<="11111101";
         WHEN "010"=> y<="11111011";
         WHEN "011"=> y<="11110111";
         WHEN "100"=> y<="11101111";
         WHEN "101"=> y<="11011111";
         WHEN "110"=> y<="10111111";
         WHEN "111"=> y<="01111111";
         WHEN OTHERS => y<="XXXXXXXX";
       END CASE;
     ELSE
        y<="11111111";
     END IF;
END PROCESS;
END behav;

         
         