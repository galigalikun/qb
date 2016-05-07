
local MyApp = class("MyApp", cc.load("mvc").AppBase)

function MyApp:onCreate()
    math.randomseed(os.time())

    sdkbox.PluginFlurryAnalytics:init()
    sdkbox.PluginFlurryAnalytics:startSession()

end

return MyApp
