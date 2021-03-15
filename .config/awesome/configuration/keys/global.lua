local awful = require('awful')
local beautiful = require('beautiful')

require('awful.autofocus')

local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key
local apps = require('configuration.apps')

-- Key bindings
local global_keys = awful.util.table.join(

	-- Awesome
	awful.key(
		{modkey},
		'F1',
		hotkeys_popup.show_help,
		{description = 'show help', group = 'awesome'}
	),
	awful.key({modkey, 'Control'},
		'r',
		awesome.restart,
		{description = 'reload awesome', group = 'awesome'}
	),
	awful.key({modkey, 'Control'},
		'q',
		awesome.quit,
		{description = 'quit awesome', group = 'awesome'}
	),

	-- Launcher
	awful.key(
		{modkey},
		'd',
		function()
			local s = awful.screen.focused()
			awful.spawn(
				s.selected_tag.default_app,
				{
					tag = s.selected_tag
				}
			)
		end,
		{description = 'open default app', group = 'launcher'}
	),
	awful.key(
		{modkey},
		'Return',
		function()
			awful.spawn(apps.default.terminal)
		end,
		{description = 'open default terminal', group = 'launcher'}
	),
	awful.key(
		{modkey},
		'e',
		function()
			awful.spawn(apps.default.file_manager)
		end,
		{description = 'open default file manager', group = 'launcher'}
	),
	awful.key(
		{modkey},
		'b',
		function()
			awful.spawn(apps.default.web_browser)
		end,
		{description = 'open default web browser', group = 'launcher'}
	),
	awful.key(
		{'Control', 'Shift'},
		'Escape',
		function()
			awful.spawn(apps.default.terminal .. ' -e htop')
		end,
		{description = 'open system monitor', group = 'launcher'}
	),

	-- Menus
	awful.key(
		{modkey},
		'r',
		function()
			local focused = awful.screen.focused()

			if focused.central_panel and focused.central_panel.visible then
				focused.central_panel:toggle()
			end
			if focused.control_center and focused.control_center.visible then
				focused.control_center:toggle()
			end
			awful.spawn(apps.default.rofi_appmenu, false)
		end,
		{description = 'open application drawer', group = 'menu'}
	),
	awful.key(
		{modkey},
		'x',
		function()
			local focused = awful.screen.focused()
			if not focused.exit_screen.visible then
				if focused.central_panel and focused.central_panel.visible then
					focused.central_panel:toggle()
				end
				if focused.control_center and focused.control_center.visible then
					focused.control_center:toggle()
				end
				awesome.emit_signal('module::exit_screen:show')
			else
				awesome.emit_signal('module::exit_screen:hide')
			end
		end,
		{description = 'toggle exit screen', group = 'menu'}
	),
	awful.key(
		{modkey},
		'a',
		function()
			local focused = awful.screen.focused()

			if focused.control_center and focused.control_center.visible then
				focused.control_center:toggle()
			end
			if focused.central_panel then
				focused.central_panel:toggle()
			end
		end,
		{description = 'toggle notifications panel', group = 'menu'}
	),
	awful.key(
		{modkey},
		'o',
		function()
			local focused = awful.screen.focused()

			if focused.central_panel and focused.central_panel.visible then
				focused.central_panel:toggle()
			end
			if focused.control_center then
				focused.control_center:toggle()
			end
		end,
		{description = 'toggle options panel', group = 'menu'}
	),

	-- Layout
	awful.key(
		{modkey},
		'space',
		function()
			awful.layout.inc(1)
		end,
		{description = 'select next layout', group = 'layout'}
	),
	awful.key(
		{modkey, 'Shift'},
		'space',
		function()
			awful.layout.inc(-1)
		end,
		{description = 'select previous layout', group = 'layout'}
	),
	awful.key(
		{modkey},
		'KP_Subtract',
		function()
			awful.tag.incncol(-1, nil, true)
		end,
		{description = 'decrease/increase the number of columns', group = 'layout'}
	),
	awful.key(
		{modkey},
		'KP_Add',
		function()
			awful.tag.incncol(1, nil, true)
		end,
		{description = 'decrease/increase the number of columns', group = 'layout'}
	),

	-- Tags
	awful.key(
		{modkey},
		'k',
		awful.tag.viewprev,
		{description = 'view previous tag', group = 'tag'}
	),
	awful.key(
		{modkey},
		'j',
		awful.tag.viewnext,
		{description = 'view next tag', group = 'tag'}
	),

	-- Screens
	awful.key(
		{modkey, 'Control'},
		'h',
		function()
			awful.screen.focus_relative(-1)
		end,
		{ description = 'focus the previous/next screen', group = 'screens'}
	),
	awful.key(
		{modkey, 'Control'},
		'l',
		function()
			awful.screen.focus_relative(1)
		end,
		{ description = 'focus the previous/next screen', group = 'screens'}
	),

	-- Screenshots
	awful.key(
		{ },
		'Print',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.screenshot.full, function() end)
		end,
		{description = 'copy full screenshot', group = 'screenshot'}
	),
	awful.key(
		{ 'Shift' },
		'Print',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.screenshot.selection, function() end)
		end,
		{description = 'copy selection screenshot', group = 'screenshot'}
	),
	awful.key(
		{ 'Control' },
		'Print',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.screenshot.full_saved, function() end)
		end,
		{description = 'save full screenshot', group = 'screenshot'}
	),
	awful.key(
		{ 'Control', 'Shift' },
		'Print',
		function ()
			awful.spawn.easy_async_with_shell(apps.utils.screenshot.selection_saved, function() end)
		end,
		{description = 'save selection screenshot', group = 'screenshot'}
	),

	-- Brightness
	awful.key(
		{},
		'XF86MonBrightnessDown',
		function()
			awful.spawn('light -U 5', false)
			awesome.emit_signal('widget::brightness')
			awesome.emit_signal('module::brightness_osd:show', true)
		end,
		{description = 'decrease/increase brightness', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86MonBrightnessUp',
		function()
			awful.spawn('light -A 5', false)
			awesome.emit_signal('widget::brightness')
			awesome.emit_signal('module::brightness_osd:show', true)
		end,
		{description = 'decrease/increase brightness', group = 'hotkeys'}
	),

	-- Audio control
	awful.key(
		{},
		'XF86AudioLowerVolume',
		function()
			awful.spawn('amixer -D pulse sset Master 5%-', false)
			awesome.emit_signal('widget::volume')
			awesome.emit_signal('module::volume_osd:show', true)
		end,
		{description = 'decrease/increase volume', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioRaiseVolume',
		function()
			awful.spawn('amixer -D pulse sset Master 5%+', false)
			awesome.emit_signal('widget::volume')
			awesome.emit_signal('module::volume_osd:show', true)
		end,
		{description = 'decrease/increase volume', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioMute',
		function()
			awful.spawn('amixer -D pulse set Master 1+ toggle', false)
		end,
		{description = 'toggle mute', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioPrev',
		function()
			awful.spawn('playerctl previous', false)
		end,
		{description = 'previous/next music', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioNext',
		function()
			awful.spawn('playerctl next', false)
		end,
		{description = 'previous/next music', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86AudioPlay',
		function()
			awful.spawn('playerctl play-pause', false)
		end,
		{description = 'play/pause music', group = 'hotkeys'}

	),


	awful.key(
		{},
		'XF86PowerDown',
		function()
			awesome.emit_signal('module::exit_screen:show')
		end,
		{description = 'shutdown skynet', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86PowerOff',
		function()
			awesome.emit_signal('module::exit_screen:show')
		end,
		{description = 'toggle exit screen', group = 'hotkeys'}
	),
	awful.key(
		{},
		'XF86Display',
		function()
			awful.spawn.single_instance('arandr', false)
		end,
		{description = 'arandr', group = 'hotkeys'}
	),


	awful.key(
		{ 'Control' },
		'Escape',
		function ()
			if screen.primary.systray then
				if not screen.primary.tray_toggler then
					local systray = screen.primary.systray
					systray.visible = not systray.visible
				else
					awesome.emit_signal('widget::systray:toggle')
				end
			end
		end,
		{description = 'toggle systray visibility', group = 'Utility'}
	)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 6 do
	-- Hack to only show tags 1 and 6 in the shortcut window (mod+s)
	local descr_view, descr_move, descr_toggle_focus
	if i == 1 or i == 6 then
		descr_view = {description = 'view tag #', group = 'tag'}
		descr_move = {description = 'move focused client to tag #', group = 'tag'}
		descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
	end
	global_keys =
		awful.util.table.join(
		global_keys,
		-- View tag only.
		awful.key(
			{modkey},
			'#' .. i + 9,
			function()
				local focused = awful.screen.focused()
				local tag = focused.tags[i]
				if tag then
					tag:view_only()
				end
			end,
			descr_view
		),
		-- Move client to tag.
		awful.key(
			{modkey, 'Shift'},
			'#' .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			descr_move
		),
		-- Toggle tag on focused client.
		awful.key(
			{modkey, 'Control', 'Shift'},
			'#' .. i + 9,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end,
			descr_toggle_focus
		)
	)
end

return global_keys
