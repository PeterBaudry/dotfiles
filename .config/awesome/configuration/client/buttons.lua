local awful = require('awful')
local modkey = require('configuration.keys.mod').mod_key

return awful.util.table.join(
	awful.button(
		{},
		1,
		function(c)
			c:emit_signal('request::activate')
			c:raise()
		end
	),
	awful.button(
		{modkey},
		1,
		awful.mouse.client.move
	),
	awful.button(
		{modkey},
		3,
		awful.mouse.client.resize
	),
	awful.button(
		{modkey},
		4,
		function(t)
			awful.tag.viewprev(t.screen)
		end
	),
	awful.button(
		{modkey},
		5,
		function(t)
			awful.tag.viewnext(t.screen)
		end
	)
)
