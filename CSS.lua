--[[

Alright so I know this code is kind of bad but here is a tutorial:
m.Execute(code_pieces<table>,target<GuiObject>) -> nil

Basically just put a string of CSS code bt only the selector and the code inside, such as #inner{} AND NOTHING ELSE!!!
example:

{
	"#inner{margin:5;}",
	"#other_button{background-color:blue;}"
}

TO MAKE A GUI OBJECT BE SELECTED BY THE NAME THAT COMES AFTER THE #:
	go into the object's properties and add a new attribute called "id" and name it the same id that you are selecting it with, such as inner or other_button.

currently supported colors:
	black
	white
	red
	green
	blue
	
currently supported instructions:
	margin: <int>;
	background-color: <colors<table>>;
	color: <colors<table>>;
	border-radius: <int>;
]]

local m = {}

m.Execute = function(codes,target)
	

	local colors = {
		["black"] = Color3.fromRGB(0,0,0),
		["white"] = Color3.fromRGB(255,255,255),
		["red"] = Color3.fromRGB(255,0,0),
		["green"] = Color3.fromRGB(0,255,0),
		["blue"] = Color3.fromRGB(0,0,255)
	}

	local godtable = {
		["margin"] = function(currentselection,value)
			currentselection.Size -= UDim2.new(0,value*2,0,value*2)
			currentselection.Position += UDim2.new(0,value,0,value)
		end,
		["background-color"] = function(currentselection,value)
			currentselection.BackgroundColor3 = colors[value]
		end,
		["color"] = function(currentselection,value)
			if currentselection:IsA("ImageLabel") or currentselection:IsA("TextBox") or currentselection:IsA("TextButton") or currentselection:IsA("TextLabel") then
				currentselection.TextColor3 = colors[value]
			end
			for idx,va in pairs(currentselection:GetDescendants()) do
				if va:IsA("ImageLabel") or va:IsA("TextBox") or va:IsA("TextButton") or va:IsA("TextLabel") then
					va.TextColor3 = colors[value]
				end
			end
		end,
		["border-radius"] = function(currentselection,value)
			local f = Instance.new("UICorner")
			f.Parent = currentselection
			f.CornerRadius = UDim.new(0,value)
		end,
	}
	for iiii,code in pairs(codes) do
		code = code:gsub("%s+","")
		local nospaced = code
		if nospaced:sub(1,1) == "#" then
			local found = nil
			for i,v in pairs(target:GetDescendants()) do
				if v:GetAttribute("id") == nospaced:split("{")[1]:sub(2,string.len(nospaced:split("{")[1])) then
					found = v
					break
				end
			end
			assert(found,"Invalid selector")
			local middle = nospaced:match("%{.*%}")
			local midsplit = middle:split(";")
			table.remove(midsplit,#midsplit)
			midsplit[1] = midsplit[1]:sub(2,string.len(midsplit[1]))
			for i,instruction in pairs(midsplit) do
				local spl = instruction:split(":")
				godtable[spl[1]](found,spl[2])
			end
		end
	end
end

return m
