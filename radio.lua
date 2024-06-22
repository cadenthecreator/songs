local port = ...
port = tonumber(port)
local dfpwm = require("cc.audio.dfpwm")
local modem = peripheral.find("modem")
local decoder = dfpwm.make_decoder()
modem.open(port)
local data = {}
local function receive()
while true do
    while true do
        local _,_,ch,_,data = os.pullEvent("modem_message")
        if ch == port then
            
        end
    end
end
end

local function audioleft()
    local speaker = peripher.wrap("left") or peripheral.find("speaker")
    while true do
        if data then
            if data.proto = "cadenMono" then
                local buffer = decoder()
                while not speaker.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            end
        end
        sleep()
    end
end

local function audioright()
    local speaker = peripher.wrap("right") or peripheral.find("speaker")
    while true do
        if data then
            if data.proto = "cadenMono" then
                local buffer = decoder()
                while not speaker.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            end
        end
        sleep()
    end
end
