local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local tag_list = require('widget.tag-list')
local task_list = require('widget.task-list')

local top_panel = function(s)

	local separator =  wibox.widget {
		orientation = 'vertical',
		forced_height = dpi(1),
		forced_width = dpi(1),
		span_ratio = 0.55,
		widget = wibox.widget.separator
	}

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(30),
		width = s.geometry.width,
		x = s.geometry.x,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}

	panel:struts
	{
		top = dpi(30)
	}

	s.systray = wibox.widget {
		visible = false,
		base_size = dpi(20),
		horizontal = true,
		screen = 'primary',
		opacity = 0,
		widget = wibox.widget.systray
	}

	local clock 			= require('widget.clock')(s)
	local layout_box 		= require('widget.layoutbox')(s)
	local add_button 		= require('widget.open-default-app')(s)
	s.tray_toggler  		= require('widget.tray-toggle')
	s.updater 				= require('widget.package-updater')()
	s.volume   				= require('widget.volume')()
	s.bluetooth   			= require('widget.bluetooth')()
	s.network       		= require('widget.network')()
	s.battery     			= require('widget.battery')()
	s.search_apps			= require('widget.search-apps')()
	s.control_center_toggle = require('widget.control-center-toggle')()

	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = 'none',
		{
			layout = wibox.layout.fixed.horizontal,
			tag_list(s),
			separator,
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
			s.volume,
			s.bluetooth,
			s.network,
			s.battery,
			s.search_apps,
			layout_box,
			s.control_center_toggle,
		}
	}

	return panel
end


return top_panel
