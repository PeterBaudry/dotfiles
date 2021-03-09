local awful = require('awful')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
require('awful.autofocus')
local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key

local client_keys = awful.util.table.join(

	-- Toggle fullscreen
	awful.key(
		{modkey},
		'Escape',
		function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = 'toggle fullscreen', group = 'client'}
	),

	-- Close client
	awful.key(
		{modkey},
		'q',
		function(c)
			c:kill()
		end,
		{description = 'close', group = 'client'}
	),

	-- Focus clients
	awful.key(
		{modkey},
		'h',
		function()
			awful.client.focus.byidx(-1)
		end,
		{description = 'focus previous/next client', group = 'client'}
	),
	awful.key(
		{modkey},
		'l',
		function()
			awful.client.focus.byidx(1)
		end,
		{description = 'focus previous/next client', group = 'client'}
	),

	-- Swap clients
	awful.key(
		{ modkey, 'Shift' },
		'h',
		function ()
			awful.client.swap.byidx(-1)
		end,
		{description = 'swap with previous/next client', group = 'client'}
	),
	awful.key(
		{ modkey, 'Shift'  },
		'l',
		function ()
			awful.client.swap.byidx(1)
		end,
		{description = 'swap with previous/next client', group = 'client'}
	),

	-- Move client to tag.
	awful.key(
		{modkey, 'Shift'},
		'k',
		function()
			local t = client.focus and client.focus.first_tag or nil
			if t == nil then
					return
			end

			local tag = client.focus.screen.tags[(t.name - 2) % 6 + 1]
			awful.client.movetotag(tag)
			awful.tag.viewprev()
		end,
	{description = 'move client to previous/next tag', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'j',
		function()
			local t = client.focus and client.focus.first_tag or nil
			if t == nil then
					return
			end

			local tag = client.focus.screen.tags[(t.name % 6) + 1]
			awful.client.movetotag(tag)
			awful.tag.viewnext()
		end,
	{description = 'move client to previous/next tag', group = 'client'}
	),

	-- Move clients to screen
	awful.key(
		{ modkey, 'Shift', 'Control' },
		'h',
		function (c)
			c:move_to_screen(c.screen.index-1)
		end,
		{description = 'move client to previous/next screen', group = 'client'}
	),
	awful.key(
		{ modkey, 'Shift', 'Control' },
		'l',
		function (c)
			c:move_to_screen(c.screen.index+1)
		end,
		{description = 'move client to previous/next screen', group = 'client'}
	),

	-- Jump to urgent
	awful.key(
		{modkey},
		'u',
		awful.client.urgent.jumpto,
		{description = 'jump to urgent client', group = 'client'}
	),

	-- Minimize clients
	awful.key(
			{modkey},
			'n',
			function(c)
					c.minimized = true
			end,
			{description = 'minimize client', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'n',
		function()
			local c = awful.client.restore()
			if c then
				c:emit_signal('request::activate')
				c:raise()
			end
		end,
		{description = 'restore minimized client', group = 'client'}
	),

	-- Floating clients
	awful.key(
		{modkey},
		'c',
		function(c)
			c.fullscreen = false
			c.maximized = false
			c.floating = not c.floating
			c:raise()
		end,
		{description = 'toggle floating', group = 'client'}
	),
	awful.key(
		{ modkey, 'Shift' },
		'c',
		function(c)
			local focused = awful.screen.focused()

			awful.placement.centered(c, {
				honor_workarea = true
			})
		end,
		{description = 'align a client to center', group = 'client'}
	),
	awful.key(
		{modkey},
		'Up',
		function(c)
			c:relative_move(0, dpi(-10), 0, 0)
		end,
		{description = 'move floating client', group = 'client'}
	),
	awful.key(
		{modkey},
		'Down',
		function(c)
			c:relative_move(0, dpi(10), 0, 0)
		end,
		{description = 'move floating client', group = 'client'}
	),
	awful.key(
		{modkey},
		'Left',
		function(c)
			c:relative_move(dpi(-10), 0, 0, 0)
		end,
		{description = 'move floating client', group = 'client'}
	),
	awful.key(
		{modkey},
		'Right',
		function(c)
			c:relative_move(dpi(10), 0, 0, 0)
		end,
		{description = 'move floating client', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Up',
		function(c)
			c:relative_move(0, dpi(-10), 0, dpi(10))
		end,
		{description = 'increase floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Down',
		function(c)
			c:relative_move(0, 0, 0, dpi(10))
		end,
		{description = 'increase floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Left',
		function(c)
			c:relative_move(dpi(-10), 0, dpi(10), 0)
		end,
		{description = 'increase floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Shift'},
		'Right',
		function(c)
			c:relative_move(0, 0, dpi(10), 0)
		end,
		{description = 'increase floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Up',
		function(c)
			if c.height > 10 then
				c:relative_move(0, 0, 0, dpi(-10))
			end
		end,
		{description = 'decrease floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Down',
		function(c)
			local c_height = c.height
			c:relative_move(0, 0, 0, dpi(-10))
			if c.height ~= c_height and c.height > 10 then
				c:relative_move(0, dpi(10), 0, 0)
			end
		end,
		{description = 'decrease floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Left',
		function(c)
			if c.width > 10 then
				c:relative_move(0, 0, dpi(-10), 0)
			end
		end,
		{description = 'decrease floating client size', group = 'client'}
	),
	awful.key(
		{modkey, 'Control'},
		'Right',
		function(c)
			local c_width = c.width
			c:relative_move(0, 0, dpi(-10), 0)
			if c.width ~= c_width and c.width > 10 then
				c:relative_move(dpi(10), 0 , 0, 0)
			end
		end,
		{description = 'decrease floating client size', group = 'client'}
	)
)

return client_keys
