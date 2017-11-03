LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY frequencies IS
  PORT(clk_50M:IN std_logic;
       clk_1:OUT std_logic);
END frequencies;
ARCHITECTURE behav OF frequencies IS
SIGNAL time:integer RANGE 0 TO 49999999;
SIGNAL m:integer RANGE 0 TO 1;
BEGIN
 PROCESS(clk_50M)
 BEGIN
  IF rising_edge(clk_50M) THEN
     time<=time+1;
     IF m=0 THEN
        clk_1<='1';
         IF time=24999999 THEN
           m<=1;
         END IF;
     ELSE
        clk_1<='0';
        IF time=49999999 THEN
           m<=0;
           time<=0;
        END IF;
     END IF;
  END IF;
 END PROCESS;
END behav;

