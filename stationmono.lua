--mono radio station
local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")
local modem = peripheral.find("modem")
local decoder = dfpwm.make_decoder()
local songs = {"https://github.com/cadenthecreator/songs/raw/main/Minecraft%20Music%20Disc%20-%20Ward%20(HD).dfpwm","https://github.com/cadenthecreator/songs/raw/main/Minecraft%201.18%20New%20Music%20Disc%20otherside%20.dfpwm","https://github.com/cadenthecreator/songs/raw/main/Minecraft%201.18%20New%20Music%20Disc%20otherside%20.dfpwm"}

while true do
    local data = http.get(songs[math.random(#songs)])

    local size = 16 * 1024

    while true do
        local rawChunk = data.read(size)
        if not rawChunk then break end
        modem.transmit(1606,1606,{audio=rawChunk,proto="cadenMono"})
        local buffer = decoder(rawChunk)
        while not speaker.playAudio(buffer,0) do
            os.pullEvent("speaker_audio_empty")
        end
    
    end
    sleep(2)
end
