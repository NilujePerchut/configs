-- Setup display
local xrandr = {
   osdemammouth = "--output DFP6 --auto --output DFP7 --auto --right-of DFP6",
   osdepoulet    = "--output LVDS1 --auto --output VGA1 --auto --right-of LVDS1",
}
if xrandr[config.hostname] then
   os.execute("xrandr " .. xrandr[config.hostname])
end

-- Spawn a composoting manager
awful.util.spawn("compton", false)
awful.util.spawn("xcompmgr", false) -- Will fail if compton has been started

-- Start idempotent commands
local execute = {
   -- Start PulseAudio
   "pulseaudio --check || pulseaudio -D",
   "xset -b",	-- Disable bell
   -- Enable numlock
   "numlockx on",
   -- Read resources
   "xrdb -merge " .. awful.util.getdir("config") .. "/Xresources",
   -- Default browser
   "xdg-mime default " .. config.browser .. ".desktop x-scheme-handler/http",
   "xdg-mime default " .. config.browser .. ".desktop x-scheme-handler/https",
   "xdg-mime default " .. config.browser .. ".desktop text/html",
   -- Default reader for PDF. See: https://wiki.archlinux.org/index.php/Default_Applications
   "xdg-mime default evince.desktop application/pdf"
}

-- Keyboard/Mouse configuration
if config.hostname == "osdemammouth" then
   execute = awful.util.table.join(
      execute, {
	 -- Keyboard and mouse
	 "xset m 4 3",	-- Mouse acceleration
	 "setxkbmap fr '' compose:rwin ctrl:nocaps grp:rctrl_rshift_toggle",
	 "xmodmap -e 'keysym Pause = XF86ScreenSaver'",
	   })
elseif config.hostname == "osdepoulet" then
   execute = awful.util.table.join(
      execute, {
	 -- Keyboard and mouse
	 "xset m 4 3",	-- Mouse acceleration
	 "setxkbmap fr '' compose:rwin ctrl:nocaps grp:rctrl_rshift_toggle",
	 "xmodmap -e 'keysym Pause = XF86ScreenSaver'",
	   })
end

os.execute(table.concat(execute, ";"))

-- Spawn various X programs
xrun("polkit-gnome-authentication-agent-1", "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")
xrun("NetworkManager Applet", "nm-applet")

-- Conditional programs launching
if config.hostname == "osdemammouth" then
	-- nothing for the moment
elseif config.hostname == "osdepoulet" then
	-- nothing for the moment
end
