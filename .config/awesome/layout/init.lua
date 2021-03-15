local awful = require('awful')
local top_panel = require('layout.top-panel')
local central_panel =  require('layout.central-panel')
local control_center = require('layout.control-center')

-- Create a wibox panel for each screen and add it
screen.connect_signal(
	'request::desktop_decoration',
	function(s)
		s.top_panel = top_panel(s)
		s.central_panel = central_panel(s)
		s.control_center = control_center(s)
		s.control_center_show_again = false
	end
)


-- Hide bars when app go fullscreen
function update_bars_visibility()
	for s in screen do
		if s.selected_tag then
			local fullscreen = s.selected_tag.fullscreen_mode
			-- Order matter here for shadow
			s.top_panel.visible = not fullscreen
			if s.control_center then
				if fullscreen and s.control_center.visible then
					s.control_center:toggle()
					s.control_center_show_again = true
				elseif not fullscreen and not s.control_center.visible and s.control_center_show_again then
					s.control_center:toggle()
					s.control_center_show_again = false
				end
			end
		end
	end
end

tag.connect_signal(
	'property::selected',
	function(t)
		update_bars_visibility()
	end
)

client.connect_signal(
	'property::fullscreen',
	function(c)
		if c.first_tag then
			c.first_tag.fullscreen_mode = c.fullscreen
		end
		update_bars_visibility()
	end
)

client.connect_signal(
	'unmanage',
	function(c)
		if c.fullscreen then
			c.screen.selected_tag.fullscreen_mode = false
			update_bars_visibility()
		end
	end
)
