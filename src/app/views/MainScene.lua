
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "scene/MainScene.csb"

function MainScene:onCreate()
    local root = self:getResourceNode()

    root:getChildByName("Text_1"):getVirtualRenderer():setLineHeight(20)

    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:setRequestHeader("User-Agent", "todo")
    xhr:open("GET", "https://api.github.com/")
    xhr:registerScriptHandler(function()
        dump(xhr)
        if xhr.readyState == 4 and (xhr.status >= 200 and xhr.status < 207) then
            local obj = json.decode(xhr.response)
            dump(obj)
        end
        xhr:unregisterScriptHandler()
    end)
    xhr:send()

    root:getChildByName("Button_1"):addClickEventListener(function(sender)
        self:getApp():enterScene("GameScene")
    end)
end

return MainScene
