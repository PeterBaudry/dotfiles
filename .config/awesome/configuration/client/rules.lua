local awful = require('awful')
local gears = require('gears')
local ruled = require('ruled')
local beautiful = require('beautiful')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal(
	'request::rules',
	function()
		-- All clients will match this rule.
		ruled.client.append_rule {
			id = 'global',
			rule = {},
			properties = {
				focus = awful.client.focus.filter,
				raise = true,
				floating = false,
				maximized = false,
				above = false,
				below = false,
				ontop = false,
				sticky = false,
				maximized_horizontal = false,
				maximized_vertical = false,
				keys = client_keys,
				buttons = client_buttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen
			}
		}

		ruled.client.append_rule {
			id = 'round_clients',
			rule_any = {
				type = {
					'normal',
					'dialog'
				}
			},
			except_any  = {
				name = {'Discord Updater'}
			},
			properties = {
				round_corners = true,
				shape = beautiful.client_shape_rounded
			}
		}

		-- Titlebar rules
		ruled.client.append_rule {
			id 		= 'titlebars',
			rule_any = {
				type = {
					'dialog',
					'modal',
					'utility'
				}
			},
			properties = {
				titlebars_enabled = true
			}
		}

		-- Dialogs
		ruled.client.append_rule {
			id = 'dialog',
			rule_any = {
				type  = {'dialog'},
				class = {'Wicd-client.py', 'calendar.google.com'}
			},
			properties = {
				titlebars_enabled = true,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Modals
		ruled.client.append_rule {
			id = 'modal',
			rule_any = {
				type = {'modal'}
			},
			properties = {
				titlebars_enabled = true,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Utilities
		ruled.client.append_rule {
			id = 'utility',
			rule_any = {
				type = {'utility'}
			},
			properties = {
				titlebars_enabled = false,
				floating = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Splash
		ruled.client.append_rule {
			id = 'splash',
			rule_any = {
				type = {'splash'},
				name = {'Discord Updater'}
			},
			properties = {
				titlebars_enabled = false,
				round_corners = false,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Browsers and chats
		ruled.client.append_rule {
			id = 'internet',
			rule_any = {
				class = {
					'firefox',
					'Tor Browser',
					'Chromium',
					'Google-chrome',
				}
			},
			properties = {
				tag = '1',
				switch_to_tags = true
			}
		}

		-- Development
		ruled.client.append_rule {
			id = 'code',
			rule_any = {
				class = {
					'URxvt',
					'XTerm',
					'UXTerm',
					'kitty',
					'K3rmit',
					'Code'
				}
			},
			properties = {
				tag = '2',
				switch_to_tags = true,
				size_hints_honor = false,
			}
		}

		-- Social apps
		ruled.client.append_rule {
			id = 'social',
			rule_any = {
				class = {
					'ferdi',
					'slack',
					'discord'
				}
			},
			properties = {
				tag = '3'
			}
		}

		-- File managers
		ruled.client.append_rule {
			id = 'files',
			rule_any = {
				class = {
					'dolphin',
					'ark',
					'Nemo',
					'File-roller'
				}
			},
			properties = {
				tag = '4',
				switch_to_tags = true
			}
		}

		-- Games
		ruled.client.append_rule {
			id = 'games',
			rule_any = {
				class = {
					'Shadow',
					'Shadow Beta'
				}
			},
			properties = {
				tag = '5',
				switch_to_tags = true,
			}
		}

		-- Floating
		ruled.client.append_rule {
			id       = 'floating',
			rule_any = {
				instance    = {
					'file_progress',
					'Popup'
				},
				class = {
					'scrcpy',
					'Mugshot',
					'Pulseeffects',
					'Blueman-adapters'
				},
				role    = {
					'AlarmWindow',
					'ConfigManager',
					'pop-up'
				}
			},
			properties = {
				titlebars_enabled = true,
				skip_decoration = true,
				ontop = true,
				floating = true,
				focus = awful.client.focus.filter,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				placement = awful.placement.centered
			}
		}
	end
)