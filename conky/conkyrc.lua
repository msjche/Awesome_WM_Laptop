-----------------------------------------------------------------------------
--                               conkyrc_seamod
-- Date    : 04/23/2016
-- Author  : SeaJey and Maxiwell
-- Conky   : >= 1.10 
-- License : Distributed under the terms of GNU GPL version 2 or later
-----------------------------------------------------------------------------

conky.config = {

	background = true,
	update_interval = 1,

	cpu_avg_samples = 2,
	net_avg_samples = 2,
	temperature_unit = 'farenheight',

	double_buffer = true,
	no_buffers = true,
	text_buffer_size = 2048,

	gap_x = 0,
	gap_y = 90,
	minimum_width = 68, minimum_height = 900,
	maximum_width = 68,

	own_window = true,
	own_window_type = 'desktop',
	own_window_transparent = true,
	own_window_argb_visual = true,
	own_window_class = 'conky-semi',
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',

	border_width = 0,
	border_inner_margin = 0,
	border_outer_margin = 0,
	alignment = 'top_left',


	draw_shades = false,
	draw_outline = false,
	draw_borders = false,
	draw_graph_borders = false,

	override_utf8_locale = true,
	use_xft = true,
	font = 'Droid Sans:size=9',
	xftalpha = 1,
	uppercase = false,

-- Defining colors
	default_color = '#FFFFFF',
-- Shades of Gray
	color1 = '#DDDDDD',
	color2 = '#AAAAAA',
	color3 = '#888888',
-- Manjaro Green
--	color4= '#34BE5B',
-- Arch Blue
	color4 = '#1793D0',
-- Green
	color5 = '#8FEB8F',
-- Red
	color6 = '#F45F45',
-- Loading lua script for drawning rings
	lua_load = '~/.config/awesome/conky/rings.lua',
	lua_draw_hook_pre = 'main',

};

conky.text = [[
${font Droid Sans:size=8:style=bold}${color4}$kernel
${font Droid Sans:size=6:style=normal}${color1}Temp ${color3}$alignr${exec 10 sensors | grep Core\ 3 | awk '{print $3}'}
${font Droid Sans:size=7:style=normal}${color1}NVidia: ${color3}$alignr${execi 10 cat /proc/acpi/bbswitch | awk '{print $2}'}
${font Droid Sans:size=7:style=normal}${color1}Uptime: $alignr${color3}${color3}$uptime
${voffset 10}${font xirod:size=14:style=normal}${color4}BAT ${font}
${font Droid Sans:size=7:style=normal}${color1}$alignr${battery BAT0}
${font Droid Sans:size=9:bold:style=normal}${color5}$alignr${format_time $battery_time "\hh\mm"}${battery_time BAT0}
${color3}${battery_bar BAT0 10,83 F45F45 666666}

# Showing CPU Graph
${voffset -25}
${font xirod:size=14:style=bold}${color4}CPU
${voffset 60}
${cpugraph cpu1 20,83 666666 666666}
${voffset -30}
${font Droid Sans:bold:size=6:style=normal}${color4}${top name 1}
${font Droid Sans:size=6:style=normal}${color1}${top name 2}
${font Droid Sans:size=6:style=normal}${color2}${top name 3}
${font Droid Sans:size=6:style=normal}${color3}${top name 4}
${font Droid Sans:size=6:style=normal}${color3}${top name 5}

${font Droid Sans:size=7:style=normal}${color1}CPU ${font Droid Sans:size=8:bold:style=normal}${alignr}${color4}${freq} ${font Droid Sans:size=7:bold:style=normal}${color2}MHz
#Showing memory part with TOP 5
${voffset 1}
${font xirod:size=14:style=bold}${color4}MEM
${voffset 10}
${font Droid Sans:bold:size=6:style=normal}${color4}${top_mem name 1}
${font Droid Sans:size=6:style=normal}${color1}${top_mem name 2}
${font Droid Sans:size=6:style=normal}${color2}${top_mem name 3}
${font Droid Sans:size=6:style=normal}${color3}${top_mem name 4}
${font Droid Sans:size=6:style=normal}${color3}${top_mem name 4}

# Showing disk partitions: boot, root, home
${voffset -10}
${font xirod:size=14:style=bold}${color4}DISK
${voffset 60}
${diskiograph 20,83 666666 666666}${voffset -30}
${voffset 10}
${font Droid Sans:size=7:}${color1}EFI ${alignr}$color3${font Droid Sans:size=6:style=normal}${fs_free /boot/efi}
${font Droid Sans:size=7:}${color1}/ ${alignr}$color3${font Droid Sans:size=6:style=normal}${fs_free /}
${font Droid Sans:size=7:}${color1}/home ${alignr}$color3${font Droid Sans:size=6:style=normal}${fs_free /home}
${font Droid Sans:size=7:}${color1}Vault ${alignr}$color3${font Droid Sans:size=6:style=normal}${fs_free /media/Vault}
# Network 
${voffset 1}
${font xirod:size=14:style=bold}${color4}WiFi
${voffset 50}
${font Droid Sans:size=10:style=bold}${color2}VPN: $alignr${font Droid Sans:size=10:style=bold}${color5}${if_up tun0}UP${else}${color6}Down$endif$font$color
${font Droid Sans:size=9:style=bold}${color2}UFW: ${alignr}${font Droid Sans:size=9:style=bold}${color5}${execi 30 systemctl is-active ufw}
${font Droid Sans:size=5:style=bold}${color1}Lan IP: ${alignr}$color3${addr wlo1} 
#${font Droid Sans:size=5:style=bold}${color1}Ext IP: ${alignr}${color3}NOPE
${font Droid Sans:size=5:style=bold}${color1}Ext IP: ${alignr}$color3${execi 600 wget -q -O /dev/stdout http://checkip.dyndns.org/ | cut -d : -f 2- | cut -d \< -f -1} 
${font Droid Sans:size=5:style=bold}${alignr}$color3${execi 600 wget -q -O /dev/stdout https://www.dnsleaktest.com/ | grep from | grep -o '<p>.*<img' | grep -o '>.*<' | grep -oEi '[a-zA-Z0-9 ,]+'}
${voffset 1}             
${color1}${font Droid Sans:size=6:style=bold}Up: ${alignr}${font Droid Sans:size=6:style=normal}$color2${upspeed wlo1} / ${totalup wlo1}
${upspeedgraph wlo1 40,83 4B1B0C FF5C2B 1280KiB -l}
${color1}${font Droid Sans:size=6:style=bold}Down: ${alignr}${font Droid Sans:size=6:style=normal}$color2${downspeed wlo1} / ${totaldown wlo1}
${downspeedgraph wlo1 40,83 324D23 77B753 1280KiB -l}
]];
