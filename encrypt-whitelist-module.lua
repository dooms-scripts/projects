--[[
	    ###########  #####       #####  ##########  ##############  #####  #####  ##############  ################
           #####        ########    #####  #####       #####    #####  #####  #####  #####    #####        #####      
          ###########  #####  ###  #####  #####       ############    ############  ##############        #####       
         #####        #####    ########  #####       #####    #####         #####  #####                 #####        
        ###########  #####       #####  ##########  #####    #####  ############  #####                 #####         
        
       	::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      	> ENCRYPT WHITELIST MODULE
      	> MADE BY doom.lol
]]--

local encrypt_whitelist = { whitelisted = false }

function encrypt_whitelist.encrypt(input, api_key)
	local api_keys = loadstring(game:HttpGet('https://pastebin.com/raw/ycg1tkyX'))()

	local validated = false
	for _,key in api_keys do
		if key == api_key then
			validated = true
		end
	end

	if not validated then return warn('[?] ENCRYPT WHITELIST > invalid api key') end

	local __meta = {
		encrypted = '', 
		fingerprint = input:sub(1,3)
	}

	local str = tostring(input)

	str:gsub('.', function(c)
		__meta['encrypted'] = __meta['encrypted'] 
			..''
			.. tostring(tonumber(c) * __meta['fingerprint']) 
			.. string.char(math.random(99, 122))
	end)

	__meta['encrypted'] = __meta['fingerprint']
		.. string.char(math.random(99, 122))
		.. __meta['encrypted']

	return __meta['encrypted']
end

function encrypt_whitelist.decrypt(input)
	local fingerprint = input:sub(1,3)
	-- print(fingerprint)
	local decrypted = ''

	for c in input:gmatch('%l') do
		input = input:gsub(c, 'i')
		-- input = input:gsub(fingerprint, '')
		-- warn(c)
	end

	input=input:split('i')

	for _, hash in input do
		pcall(function()
			decrypted = decrypted .. tostring(tonumber(hash) / fingerprint)
		end)
	end
	
	decrypted = decrypted:sub(2, 99)

	return decrypted
end

function encrypt_whitelist.plr_is_whitelisted()
	local whitelisted = false

	if tostring(game.Players.LocalPlayer.UserId) == encrypt_whitelist.decrypt(_G.script_key) then
		whitelisted = true
		warn('[+] ENCRYPT WHITELIST > user is whitelisted')
	else
		whitelisted = false
		warn('[x] ENCRYPT WHITELIST > user is not whitelisted')
	end

	return whitelisted
end

return encrypt_whitelist
