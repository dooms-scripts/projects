--[[
		DOOMS SCRIPT DUMPER
		> SECURE EDITION
		> VERSION 1.0.0
]]--

-- getgenv = getgenv or getfenv -- only used for debugging
getgenv().DumpingStatus = false

--[[ FUNCTION CHECK ]]--------------------------------------------------------
theres_,nothing_,here_ = pcall(function() end)

--[[ VARIABLES ]]-------------------------------------------------------------
local Dump, Instances = { LocalScripts = {}, ModuleScripts = {} }, {}
local ServiceFilter
local IndexFilter
local Selection

local Gui
local MainWindow
local PropertiesWindow
local RawScriptWindow
local InstanceList
local SettingsMenu
local LocalScriptDropdown
local ModuleScriptDropdown

--[[ TABLES ]]----------------------------------------------------------------
local Assets = {
	Icons = {
		ModuleScript = "rbxassetid://5016313061",
		LocalScript = "rbxassetid://16775265105",
	}
}

local Dependencies = {
	Player = game:GetService('Players').LocalPlayer,
	Mouse = game:GetService('Players').LocalPlayer:GetMouse(),
}

local Properties = {
	['LocalScript'] = {
		Data = {
			"Archivable",
			"ClassName",
			"Name",
			"Parent",
		},

		Behavior = {
			"Enabled",
		}
	},

	['ModuleScript'] = {
		Data = {
			"Archivable",
			"ClassName",
			"Name",
			"Parent",
		},

		Behavior = {}
	}
}

--[[ HIDE OPTIONS ]]----------------------------------------------------------
Dependencies.Mouse.Button1Down:Connect(function()
	for _,__ in ipairs(InstanceList:GetChildren()) do if __:IsA('Frame') then 
			for _, ___ in ipairs(__:GetChildren()) do if ___:IsA('UIStroke') then ___:Destroy() end end
			print('i be slangin')
		end
	end

	SettingsMenu.Visible = false
end)

--[[ FUNCTIONS ]]-------------------------------------------------------------
function clearDump()
	Dump = { LocalScripts = {}, ModuleScripts = {} }

	for _, __ in ipairs(InstanceList:GetChildren()) do
		if __:IsA("TextButton") and __.Name == 'DropdownButton' then __:Destroy() end
	end

	InstanceList.CanvasSize = UDim2.new(0,0,0,0)
end

function populateDump(callback)
	LocalScriptDropdown = createDropdown('Local Scripts', InstanceList)
	ModuleScriptDropdown = createDropdown('Module Scripts', InstanceList)

	local Filtering = false
	local Filter
	local Service

	if IndexFilter and IndexFilter ~= '' then
		Filter = IndexFilter
		Filtering = true
	end

	if pcall(function() game:GetService(ServiceFilter) end) then 
		Service = game:GetService(ServiceFilter) 
	else 
		Service = game 
	end

	for _, instance in ipairs(Service:GetDescendants()) do
		if instance:IsA('LocalScript') or instance:IsA('ModuleScript') then
			local dropdown

			if instance.ClassName == 'LocalScript' then dropdown = LocalScriptDropdown end
			if instance.ClassName == 'ModuleScript' then dropdown = ModuleScriptDropdown end

			if Filtering then
				if instance.Name:match(IndexFilter) then

					callback(instance, dropdown, instance.Name:gsub(IndexFilter, string.format('<b><font color="rgb(255, 255, 255)">%s</font></b>', IndexFilter)))
					table.insert(Dump[instance.ClassName .. 's'], 'game.' .. instance:GetFullName())
				end
			else
				callback(instance, dropdown)
				table.insert(Dump[instance.ClassName .. 's'], 'game.' .. instance:GetFullName())
			end
		end
	end
end

function randomString()
	local str = ''

	for i=1, 10 do
		str = str .. string.char(math.random(1, 255))
	end

	return str
end

function create(instance, properties)
	local i = Instance.new(instance)
	for p,v in pairs(properties) do
		local s, err = pcall(function()
			i[p] = v
		end)

		if err then 
			warn('[!] PROBLEM CREATING INSTANCE "'..instance..'": '..err) 
		end
	end

	return i
end

function load_http(url : string)
	local http_get_available, _ = pcall(function()
		game:HttpGet(url)
	end)

	if http_get_available then
		return loadstring(game:HttpGet(url))()
	elseif not http_get_available then
		return warn('HttpGet Not available')
	end
end


--[[ CREATE UI ]]-------------------------------------------------------------

-- ( generated using dooms gui converter 1.3.6 )
Gui = create("ScreenGui", {Name = [[Gui]];Parent = nil; ZIndexBehavior = Enum.ZIndexBehavior.Sibling;})

function createWindow(data : {})
	local Window = {}

	local WindowFrame = create("Frame", {Parent = Gui;Active = true;ClipsDescendants = true;BackgroundTransparency = 1;Draggable = true;Size = UDim2.new(data.Size.X.Scale, data.Size.X.Offset, 0, 0);AnchorPoint = data.Anchor;BorderColor3 = Color3.fromRGB(34, 34, 34);BorderMode = Enum.BorderMode.Inset;Name = [[Window]];Position = data.Position;Selectable = true;BackgroundColor3 = Color3.fromRGB(46, 46, 46);})
	local TopbarFrame = create("Frame", {Parent = WindowFrame;Size = UDim2.new(1, 0, 0, 22);BackgroundTransparency = 1;BorderColor3 = Color3.fromRGB(34, 34, 34);LayoutOrder = 1;Name = [[Topbar]];BackgroundColor3 = Color3.fromRGB(53, 53, 53);})
	local CloseButton = create("ImageButton", {Parent = TopbarFrame;BackgroundTransparency = 1;ImageTransparency = 1;AnchorPoint = Vector2.new(1, 0.5);Image = [[rbxassetid://13273265457]];BorderSizePixel = 0;Size = UDim2.new(0, 12, 0, 12);BorderColor3 = Color3.fromRGB(0, 0, 0);AutoButtonColor = false;Name = [[CloseButton]];Position = UDim2.new(1, 0, 0.5, 0);BackgroundColor3 = Color3.fromRGB(255, 255, 255);})
	local TextLabel = create("TextLabel", {Parent = TopbarFrame;TextTransparency = 1;TextTruncate = 'AtEnd';BorderSizePixel = 0;BackgroundColor3 = Color3.fromRGB(255, 255, 255);TextSize = 14;Size = UDim2.new(1, 0, 1, 0);BorderColor3 = Color3.fromRGB(0, 0, 0);Text = data.Name;Font = Enum.Font.SourceSans;TextColor3 = Color3.fromRGB(170, 170, 170);BackgroundTransparency = 1;})
	create("UIPadding", {Parent = TopbarFrame;PaddingRight = UDim.new(0, 6);PaddingLeft = UDim.new(0, 6);})
	create("UIPadding", {Parent = TextLabel;PaddingBottom = UDim.new(0, 1);})
	create("UIListLayout", {Parent = WindowFrame;SortOrder = Enum.SortOrder.LayoutOrder;})

	function Window:Open()
		coroutine.wrap(function()
			local TransparencyTween = game:GetService('TweenService'):Create(WindowFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 })
			TransparencyTween:Play()
			TransparencyTween.Completed:Wait()

			local SizeTween = game:GetService('TweenService'):Create(WindowFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = data.Size })
			SizeTween:Play()
			SizeTween.Completed:Wait()

			game:GetService('TweenService'):Create(TopbarFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 }):Play()
			game:GetService('TweenService'):Create(CloseButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 0 }):Play()
			game:GetService('TweenService'):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 }):Play()
		end)()
	end

	function Window:Close()
		game:GetService('TweenService'):Create(TopbarFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
		game:GetService('TweenService'):Create(CloseButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 1 }):Play()
		game:GetService('TweenService'):Create(TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 1 }):Play()

		task.wait(.55)

		local SizeTween = game:GetService('TweenService'):Create(WindowFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(data.Size.X.Scale, data.Size.X.Offset, 0, 0) })
		SizeTween:Play()
		SizeTween.Completed:Wait()

		local TransparencyTween = game:GetService('TweenService'):Create(WindowFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		TransparencyTween:Play()
		TransparencyTween.Completed:Wait()
	end

	CloseButton.MouseButton1Click:Connect(function()
		Window:Close()
		WindowFrame:Destroy()
	end)

	Window.Instance = WindowFrame
	return Window
end

function createDropdown(text : string, parent : Instance)
	parent.CanvasSize += UDim2.new(0,0,0,18)

	local DropdownToggled = true

	local DropdownButton = create("TextButton", {Parent = parent;BackgroundTransparency = 0;BorderSizePixel = 0;BackgroundColor3 = Color3.fromRGB(56, 56, 56);BorderMode = Enum.BorderMode.Inset;TextSize = 14;Size = UDim2.new(1, -11, 0, 18);BorderColor3 = Color3.fromRGB(0, 0, 0);Text = [[]];Font = Enum.Font.SourceSans;Name = [[DropdownButton]];TextColor3 = Color3.fromRGB(0, 0, 0);})
	local DropdownFrame = create("Frame", {Active = true;Parent = DropdownButton;Size = UDim2.new(1, 0, 0, 18);BorderColor3 = Color3.fromRGB(66, 66, 66);LayoutOrder = 1;BorderMode = Enum.BorderMode.Inset;Name = [[DropdownFrame]];BackgroundTransparency = 1;Selectable = true;BackgroundColor3 = Color3.fromRGB(53, 53, 53);})
	local Label = create("TextLabel", {TextTruncate = Enum.TextTruncate.AtEnd;BorderSizePixel = 0;RichText = true;BackgroundColor3 = Color3.fromRGB(56, 56, 56);Parent = DropdownFrame;TextSize = 14;Size = UDim2.new(1, -16, 0, 19);LayoutOrder = 2;TextXAlignment = Enum.TextXAlignment.Left;BorderColor3 = Color3.fromRGB(0, 0, 0);Text = text;Font = Enum.Font.SourceSansBold;Name = [[Label]];Position = UDim2.new(0.0708661452, 0, -0.055555556, 0);TextColor3 = Color3.fromRGB(204, 204, 204);BackgroundTransparency = 1;})
	local ArrowButton = create("ImageButton", {Parent = DropdownFrame;BackgroundTransparency = 1;AnchorPoint = Vector2.new(0, 0.5);Image = [[rbxassetid://16747905322]];BorderSizePixel = 0;Size = UDim2.new(0, 8, 0, 8);BorderColor3 = Color3.fromRGB(0, 0, 0);ImageColor3 = Color3.fromRGB(204, 204, 204);AutoButtonColor = false;Name = [[ArrowButton]];Position = UDim2.new(0, 0, 0.5, 0);BackgroundColor3 = Color3.fromRGB(46, 46, 46);})
	local Content = create("Frame", {Parent = DropdownButton;BorderSizePixel = 0;Size = UDim2.new(1, 0, 0, 0);ClipsDescendants = true;BorderColor3 = Color3.fromRGB(0, 0, 0);LayoutOrder = 2;Name = [[Content]];Position = UDim2.new(0, 0, 1, 0);BackgroundTransparency = 0;BackgroundColor3 = Color3.fromRGB(46, 46, 46);})
	create("UIPadding", {Parent = Label;PaddingLeft = UDim.new(0, 2);PaddingBottom = UDim.new(0, 1);})
	create("UIPadding", {Parent = DropdownFrame;PaddingLeft = UDim.new(0, 5);})
	create("UIListLayout", {VerticalAlignment = Enum.VerticalAlignment.Center;FillDirection = Enum.FillDirection.Horizontal;Parent = DropdownFrame;Padding = UDim.new(0, 4);})
	create("UIListLayout", {Parent = DropdownButton;SortOrder = Enum.SortOrder.LayoutOrder;})
	create("UIListLayout", {Parent = Content;SortOrder = Enum.SortOrder.LayoutOrder;})

	DropdownButton.MouseButton1Click:Connect(function()
		Content.Size = UDim2.new(1, 0, 0, 0)
		DropdownToggled = not DropdownToggled

		if DropdownToggled then
			ArrowButton.Rotation = 0
			Content.Visible = true

			for _, child in ipairs(Content:GetChildren()) do
				if child:IsA('Frame') then
					Content.Size += UDim2.new(0, 0, 0, 18)
					DropdownButton.Size += UDim2.new(0, 0, 0, 18)
				end
			end

		elseif not DropdownToggled then
			ArrowButton.Rotation = 90
			Content.Visible = false

			for _, child in ipairs(Content:GetChildren()) do
				if child:IsA('Frame') then
					Content.Size -= UDim2.new(0, 0, 0, 18)
					DropdownButton.Size -= UDim2.new(0, 0, 0, 18)
				end
			end
		end

		parent.CanvasSize = UDim2.new(0, 0, 0, 0)
		for _, child in ipairs(parent:GetChildren()) do
			if child:IsA('TextButton') then
				parent.CanvasSize += UDim2.new(0, 0, 0, child.Size.Y.Offset)
			end
		end
	end)

	return DropdownButton
end

function createInstanceFrame(script : Instance, parent : Instance, custom_text : string)
	InstanceList.CanvasSize += UDim2.new(0, 0, 0, 18)
	parent.Content.Size += UDim2.new(0, 0, 0, 18)
	parent.Size += UDim2.new(0, 0, 0, 18)

	local InstanceFrame = create("Frame", {Parent = parent.Content;BackgroundTransparency = 1;Active = true;Selectable = true;BorderSizePixel = 1;BorderMode = 'Inset';Size = UDim2.new(1, -11, 0, 18);BorderColor3 = Color3.fromRGB(66, 66, 66);Name = [[InstanceFrame]];BackgroundColor3 = Color3.fromRGB(66, 66, 66);})
	local Icon = create("ImageLabel", {Parent = InstanceFrame;AnchorPoint = Vector2.new(0, 0.5);Image = Assets.Icons[script.ClassName];BorderSizePixel = 0;Size = UDim2.new(0, 12, 1, 0);ScaleType = 'Fit';BorderColor3 = Color3.fromRGB(0, 0, 0);Name = [[Icon]];Position = UDim2.new(0, 0, 0.5, 0);BackgroundTransparency = 1;BackgroundColor3 = Color3.fromRGB(255, 255, 255);})
	local Label = create("TextLabel", {Parent = InstanceFrame;BorderSizePixel = 0;RichText = true;TextTruncate = 'AtEnd';BackgroundColor3 = Color3.fromRGB(255, 255, 255);TextSize = 14;Size = UDim2.new(1, -16, 0, 19);TextXAlignment = Enum.TextXAlignment.Left;BorderColor3 = Color3.fromRGB(0, 0, 0);Text = script.Name;Font = Enum.Font.SourceSansSemibold;Name = [[Label]];Position = UDim2.new(0.0708661452, 0, -0.055555556, 0);TextColor3 = Color3.fromRGB(204, 204, 204);BackgroundTransparency = 1;})
	--local SettingsButton = create("ImageButton", {Parent = InstanceFrame;BackgroundTransparency = 1;AnchorPoint = Vector2.new(1, 0.5);Image = [[rbxassetid://10162054992]];BorderSizePixel = 0;Size = UDim2.new(0, 14, 0, 14);BorderColor3 = Color3.fromRGB(0, 0, 0);ImageColor3 = Color3.fromRGB(204, 204, 204);AutoButtonColor = false;Name = [[SettingsButton]];Position = UDim2.new(0.99000001, 0, 0.5, 0);BackgroundColor3 = Color3.fromRGB(255, 255, 255);})
	local Hitbox = create('TextButton', {Parent = InstanceFrame; Size = UDim2.new(-1,0,1,0); BackgroundTransparency = 1; TextTransparency = 1})
	create("UIPadding", {Parent = InstanceFrame;PaddingLeft = UDim.new(0, 3);})
	create("UIPadding", {Parent = Label;PaddingBottom = UDim.new(0, 1);})
	create("UIListLayout", {Parent = InstanceFrame, FillDirection = 'Horizontal', VerticalAlignment = 'Center', Padding = UDim.new(0, 4)})

	if custom_text then
		Label.Text = custom_text
	end

	InstanceFrame.MouseEnter:Connect(function()
		InstanceFrame.BackgroundTransparency = 0
	end)

	InstanceFrame.MouseLeave:Connect(function()
		InstanceFrame.BackgroundTransparency = 1
	end)

	local function hideSettings()
		SettingsMenu.Visible = false
	end

	local function toggleSettings()
		for _,__ in ipairs(InstanceList:GetChildren()) do if __:IsA('Frame') then 
				for _, __ in ipairs(__:GetChildren()) do if __:IsA('UIStroke') then __:Destroy() end end
			end
		end

		Selection = script
		SettingsMenu.Parent = Gui
		SettingsMenu.Position = UDim2.new(0, Dependencies.Mouse.X, 0, Dependencies.Mouse.Y)
		if not SettingsMenu.Visible then 
			SettingsMenu.Visible = not SettingsMenu.Visible
		end

		for _,__ in ipairs(InstanceList:GetChildren()) do if __:IsA('Frame') then 
				for _, __ in ipairs(__:GetChildren()) do if __:IsA('UIStroke') then __:Destroy() end end
				print('i be slangin')
			end
		end

		-- create("UIStroke", {Parent = InstanceFrame, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = Color3.fromRGB(67, 191, 254)})
		-- InstanceFrame.BorderColor3 = Color3.fromRGB(67, 191, 254)
	end

	--SettingsButton.Visible = false
	--SettingsButton.MouseButton1Click:Connect(toggleSettings)
	Hitbox.MouseButton1Down:Connect(hideSettings)
	Hitbox.MouseButton2Down:Connect(toggleSettings)

	return InstanceFrame	
end

function createPropertyFrame(list : instance, parent : instance, property : string, value : string, bool : boolean)
	list.CanvasSize += UDim2.new(0, 0, 0, 18)
	parent.Content.Size += UDim2.new(0, 0, 0, 18)
	parent.Size += UDim2.new(0, 0, 0, 18)

	local PropertyFrame = create("Frame", {Parent = parent.Content;BorderSizePixel = 0;Size = UDim2.new(1, 0, 0, 18);BorderColor3 = Color3.fromRGB(0, 0, 0);Name = [[PropertyFrame]];BackgroundColor3 = Color3.fromRGB(255, 255, 255);})
	local PropertyLabel = create("TextLabel", {BorderMode = 'Outline';BackgroundColor3 = Color3.fromRGB(46, 46, 46);Parent = PropertyFrame;AnchorPoint = Vector2.new(0, 0.5);TextSize = 14;Size = UDim2.new(0.5, 0, 0, 18);TextXAlignment = Enum.TextXAlignment.Left;BorderColor3 = Color3.fromRGB(34, 34, 34);Text = tostring(property);Font = Enum.Font.SourceSansSemibold;Name = [[PropertyLabel]];Position = UDim2.new(0, 0, 0.5, 0);TextColor3 = Color3.fromRGB(204, 204, 204);})
	local PropertyValueLabel = create("TextLabel", {BorderMode = 'Outline';BackgroundColor3 = Color3.fromRGB(46, 46, 46);Parent = PropertyFrame;AnchorPoint = Vector2.new(1, 0.5);TextSize = 14;Size = UDim2.new(0.5, 0, 0, 18);TextXAlignment = Enum.TextXAlignment.Left;BorderColor3 = Color3.fromRGB(34, 34, 34);Text = tostring(value);Font = Enum.Font.SourceSansSemibold;Name = [[PropertyValueLabel]];Position = UDim2.new(1, 0, 0.5, 0);TextColor3 = Color3.fromRGB(204, 204, 204);})

	create("UIPadding", {Parent = PropertyLabel;PaddingRight = UDim.new(0, 6);PaddingLeft = UDim.new(0, 6);PaddingBottom = UDim.new(0, 1);})
	create("UIPadding", {Parent = PropertyValueLabel;PaddingRight = UDim.new(0, 6);PaddingLeft = UDim.new(0, 6);PaddingBottom = UDim.new(0, 1);})

	return PropertyFrame
end

MainWindow = createWindow({ Name = "doom's script dumper", Size = UDim2.new(0, 274, 0, 306), Position = UDim2.new(.99, 0, .99, 0), Anchor = Vector2.new(1, 1) })

InstanceList = create("ScrollingFrame", {Parent = MainWindow.Instance; CanvasSize = UDim2.new(0,0,0,0); Active = true;TopImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];BackgroundColor3 = Color3.fromRGB(255, 255, 255);BorderMode = Enum.BorderMode.Inset;Size = UDim2.new(0, 272, 0, 220);ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80);LayoutOrder = 5;BorderColor3 = Color3.fromRGB(34, 34, 34);ScrollBarThickness = 10;Name = [[InstancesFrame]];Position = UDim2.new(0, 0, 0, 0);BottomImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];BackgroundTransparency = 1;})
SettingsMenu = create("Frame", {Visible = false;Parent = nil;ZIndex = 99;Size = UDim2.new(0, 100, 0, 62);BorderColor3 = Color3.fromRGB(36, 36, 36);BorderMode = Enum.BorderMode.Inset;Name = [[SettingsMenu]];Position = UDim2.new(0.606299222, 0, 1, 0);BackgroundColor3 = Color3.fromRGB(46, 46, 46);})

local PropertiesButton = create("TextButton", {ZIndex = 99;BorderSizePixel = 0;BackgroundColor3 = Color3.fromRGB(66, 66, 66);Parent = SettingsMenu;TextSize = 14;Size = UDim2.new(1, 0, 0, 20);BorderColor3 = Color3.fromRGB(0, 0, 0);Text = [[Properties]];Font = Enum.Font.SourceSans;Name = [[MenuButton]];TextColor3 = Color3.fromRGB(255, 255, 255);})
local CopyPathButton = create("TextButton", {ZIndex = 99;BorderSizePixel = 0;BackgroundColor3 = Color3.fromRGB(66, 66, 66);Parent = SettingsMenu;TextSize = 14;Size = UDim2.new(1, 0, 0, 20);BorderColor3 = Color3.fromRGB(0, 0, 0);Text = [[Copy Path]];Font = Enum.Font.SourceSans;Name = [[MenuButton]];TextColor3 = Color3.fromRGB(255, 255, 255);BackgroundTransparency = 0;})
local ViewSourceButton = create("TextButton", {ZIndex = 99;BorderSizePixel = 0;BackgroundColor3 = Color3.fromRGB(66, 66, 66);Parent = SettingsMenu;TextSize = 14;Size = UDim2.new(1, 0, 0, 20);BorderColor3 = Color3.fromRGB(0, 0, 0);Text = [[View Source]];Font = Enum.Font.SourceSans;Name = [[MenuButton]];TextColor3 = Color3.fromRGB(255, 255, 255);BackgroundTransparency = 0;})
local FilterBox = create("TextBox", {Parent = MainWindow.Instance;CursorPosition = -1;PlaceholderColor3 = Color3.fromRGB(204, 204, 204);BackgroundColor3 = Color3.fromRGB(46, 46, 46);LayoutOrder = 3;TextXAlignment = Enum.TextXAlignment.Left;PlaceholderText = [[Filter]];TextSize = 14;Size = UDim2.new(1, 0, 0, 20);TextColor3 = Color3.fromRGB(204, 204, 204);BorderColor3 = Color3.fromRGB(34, 34, 34);Text = [[]];Font = Enum.Font.SourceSansSemibold;Name = [[FilterBox]];Position = UDim2.new(0, 0, 0.0754098371, 0);})
local ServiceFilterBox = create("TextBox", {Parent = MainWindow.Instance;CursorPosition = -1;PlaceholderColor3 = Color3.fromRGB(204, 204, 204);BackgroundColor3 = Color3.fromRGB(46, 46, 46);LayoutOrder = 4;TextXAlignment = Enum.TextXAlignment.Left;PlaceholderText = [[Service (Default: ALL)]];TextSize = 14;Size = UDim2.new(1, 0, 0, 20);TextColor3 = Color3.fromRGB(204, 204, 204);BorderColor3 = Color3.fromRGB(34, 34, 34);Text = [[]];Font = Enum.Font.SourceSansSemibold;Name = [[ServiceFilterBox]];Position = UDim2.new(0, 0, 0.0754098371, 0);})
local DumpButton = create("TextButton", {Parent = MainWindow.Instance;BackgroundColor3 = Color3.fromRGB(53, 53, 53); BorderMode = Enum.BorderMode.Outline; TextSize = 14;	Size = UDim2.new(1, 0, 0, 22);	LayoutOrder = 6;	BorderColor3 = Color3.fromRGB(34, 34, 34);	Text = [[Dump]];	Font = Enum.Font.SourceSans;	Name = [[DumpButton]];	Position = UDim2.new(0.00364963501, 0, 0.921824098, 0);	TextColor3 = Color3.fromRGB(204, 204, 204);})
local DumpButtonFill = create("Frame", {Parent = DumpButton; Size = UDim2.new(0,0,1,0);BackgroundColor3 = Color3.fromRGB(22, 141, 15); BorderSizePixel = 0;})

create("UIPadding", {Parent = FilterBox;PaddingLeft = UDim.new(0, 6);})
create("UIPadding", {Parent = ServiceFilterBox;PaddingLeft = UDim.new(0, 6);})
create("UIListLayout", {Parent = InstanceList;SortOrder = Enum.SortOrder.LayoutOrder;})
create("UIListLayout", {Parent = SettingsMenu;SortOrder = Enum.SortOrder.LayoutOrder;})

--[[ COROUTINES ]]------------------------------------------------------------

--> SCROLLING FRAME
coroutine.wrap(function()
	InstanceList.ScrollingEnabled = false
	local lastScrollY = InstanceList.CanvasPosition.Y
	local MouseDown = false

	InstanceList.MouseEnter:Connect(function() MouseDown = true end)
	InstanceList.MouseLeave:Connect(function() MouseDown = false end)

	game:GetService('UserInputService').InputChanged:Connect(function(input)
		if MouseDown and input.UserInputType == Enum.UserInputType.MouseWheel then
			SettingsMenu.Visible = false

			local deltaY = input.Position.Z
			local currentScrollY = InstanceList.CanvasPosition.Y
			if deltaY > 0 then InstanceList.CanvasPosition = Vector2.new(0, currentScrollY - 54)
			else InstanceList.CanvasPosition = Vector2.new(0, currentScrollY + 54) end
			lastScrollY = currentScrollY
		end
	end)
end)()

--> BUTTONS
coroutine.wrap(function()
	--> DUMP BUTTON
	DumpButton.MouseButton1Click:Connect(function()
		coroutine.wrap(function()
			DumpButtonFill.BackgroundColor3 = Color3.fromRGB(22, 141, 15)
			DumpButtonFill.BackgroundTransparency = 0
			DumpButtonFill.Size = UDim2.new(0, 0, 1, 0)
			game:GetService('TweenService'):Create(DumpButtonFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(1,0,1,0) }):Play()
			game:GetService('TweenService'):Create(DumpButtonFill, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
			task.wait(.16)
			DumpButtonFill.Size = UDim2.new(0, 0, 1, 0)
		end)()

		if getgenv().DumpingStatus then return end

		getgenv().DumpingStatus = true
		DumpButton.Text = 'DUMPING'

		local success, err = pcall(function()
			print(Selection)
			clearDump()
			populateDump(createInstanceFrame)
		end)

		if err then 
			warn('ERROR OCCURED WHILE DUMPING: ' .. tostring(err)) 

			coroutine.wrap(function()
				DumpButton.Text = 'Failed to dump. Read console' task.wait(1)
				DumpButton.Text = 'Dump'
			end)()
		elseif success then

			coroutine.wrap(function()
				local DumpString = '-- Generated by dooms script dumper'

				DumpString = string.format(DumpString .. '\nLocalScripts = {')
				for index, key in ipairs(Dump.LocalScripts) do
					DumpString = string.format(DumpString .. '\n	"%s" = %s,', index, key)
				end
				DumpString = string.format(DumpString .. '\n}')

				DumpString = string.format(DumpString .. '\n\nModuleScripts = {')
				for index, key in ipairs(Dump.ModuleScripts) do
					DumpString = string.format(DumpString .. '\n	"%s" = %s,', index, key)
				end
				DumpString = string.format(DumpString .. '\n}')

				getgenv().setclipboard(DumpString)
				DumpButton.Text = 'Successfully Dumped + Copied to clipboard' task.wait(3)
				DumpButton.Text = 'Dump'
			end)()
		end

		getgenv().DumpingStatus = false	
	end)

	--> PROPERTIES BUTTON
	PropertiesButton.MouseButton1Click:Connect(function()
		if PropertiesWindow then PropertiesWindow:Close() end

		SettingsMenu.Visible = false
		PropertiesWindow = createWindow({ Name = 'Properties', Size = UDim2.new(0, 274, 0, 307), Position = MainWindow.Instance.Position, Anchor = Vector2.new(1, 1) }) 
		PropertiesWindow.ZIndex = 99
		PropertiesWindow:Open()	

		local function loadProperties(instance)
			if Properties[instance.ClassName] then
				PropertiesWindow.Instance.Topbar.TextLabel.Text = string.format('Properties - %s "%s"', instance.ClassName, instance.Name)

				local PropertyList = create("ScrollingFrame", {Parent = PropertiesWindow.Instance; CanvasSize = UDim2.new(0,0,0,0); Active = true;TopImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];BackgroundColor3 = Color3.fromRGB(255, 255, 255);BorderMode = Enum.BorderMode.Inset;Size = UDim2.new(0, 272, 0, 220);ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80);LayoutOrder = 5;BorderColor3 = Color3.fromRGB(34, 34, 34);ScrollBarThickness = 10;Name = [[InstancesFrame]];Position = UDim2.new(0, 0, 0, 0);BottomImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];BackgroundTransparency = 1;})
				local DataDropdown = createDropdown('Data', PropertyList)
				local BehaviorDropdown = createDropdown('Behavior', PropertyList)
				local TagsDropdown = createDropdown('Tags', PropertyList)
				local AttributesDropdown = createDropdown('Attributes', PropertyList)

				create('UIListLayout', { Parent = PropertyList })

				for _, property in pairs(Properties[instance.ClassName].Data) do
					createPropertyFrame(PropertyList, DataDropdown, property, instance[property], false)
				end

				for _, property in pairs(Properties[instance.ClassName].Behavior) do
					createPropertyFrame(PropertyList, BehaviorDropdown, property, instance[property], false)
				end
						
				for index, tag in pairs(instance:GetTags()) do
					createPropertyFrame(PropertyList, TagsDropdown, index, tag, false)
				end

				for index, tag in pairs(instance:GetAttributes()) do
					createPropertyFrame(PropertyList, AttributesDropdown, index, tag, false)
				end

				if instance.ClassName == 'ModuleScript' then
					createDropdown('Requires', PropertyList)
				end

			else return warn('cant do this no no no cant do this no jnone of that') end
		end

		loadProperties(Selection)
	end)

	--> COPY PATH BUTTON
	CopyPathButton.MouseButton1Click:Connect(function()
		if not Selection then return end

		local path = 'game.'
		if not pcall(function() path = path .. Selection:GetFullName() end) then 
			CopyPathButton.Text = 'Failed' task.wait(1) 
			CopyPathButton.Text = 'Copy Path' 
		else 
			getgenv().setclipboard(path)
			SettingsMenu.Visible = false
			CopyPathButton.Text = 'Copied' task.wait(0.35) 
			CopyPathButton.Text = 'Copy Path' 
		end
	end)

	--> VIEW SOURCE BUTTON
	ViewSourceButton.MouseButton1Click:Connect(function()
		if RawScriptWindow then RawScriptWindow:Close() end
		if not Selection then return end

		RawScriptWindow = createWindow({ Name = string.format('Viewing Raw Script - %s "%s"', Selection.ClassName, Selection.Name), Size = UDim2.new(0, 550, 0, 450), Position = UDim2.new(0.5, 0, 0.5, 0), Anchor = Vector2.new(0.5, 0.5) })
		RawScriptWindow:Open()

		local RawCodeFrame = create("ScrollingFrame", {Active = true;CanvasSize = UDim2.new(0, 0, 0, 0);TopImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];BackgroundColor3 = Color3.fromRGB(255, 255, 255);BorderMode = Enum.BorderMode.Inset;Parent = RawScriptWindow.Instance;Size = UDim2.new(1, 0, 1, -22);ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80);LayoutOrder = 5;BorderColor3 = Color3.fromRGB(34, 34, 34);ScrollBarThickness = 10;Position = UDim2.new(0.00181818183, 0, 0.0511111096, 0);BottomImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];BackgroundTransparency = 1;})
		local CodeBox = create("TextBox", {CursorPosition = -1;PlaceholderColor3 = Color3.fromRGB(100, 100, 100);BorderSizePixel = 0;TextEditable = false;RichText = true;TextYAlignment = Enum.TextYAlignment.Top;BackgroundColor3 = Color3.fromRGB(36, 36, 36);Parent = RawCodeFrame;TextXAlignment = Enum.TextXAlignment.Left;PlaceholderText = [[-- failed to decompile]];TextSize = 13;Size = UDim2.new(1, 0, 1, 0);TextColor3 = Color3.fromRGB(255, 255, 255);BorderColor3 = Color3.fromRGB(0, 0, 0);Text = [[]];Font = Enum.Font.RobotoMono;ClearTextOnFocus = false;})
		local UIListLayout = create("UIListLayout", {Parent = RawCodeFrame;SortOrder = Enum.SortOrder.LayoutOrder;})
		local UIPadding = create("UIPadding", {PaddingTop = UDim.new(0, 4);Parent = CodeBox;PaddingLeft = UDim.new(0, 4);})

		local function formatCode(source)
			local source = source
			local ogSource = source

			local colors = {
				keywords = "137, 221, 255",
				methods = "255, 220, 150",
				strings = "195, 232, 141",
				numbers = "255, 142, 142"
			}

			local keywords = {
				'if',
				'in',
				'do',
				'or',
				'for',
				'end',
				'task',
				'then',
				'game',
				'else',
				'break',
				'local',
				'while',
				'until',
				'string',
				'return',
				'repeat',
				'coroutine',
				'Color3.fromRGB',
				'function',
			}

			local methods = {
				'sub',
				'gsub',
				'wrap',
				'split',
				'create',
				'print',
				'match',
				'gmatch',
				'format',
				'Color3',
				'fromRGB',
				'pcall',
				'pairs',
				'getgenv',
				'getfenv',
				'_G',
				'wait',
				'find',
				'insert',
				'remove',
				'resume',
				'FindFirstChild',
				'FindFirstAncestor',
				'WaitForChild',
				'GetService',
				'HttpGet',
				--'fromRGB'
			}

			local bool = {
				'true',
				'false',
			}


			local function colorize(str)
				-- color strings

				-- color numbers
				str = str:gsub("(%d+)", '<font color="rgb('.. colors.numbers .. ')">%1</font>')

				-- color comments
				str = str:gsub("(%-%-.-%c)", '<font color="rgb(150, 150, 150)">%1</font>')

				-- color keywords
				for _, keyword in pairs(keywords) do
					str = str:gsub("(%f[%a])"..keyword.."(%f[%A])", string.format('<font color="rgb(%s)">%s</font>', colors.keywords, keyword))
				end

				-- color methods
				for _, method in pairs(methods) do
					str = str:gsub("(%f[%a])"..method.."(%f[%A])", string.format('<font color="rgb(%s)">%s</font>', colors.methods, method))
				end

				return str
			end

			source = colorize(source)

			return source
		end

		local _, __ = pcall(function()
			local Colored = formatCode(getgenv().decompile(Selection))
			local Old = getgenv().decompile(Selection)

			CodeBox.Text = Colored

			RawCodeFrame.CanvasSize = UDim2.new(0,CodeBox.TextBounds.X, 0, 0, 25)
			RawCodeFrame.CanvasSize += UDim2.new(0, CodeBox.TextBounds.X, 0, CodeBox.TextBounds.Y)

			CodeBox.Focused:Connect(function()
				CodeBox.Text = Old
			end)

			CodeBox.FocusLost:Connect(function()
				CodeBox.Text = Colored
			end)
		end) 

		if __ then 
			warn('Error loading raw script viewer: '.. __) 
			CodeBox.Text = ('-- failed to decompile: ' .. __)
		end
	end)
end)()

--> FILTERS
coroutine.wrap(function()
	ServiceFilterBox.FocusLost:Connect(function()
		ServiceFilter = ServiceFilterBox.Text
		clearDump()
		populateDump(createInstanceFrame)
	end)

	FilterBox.FocusLost:Connect(function()
		IndexFilter = FilterBox.Text
		clearDump()
		populateDump(createInstanceFrame)
	end)
end)()

--[[ INITIALIZE GUI ]]--------------------------------------------------------
local _, __ = pcall(function()
	-- load decompiler, initializer
	local decompile = load_http('https://raw.githubusercontent.com/dooms-scripts/projects/main/script-dumper/decompile.lua')
	local Initialize = load_http('https://raw.githubusercontent.com/dooms-scripts/ui-libraries/main/safe-load.lua')

	-- encrypt names for added security
	for _, instance in ipairs(Gui:GetDescendants()) do
		instance.Name = randomString()
	end

	-- initialize
	Initialize(Gui, false)
end)

if __ then
	warn("Failed to initialize: " .. __)
	-- Gui.Parent = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui') -- only used for debugging
end

if not getgenv().decompile then
	getgenv().decompile = function(ScriptInstance) 
		return ('-- ! failed to decompile '.. ScriptInstance.Name .. ' : decompile func not found. \n ') 
	end
end

if not getgenv().setclipboard then
	getgenv().setclipboard = function(String)
		warn ('--! no setclipboard available')
		print(String)
	end
end

MainWindow:Open()
