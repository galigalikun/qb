
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "scene/MainScene.csb"

function MainScene:onCreate()
    local root = self:getResourceNode()

    root:getChildByName("Text_1"):getVirtualRenderer():setLineHeight(20)

    root:getChildByName("Button_1"):addClickEventListener(function(sender)
        self:getApp():enterScene("GameScene")
    end)
end

return MainScene
