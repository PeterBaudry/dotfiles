local filesystem = require('gears.filesystem')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'

local theme = {}

theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto Regular 10'
theme.font_bold = 'Roboto Bold 10'

-- Colorscheme
theme.system_black_dark = '#1e2127'
theme.system_black_light = '#5c6370'

theme.system_red_dark = '#e06c75'
theme.system_red_light = '#e06c75'

theme.system_green_dark = '#98c379'
theme.system_green_light = '#98c379'

theme.system_yellow_dark = '#d19a66'
theme.system_yellow_light = '#d19a66'

theme.system_blue_dark = '#277FFF'
theme.system_blue_light = '#367bf0'

theme.system_magenta_dark = '#c678dd'
theme.system_magenta_light = '#c678dd'

theme.system_cyan_dark = '#56b6c2'
theme.system_cyan_light = '#56b6c2'

theme.system_white_dark = '#abb2bf'
theme.system_white_light = '#ffffff'

-- Accent color
theme.accent = theme.system_blue_dark

-- Background color
theme.background = '#1e2127' .. '66'

-- Transparent
theme.transparent = '#00000000'

-- Awesome icon
theme.awesome_icon = theme.icons .. 'awesome.svg'

local awesome_overrides = function(theme) end

return {
	theme = theme,
 	awesome_overrides = awesome_overrides
}
