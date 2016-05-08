
local GameScene = class("GameScene", cc.load("mvc").ViewBase)

GameScene.RESOURCE_FILENAME = "scene/GameScene.csb"

function GameScene:onCreate()
    local root = self:getResourceNode()

    root:getChildByName("Button_1"):addClickEventListener(function(sender)
        self:getApp():enterScene("MainScene")
    end)
end

return GameScene
