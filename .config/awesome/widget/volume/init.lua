local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local naughty = require('naughty')
local watch = awful.widget.watch
local dpi = require('beautiful').xresources.apply_dpi

local apps = require('configuration.apps')

local clickable_container = require('widget.clickable-container')

local icons = require('theme.icons')

local return_button = function()

	local widget =
		wibox.widget {
		{
			id = 'icon',
			image = icons.volume_off,
			widget = wibox.widget.imagebox,
			resize = true
		},
		layout = wibox.layout.align.horizontal
	}

	local widget_button = wibox.widget {
		{
			widget,
			margins = dpi(7),
			widget = wibox.container.margin
		},
		widget = clickable_container
	}

	widget_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(apps.default.volume_manager, false)
				end
			),
			awful.button(
				{},
				2,
				nil,
				function()
					awful.spawn('amixer -D pulse set Master 1+ toggle', false)
					awesome.emit_signal('widget::volume')
					awesome.emit_signal('module::volume_osd:show', true)
				end
			),
			awful.button(
				{},
				4,
				nil,
				function()
					awful.spawn('amixer -D pulse sset Master 5%+', false)
					awesome.emit_signal('widget::volume')
					awesome.emit_signal('module::volume_osd:show', true)
				end
			),
			awful.button(
				{},
				5,
				nil,
				function()
					awful.spawn('amixer -D pulse sset Master 5%-', false)
					awesome.emit_signal('widget::volume')
					awesome.emit_signal('module::volume_osd:show', true)
				end
			)
		)
	)

	local volume_tooltip = awful.tooltip
	{
		objects = {widget_button},
		mode = 'outside',
		align = 'right',
		margin_leftright = dpi(8),
		margin_topbottom = dpi(8),
		preferred_positions = {'right', 'left', 'top', 'bottom'}
	}

	watch(
		'amixer -D pulse sget Master',
		1,
		function(_, stdout)
			local icon = icons.volume_mute
			if stdout:match('off') then
				volume_tooltip.markup = 'Mute'
			else
				local volume = tonumber(string.match(stdout, '(%d?%d?%d)%%'))
				volume_tooltip.markup = volume .. '%'
				if volume == 0 then
					icon = icons.volume_off
				elseif volume < 50 then
					icon = icons.volume_low
				else
					icon = icons.volume_high
				end
			end
			widget.icon:set_image(icon)
			collectgarbage('collect')
		end,
		widget
	)

	return widget_button

end

return return_button