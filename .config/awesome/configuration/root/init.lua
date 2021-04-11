local gears = require('gears')
local awful = require('awful')

local apps = require('configuration.apps')
local modkey = require('configuration.keys.mod').mod_key

root.buttons(
	gears.table.join(
		awful.button(
			{},
			1,
		 	function()
		 		if mymainmenu then
					mymainmenu:hide()
				end
		 	end
		),
		awful.button(
			{},
			3,
			function ()
				if mymainmenu then
					mymainmenu:toggle()
				end 
			end
		),
		awful.button(
			{},
			2,
			function ()
				awful.util.spawn(apps.default.rofi_appmenu)
			end
		),
		awful.button(
			{modkey},
			'4',
			awful.tag.viewprev
		),
		awful.button(
			{modkey},
			'5',
			awful.tag.viewnext
		)
	)
)