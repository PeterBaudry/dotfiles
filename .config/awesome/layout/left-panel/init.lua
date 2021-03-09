local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local tag_list = require('widget.tag-list')

local left_panel = function(screen)

	local action_bar_width = dpi(45)

	local panel = wibox {
		screen = screen,
		width = action_bar_width,
		type = 'dock',
		height = screen.geometry.height,
		x = screen.geometry.x,
		y = screen.geometry.y,
		ontop = true,
		shape = gears.shape.rectangle,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}

	panel.opened = false

	panel:struts {
		left = action_bar_width
	}

	panel:setup {
		layout = wibox.layout.align.horizontal,
		wibox.widget {
			id = 'action_bar',
			layout = wibox.layout.align.vertical,
			forced_width = action_bar_width,
			{
				require('widget.search-apps')(),
				tag_list(screen),
				require("widget.xdg-folders")(),
				layout = wibox.layout.fixed.vertical,
			},
			nil
		}
	}
	return panel
end

return left_panel
