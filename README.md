gpio.lua is a simple gpio library for lua. It can be used in any linux-based embedded system.

To use the library read the examples: inputTest, outputTest. 

In order to configure an input pin:

```lua
require ("gpio") --import library
configureInGPIO (83) --configure input gpio
local val = readGPIO(83) --read the value of the pin
```

And the output pin:

```lua
require ("gpio") -- import library
configureOutGPIO (83) -- configure input gpio
writeGPIO(83,1) -- write the value to the pin
writeGPIO(83,0)
```