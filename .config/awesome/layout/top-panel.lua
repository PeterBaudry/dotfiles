local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local task_list = require('widget.task-list')

local top_panel = function(s, offset)

	local offsetx = 0
	if offset == true then
		offsetx = dpi(45)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = s.geometry.width - offsetx,
		x = s.geometry.x + offsetx,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}

	panel:struts
	{
		top = dpi(28)
	}

	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'hand1'
			end
		end
	)

	s.systray = wibox.widget {
		visible = false,
		base_size = dpi(20),
		horizontal = true,
		screen = 'primary',
		widget = wibox.widget.systray
	}

	local clock 			= require('widget.clock')(s)
	local layout_box 		= require('widget.layoutbox')(s)
	local add_button 		= require('widget.open-default-app')(s)
	s.tray_toggler  		= require('widget.tray-toggle')
	s.updater 				= require('widget.package-updater')()
	s.battery     			= require('widget.battery')()
	s.control_center_toggle = require('widget.control-center-toggle')()

	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = 'none',
		{
			layout = wibox.layout.fixed.horizontal,
			task_list(s),
			add_button
		}, 
		clock,
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(5),
			{
				s.systray,
				margins = dpi(5),
				widget = wibox.container.margin
			},
			s.tray_toggler,
			s.updater,
			s.battery,
			layout_box,
			s.control_center_toggle,
		}
	}

	return panel
end


return top_panel
