--Read the state of the buttons connected to pins 139, 138 and 137 and print it to the console

require ("gpio") 

local buttons = {}
buttons[1]=139
buttons[2]=138
buttons[3]=137

for i,v in ipairs(buttons) do 
	configureInGPIO (v)
end

while true do 
	for i,v in ipairs(buttons) do
		local val = readGPIO(v)
		if val.."" == '1' then
			print ('Button '..i .. ' pressed')
		end
	end
	
end



