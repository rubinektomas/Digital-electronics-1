# Digital electronics
## Lab 01 - Gates 
### 1. GitHub
[GitHub link](https://github.com/rubinektomas/Digital-electronics-1)

### 2. De Morgan's law
VHDL code:
```
library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        c_i	   : in  std_logic;
 --       for_o  : out std_logic;         -- OR output function
 --      fand_o : out std_logic;         -- AND output function
        f    : out std_logic;          -- XOR output function
        
        f_nand    : out std_logic; 
        f_nor    : out std_logic
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    f  <= ((not b_i) and a_i)or ((not c_i) and (not b_i));
    f_nand  <= not(not((not b_i) and a_i)and not((not c_i) and (not b_i)));
    f_nor  <= not(b_i or not a_i) or not(c_i or b_i);
    
end architecture dataflow;
```
Screenshot:
![alt text](https://github.com/rubinektomas/Digital-electronics-1/blob/main/Labs/01-gates/demorgan.PNG "De Morgan's law")

[EDA playground link](https://www.edaplayground.com/x/aN_a)

