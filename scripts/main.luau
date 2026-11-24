--[[ @summary Automatically skips the SimCity startup intro movie via the sandboxed Simoder game API. ]]
local exports = {}

function exports.onEnable(api)
    if api and api.game and type(api.game.setSkipIntro) == "function" then
        api.game.setSkipIntro(true)
    end
end

return exports
