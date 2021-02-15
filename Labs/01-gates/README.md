# Digital electronics
## Lab 01 - Gates 
### 1. GitHub
- [GitHub link](https://github.com/rubinektomas/Digital-electronics-1)

### 2. De Morgan's law
- VHDL code:
```
library ieee;               
use ieee.std_logic_1164.all;
entity gates is
    port(
        a_i    : in  std_logic;         
        b_i    : in  std_logic;        
        c_i	   : in  std_logic;
        f    : out std_logic;         
        
        fnand    : out std_logic; 
        fnor    : out std_logic
    );
end entity gates;

architecture dataflow of gates is
begin
    f  <= ((not b_i) and a_i)or ((not c_i) and (not b_i));
    fnand  <= not(not((not b_i) and a_i)and not((not c_i) and (not b_i)));
    fnor  <= not(b_i or not a_i) or not(c_i or b_i);
    
end architecture dataflow;
```
- Screenshot:
![alt text](https://github.com/rubinektomas/Digital-electronics-1/blob/main/Labs/01-gates/demorgan2.PNG "De Morgan's law")

- [EDA playground link](https://www.edaplayground.com/x/aN_a)

### 3. Distributive laws
- VHDL code:
```
library ieee;               
use ieee.std_logic_1164.all;
entity gates is
    port(
        x    : in  std_logic;         
        y    : in  std_logic;        
        z	   : in  std_logic;
        f1    : out std_logic;        
        f2    : out std_logic   
               
    );
end entity gates;

architecture dataflow of gates is
begin
    f1  <= not(((x and y) or (x and z))  xor   (x and (y or z)));
    f2 <= not(((x or y) and (x or z)) xor  (x or (y and z)));
    

end architecture dataflow;
```

- Screenshot:
![alt text](https://github.com/rubinektomas/Digital-electronics-1/blob/main/Labs/01-gates/distribution.PNG "Distribution")

- [EDA playground link](https://www.edaplayground.com/x/MQKK)

