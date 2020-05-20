

wifi.setmode(wifi.SOFTAP)
local apcfg={
    ssid="smart-trolly",      
    pwd="12341234"  
}
wifi.ap.config(apcfg)
gpio.mode(1, gpio.OUTPUT)
gpio.mode(2, gpio.OUTPUT)
gpio.mode(3, gpio.OUTPUT)
gpio.mode(4, gpio.OUTPUT)
-- Serving static files
dofile('httpServer.lua')
httpServer:listen(80)
gpio.write(1, gpio.LOW)
gpio.write(2, gpio.LOW)
gpio.write(3, gpio.LOW)
gpio.write(4, gpio.LOW)
-- Custom API
-- Get text/html
httpServer:use('/w', function(req, res)
    data=req.query.w
    if (data=='h') then
       gpio.write(1, gpio.HIGH)
    gpio.write(2, gpio.LOW)
    gpio.write(3, gpio.HIGH)
    gpio.write(4, gpio.LOW)      
    end
      if (data=='q') then
       gpio.write(2, gpio.HIGH)
    gpio.write(1, gpio.LOW)
    gpio.write(4, gpio.HIGH)
    gpio.write(3, gpio.LOW)      
    end
if (data=='s') then
       gpio.write(1, gpio.LOW)
gpio.write(2, gpio.LOW)
gpio.write(3, gpio.LOW)
gpio.write(4, gpio.LOW)    
    end
    if (data=='l') then
       gpio.write(1, gpio.LOW)
gpio.write(2, gpio.HIGH)
gpio.write(3, gpio.HIGH)
gpio.write(4, gpio.LOW)    
    end
    if (data=='y') then
       gpio.write(1, gpio.HIGH)
gpio.write(2, gpio.LOW)
gpio.write(3, gpio.LOW)
gpio.write(4, gpio.HIGH)    
    end

    res:send('Hello ' .. req.query.w) 
    
end)


