local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CSS = require(ReplicatedStorage.CSS)

local code = {
  [[
  #selector{
    margin: 5px;
    border-radius: 10px;
  }
  ]]
}

CSS.Execute(code, game.StarterGui.ScreenGui)
