local filesystem = require('gears.filesystem')
local theme = require('theme')
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. 'utilities/'

return {
	-- The default applications that we will use in keybindings and widgets
	default = {
		-- Default terminal emulator
		terminal = 'alacritty',
		-- Default web browser
		web_browser = 'brave',
		-- Default text editor
		text_editor = 'code',
		-- Default file manager
		file_manager = 'nautilus',
		-- Default media player
		multimedia = 'celluloid',
		-- Default game, can be a launcher like steam
		game = 'shadow-preprod',
		-- Default graphics editor
		graphics = 'gimp-2.10',
		-- Default sandbox
		sandbox = 'virtualbox',
		-- Default IDE
		development = 'code',
		-- Default bluetooth manager
		bluetooth_manager = 'blueman-manager',
		-- Default power manager
		power_manager = 'xfce4-power-manager',
		-- Default GUI package manager
		package_manager = 'pamac-manager',
		-- Default locker
		lock = 'light-locker-command -l',
		-- Default app menu
		rofi_appmenu = 'rofi -dpi ' .. screen.primary.dpi ..
							' -show drun -theme ' .. config_dir ..
							'/configuration/rofi/rofi.rasi'

		-- You can add more default applications here
	},

	-- List of apps to start once on start-up
	run_on_start_up = {
		-- Compositor
		'picom -b --experimental-backends --dbus --config ' ..
		config_dir .. '/configuration/picom.conf',
		-- Network manager applet
		'nm-applet',
		-- Blueman applet
		'blueman-applet',
		-- Pulseaudio applet
		'pasystray',
		-- Polkit and keyring
		'/usr/bin/lxqt-policykit-agent &'..
		' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)',
		-- Load X colors
		'xrdb $HOME/.Xresources',
		-- Audio equalizer
		'pulseeffects --gapplication-service',
		-- Start locker service
		'light-locker --lock-on-suspend --lock-on-lid',
		-- Start libinput-gestures
		'libinput-gestures-setup start',

		-- Personal startup script
		'/home/pbaudry/.src/scripts/startup.sh',
		-- Mount personal cloud services
		'/home/pbaudry/.src/scripts/sync_cloud.sh',
	},

	-- List of binaries/shell scripts that will execute for a certain task
	utils = {
		-- Screenshot tools
		screenshot = {
			full = utils_dir .. 'snap full',
			selection = utils_dir .. 'snap selection',
			full_saved = utils_dir .. 'snap full_saved',
			selection_saved = utils_dir .. 'snap selection_saved',
		},
		-- Update profile picture
		update_profile  = utils_dir .. 'profile-image'
	}
}
