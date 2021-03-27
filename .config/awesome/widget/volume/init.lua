local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local naughty = require('naughty')
local watch = awful.widget.watch
local dpi = require('beautiful').xresources.apply_dpi

local apps = require('configuration.apps')

local clickable_container = require('widget.clickable-container')

local config_dir = gears.filesystem.get_configuration_dir()

local widget_icon_dir = config_dir .. 'widget/volume/icons/'

local return_button = function()

	local widget =
		wibox.widget {
		{
			id = 'icon',
			image = widget_icon_dir .. 'volume-off' .. '.svg',
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
			local widget_icon_name = nil
			local volume = tonumber(string.match(stdout, '(%d?%d?%d)%%'))
			volume_tooltip.markup = volume .. '%'
			if stdout:match('off') then
				widget_icon_name = 'volume-mute'
				volume_tooltip.markup = 'Mute'
			elseif volume == 0 then
				widget_icon_name = 'volume-off'
			elseif volume < 30 then
				widget_icon_name = 'volume-low'
			else
				widget_icon_name = 'volume-high'
			end
			widget.icon:set_image(widget_icon_dir .. widget_icon_name .. '.svg')
			collectgarbage('collect')
		end,
		widget
	)

	return widget_button

end

return return_button