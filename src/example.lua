local CSS = require(game:GetService("ReplicatedStorage").CSS)

local code = {
  [[
  #selector{
    margin: 5px;
    border-radius: 10px;
  }
  ]]
}

CSS.Execute(code, game.StarterGui.ScreenGui)
