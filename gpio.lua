--@author: Ewelina, Rafa, Rafa
--GPIO utilities

--Writes 'what' to 'where'
function writeToFile (where,what)
	local fileToWrite=io.open(where, 'w')
	fileToWrite:write(what)
	fileToWrite:close()	
end
--Reads a character from file 'where' and returns the string
function readFromFile (where)
	local fileToRead=io.open(where, 'r')
	fileStr = fileToRead:read(1)
	fileToRead:close()	
	return fileStr
end

--Returns true if file exists
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

--Exports gpio ID to use as an output pin
function configureOutGPIO (id)
	if not file_exists('/sys/class/gpio/gpio'..id..'/direction') then
		writeToFile('/sys/class/gpio/export',id)
	end
	writeToFile('/sys/class/gpio/gpio'..id..'/direction','out')
end

--Exports gpio ID to use as an input pin
function configureInGPIO (id)
	if not file_exists('/sys/class/gpio/gpio'..id..'/direction') then
		writeToFile('/sys/class/gpio/export',id)
	end
	writeToFile('/sys/class/gpio/gpio'..id..'/direction','in')
end

--Reads GPIO 'id' and returns it's value
--@Pre: GPIO 'id' must be exported with configureInGPIO
function readGPIO(id)
	gpioVal = readFromFile('/sys/class/gpio/gpio'..id..'/value')
	return gpioVal
end

--Writes a value to GPIO 'id'
--@Pre: GPIO 'id' must be exported with configureOutGPIO
function writeGPIO(id, val)
	gpioVal = writeToFile('/sys/class/gpio/gpio'..id..'/value', val)
end

function sleep(n)
  os.execute("sleep " .. tonumber(n))
end
