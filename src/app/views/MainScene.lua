
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "scene/MainScene.csb"

local deferred = require("packages.promises.deferred")

function MainScene:onCreate()
    local root = self:getResourceNode()

    root:getChildByName("Text_1"):getVirtualRenderer():setLineHeight(20)

    self:promisetest()
        :next(function(obj)
            dump(obj)
        end,
        function()
            printInfo("reject")
        end)


    root:getChildByName("Button_1"):addClickEventListener(function(sender)
        self:getApp():enterScene("GameScene")
    end)
end

function MainScene:promisetest()
    local d = deferred.new()

    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:setRequestHeader("User-Agent", "todo")
    xhr:open("GET", "https://api.github.com/")
    xhr:registerScriptHandler(function()
        dump(xhr)
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            local obj = json.decode(xhr.response)
            d:resolve(obj)
        else
            d:reject()
        end
        xhr:unregisterScriptHandler()
    end)
    xhr:send()

    return d
end

return MainScene
