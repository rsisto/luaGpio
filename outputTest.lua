--Read the state of a button and turn on a led connected to a different gpio as follows:
--button 139 turns on led 158
--button 138 turns on led 162
--button 137 turns on led 161

require ("gpio")

local buttons = {}
buttons[1]=139
buttons[2]=138
buttons[3]=137

local leds = {}
leds[1]=158
leds[2]=162
leds[3]=161

for i,v in ipairs(buttons) do 
	--configure v as input gpio
	configureInGPIO(v)
end
for i,v in ipairs(leds) do 
	--configure v as output gpio
	configureOutGPIO(v)
end

while true do
	for i,v in ipairs(buttons) do
		local val = readGPIO(v)
		if val.."" == '1' then
			print ('button '..i .. ' pressed')
			writeGPIO(leds[i],1)
		else
			writeGPIO(leds[i],0)
		end
	end
	
end
