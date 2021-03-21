-- 	   ________
-- 	  / ____/ /___  ____  ____  __  __
--   / /_  / / __ \/ __ \/ __ \/ / / /
--  / __/ / / /_/ / /_/ / /_/ / /_/ /
-- /_/   /_/\____/ .___/ .___/\__, /
-- 				/_/   /_/    /____/

local gears = require('gears')
local beautiful = require('beautiful')
local awful = require('awful')
require('awful.autofocus')

--    _____ __         ____
--   / ___// /_  ___  / / /
--   \__ \/ __ \/ _ \/ / /
--  ___/ / / / /  __/ / /
-- /____/_/ /_/\___/_/_/

awful.util.shell = 'zsh'

--   ________
--  /_  __/ /_  ___  ____ ___  ___
--   / / / __ \/ _ \/ __ `__ \/ _ \
--  / / / / / /  __/ / / / / /  __/
-- /_/ /_/ /_/\___/_/ /_/ /_/\___/

beautiful.init(require('theme'))

--     __                            __
--    / /   ____ ___  ______  __  __/ /_
--   / /   / __ `/ / / / __ \/ / / / __/
--  / /___/ /_/ / /_/ / /_/ / /_/ / /_
-- /_____/\__,_/\__, /\____/\__,_/\__/
-- 			   /____/

require('layout')

--    ______            _____                        __  _
--   / ____/___  ____  / __(_)___ ___  ___________ _/ /_(_)___  ____  _____
--  / /   / __ \/ __ \/ /_/ / __ `/ / / / ___/ __ `/ __/ / __ \/ __ \/ ___/
-- / /___/ /_/ / / / / __/ / /_/ / /_/ / /  / /_/ / /_/ / /_/ / / / (__  )
-- \____/\____/_/ /_/_/ /_/\__, /\__,_/_/   \__,_/\__/_/\____/_/ /_/____/
-- 						  /____/

require('configuration.client')
require('configuration.root')
require('configuration.tags')
root.keys(require('configuration.keys.global'))

--     __  ___          __      __
--    /  |/  /___  ____/ /_  __/ /__  _____
--   / /|_/ / __ \/ __  / / / / / _ \/ ___/
--  / /  / / /_/ / /_/ / /_/ / /  __(__  )
-- /_/  /_/\____/\__,_/\__,_/_/\___/____/

require('module.notifications')
require('module.auto-start')
require('module.exit-screen')
require('module.menu')
require('module.titlebar')
require('module.brightness-osd')
require('module.volume-osd')

--  _       __      ____
-- | |     / /___ _/ / /___  ____ _____  ___  _____
-- | | /| / / __ `/ / / __ \/ __ `/ __ \/ _ \/ ___/
-- | |/ |/ / /_/ / / / /_/ / /_/ / /_/ /  __/ /
-- |__/|__/\__,_/_/_/ .___/\__,_/ .___/\___/_/
--                 /_/         /_/

screen.connect_signal(
	'request::wallpaper',
	function(s)
		-- If wallpaper is a function, call it with the screen
		if beautiful.wallpaper then
			if type(beautiful.wallpaper) == 'string' then

				-- Check if beautiful.wallpaper is color/image
				if beautiful.wallpaper:sub(1, #'#') == '#' then
					-- If beautiful.wallpaper is color
					gears.wallpaper.set(beautiful.wallpaper)

				elseif beautiful.wallpaper:sub(1, #'/') == '/' then
					-- If beautiful.wallpaper is path/image
					gears.wallpaper.maximized(beautiful.wallpaper, s)
				end
			else
				beautiful.wallpaper(s)
			end
		end
	end
)
