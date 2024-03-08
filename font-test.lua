
function fontTestWindow()
    local uArg1 = 0x0F
    local uArg2 = 0xEE
    local uArg3 = 0x80
    local uArg4 = 0x80
    local uResult = ""
    
    local ftw = Window:new(-1,-1,192,47)
    local uA1L = Textbox:new(10,5,25,17)
    local uA2L = Textbox:new(40,5,25,17)
    local uA3L = Textbox:new(70,5,25,17)
    local uA4L = Textbox:new(100,5,25,17)
    local uResultL = Label:new(130,5,25,17)
    local uA1U = Button:new(10,25,12,17,"^")
    local uA1D = Button:new(23,25,12,17,"v")
    local uA2U = Button:new(40,25,12,17,"^")
    local uA2D = Button:new(53,25,12,17,"v")
    local uA3U = Button:new(70,25,12,17,"^")
    local uA3D = Button:new(83,25,12,17,"v")
    local uA4U = Button:new(100,25,12,17,"^")
    local uA4D = Button:new(113,25,12,17,"v")

    local function terminate()interface.closeWindow(ftw)end

    local toChar = function(x)
        if x < 16 then
            return "0" .. string.format("%x", x)
        else
            return string.format("%x", x)
        end
    end

    local function uResultUpdate()

        uResult = "\\x"..toChar(uArg1).."\\x"..toChar(uArg2).."\\x"..toChar(uArg3).."\\x"..toChar(uArg4).."test"
        uResult = uResult:gsub("\\x(%x%x)",
        function (x)
            return string.char(tonumber(x,16))
        end)
        uResultL:text(uResult)

        uA1L:text(toChar(uArg1))
        uA2L:text(toChar(uArg2))
        uA3L:text(toChar(uArg3))
        uA4L:text(toChar(uArg4))
    end

    uA1U:action(function()
        uArg1 = uArg1 + 1
        uResultUpdate()
    end)
    uA1D:action(function()
        uArg1 = uArg1 - 1
        uResultUpdate()
    end)
    uA2U:action(function()
        uArg2 = uArg2 + 1
        uResultUpdate()
    end)
    uA2D:action(function()
        uArg2 = uArg2 - 1
        uResultUpdate()
    end)
    uA3U:action(function()
        uArg3 = uArg3 + 1
        uResultUpdate()
    end)
    uA3D:action(function()
        uArg3 = uArg3 - 1
        uResultUpdate()
    end)
    uA4U:action(function()
        uArg4 = uArg4 + 1
        uResultUpdate()
    end)
    uA4D:action(function()
        uArg4 = uArg4 - 1
        uResultUpdate()
    end)

    uA1L:onTextChanged(function()
        uArg1 = tonumber(uA1L:text(),16)
        uResultUpdate()
    end)
    uA2L:onTextChanged(function()
        uArg2 = tonumber(uA2L:text(),16)
        uResultUpdate()
    end)
    uA3L:onTextChanged(function()
        uArg3 = tonumber(uA3L:text(),16)
        uResultUpdate()
    end)
    uA4L:onTextChanged(function()
        uArg4 = tonumber(uA4L:text(),16)
        uResultUpdate()
    end)

    ftw:addComponent(uA1L)
    ftw:addComponent(uA2L)
    ftw:addComponent(uA3L)
    ftw:addComponent(uA4L)
    ftw:addComponent(uResultL)
    ftw:addComponent(uA1U)
    ftw:addComponent(uA1D)
    ftw:addComponent(uA2U)
    ftw:addComponent(uA2D)
    ftw:addComponent(uA3U)
    ftw:addComponent(uA3D)
    ftw:addComponent(uA4U)
    ftw:addComponent(uA4D)

    ftw:onTryExit(terminate)

    uResultUpdate()

    interface.showWindow(ftw)

end