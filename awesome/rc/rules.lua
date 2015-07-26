local icons = loadrc("icons", "vbe/icons")

awful.rules.rules = {
   -- All clients will match this rule.
   { rule = { },
     properties = { border_width = beautiful.border_width,
		    border_color = beautiful.border_normal,
		    focus = true,
		    maximized_vertical   = false,
		    maximized_horizontal = false,
                    keys = config.keys.client,
		    buttons = config.mouse.client }},
   -- Browser stuff
   { rule = { role = "browser" },
     callback = function(c)
	if not c.icon then
	   local icon = icons.lookup({ name = "web-browser",
				       type = "apps" })
	   if icon then
	      c.icon = image(icon)
	   end
	end
     end },
   { rule_any = { class = { "Iceweasel", "Firefox", "Chromium", "Conkeror", "Google-chrome" } },
	 properties = { tag= tags[1][4] } ,
     callback = function(c)
	-- All windows should be slaves, except the browser windows.
	if c.role ~= "browser" then awful.client.setslave(c) end
     end },
   { rule = { instance = "plugin-container" },
     properties = { floating = true }}, -- Flash with Firefox
   { rule = { instance = "exe", class = "Exe" },
     properties = { floating = true }}, -- Flash with Chromium
   -- Audacious
   { rule = { class = "Audacious" },
     properties = { tag= tags[1][9] }},
   -- Gtkwave
   { rule = { class = "Gtkwave" },
     properties = { tag= tags[1][7] }},
   -- Floating windows
   { rule_any = { class = { "Display.im6", "Key-mon" } },
     properties = { floating = true }},
}
