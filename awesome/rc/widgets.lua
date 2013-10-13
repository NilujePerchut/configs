-- Widgets

require("vicious")
local icons = loadrc("icons", "vbe/icons")

-- Separators
local sepopen = widget({ type = "imagebox" })
sepopen.image = image(beautiful.icons .. "/widgets/left.png")
local sepclose = widget({ type = "imagebox" })
sepclose.image = image(beautiful.icons .. "/widgets/right.png")
local spacer = widget({ type = "imagebox" })
spacer.image = image(beautiful.icons .. "/widgets/spacer.png")
aws_icon = image(beautiful.icons .. "/widgets/awesome.png")

-- Date
local datewidget = widget({ type = "textbox" })
local dateformat = "%H:%M"
if screen.count() > 1 then dateformat = "%a %d/%m, " .. dateformat end
vicious.register(datewidget, vicious.widgets.date,
		 '<span color="' .. beautiful.fg_widget_clock .. '">' ..
		    dateformat .. '</span>', 61)
local dateicon = widget({ type = "imagebox" })
dateicon.image = image(beautiful.icons .. "/widgets/clock.png")
local cal = (
   function()
      local calendar = nil
      local offset = 0

      local remove_calendar = function()
	 if calendar ~= nil then
	    naughty.destroy(calendar)
	    calendar = nil
	    offset = 0
	 end
      end

      local add_calendar = function(inc_offset)
	 local save_offset = offset
	 remove_calendar()
	 offset = save_offset + inc_offset
	 local datespec = os.date("*t")
	 datespec = datespec.year * 12 + datespec.month - 1 + offset
	 datespec = (datespec % 12 + 1) .. " " .. math.floor(datespec / 12)
	 local cal = awful.util.pread("ncal -w -m " .. datespec)
	 -- Highlight the current date and month
	 cal = cal:gsub("_.([%d ])",
			string.format('<span color="%s">%%1</span>',
				      beautiful.fg_widget_clock))
	 cal = cal:gsub("^( +[^ ]+ [0-9]+) *",
			string.format('<span color="%s">%%1</span>',
				      beautiful.fg_widget_clock))
	 -- Turn anything other than days in labels
	 cal = cal:gsub("(\n[^%d ]+)",
			string.format('<span color="%s">%%1</span>',
				      beautiful.fg_widget_label))
	 cal = cal:gsub("([%d ]+)\n?$",
			string.format('<span color="%s">%%1</span>',
				      beautiful.fg_widget_label))
	 calendar = naughty.notify(
	    {
	       text = string.format('<span font="%s">%s</span>',
				    "Terminus 8",
				    cal:gsub(" +\n","\n")),
	       timeout = 0, hover_timeout = 0.5,
	       width = 160,
	       screen = mouse.screen,
	    })
      end

      return { add = add_calendar,
	       rem = remove_calendar }
   end)()

datewidget:add_signal("mouse::enter", function() cal.add(0) end)
datewidget:add_signal("mouse::leave", cal.rem)
datewidget:buttons(awful.util.table.join(
		      awful.button({ }, 3, function() cal.add(-1) end),
		      awful.button({ }, 1, function() cal.add(1) end)))

-- CPU usage
local cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu,
		 function (widget, args)
		    return string.format('<span color="' .. beautiful.fg_widget_value .. '">%2d%%</span>',
					 args[1])
		 end, 7)
local cpuicon = widget({ type = "imagebox" })
cpuicon.image = image(beautiful.icons .. "/widgets/cpu.png")

-- Battery
local batwidget = { widget = "" }
if config.hostname == "osdepoulet" then
   batwidget.widget = widget({ type = "textbox" })
   vicious.register(batwidget.widget, vicious.widgets.bat,
		    function (widget, args)
		       local color = beautiful.fg_widget_value
		       local current = args[2]
		       if current < 10 and args[1] == "-" then
			  color = beautiful.fg_widget_value_important
			  -- Maybe we want to display a small warning?
			  if current ~= batwidget.lastwarn then
			     batwidget.lastid = naughty.notify(
				{ title = "Battery low!",
				  preset = naughty.config.presets.critical,
				  timeout = 20,
				  text = "Battery level is currently " ..
				     current .. "%.\n" .. args[3] ..
				     " left before running out of power.",
				  icon = icons.lookup({name = "battery-caution",
						       type = "status"}),
				  replaces_id = batwidget.lastid }).id
			     batwidget.lastwarn = current
			  end
		       end
		       return string.format('<span color="' .. color ..
			     '">%d%%%s(%s)</span>', current, args[1], args[3])
		    end,
		    59, "BAT0")
end
local baticon = widget({ type = "imagebox" })
baticon.image = image(beautiful.icons .. "/widgets/bat.png")

-- Memory usage
local memwidget = widget({ type = "textbox" })
vicious.register(memwidget, vicious.widgets.mem,
		 '<span color="' .. beautiful.fg_widget_value .. '">$1% ($2 MB)</span>',
		 19)
local memicon = widget({ type = "imagebox" })
memicon.image = image(beautiful.icons .. "/widgets/mem.png")

-- Volume level
local volicon = widget({ type = "imagebox" })
volicon.image = image(beautiful.icons .. "/widgets/vol.png")
local volwidget = widget({ type = "textbox" })
vicious.register(volwidget, vicious.widgets.volume,
		 '<span color="' .. beautiful.fg_widget_value .. '">$2 $1%</span>',
		17, "Master")
volume = loadrc("volume", "vbe/volume")
volwidget:buttons(awful.util.table.join(
		     awful.button({ }, 1, volume.mixer),
		     awful.button({ }, 3, volume.toggle),
		     awful.button({ }, 4, volume.increase),
		     awful.button({ }, 5, volume.decrease)))

local systray = widget({ type = "systray" })

-- Wibox initialisation
local wibox     = {}
local promptbox = {}
local layoutbox = {}

local taglist = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
local tasklist = {}
tasklist.buttons = awful.util.table.join(
   awful.button({ }, 1, function (c)
		   if c == client.focus then
		      c.minimized = true
		   else
		      if not c:isvisible() then
			 awful.tag.viewonly(c:tags()[1])
		      end
		      -- This will also un-minimize
		      -- the client, if needed
		      client.focus = c
		      c:raise()
		   end
			end))

-- Menu : Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", config.terminal .. " -e man awesome" },
   { "edit config", config.editor .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}
mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, aws_icon },
                                    { "open terminal", config.terminal },
									{ "shutdown", "/usr/lib/indicator-session/gtk-logout-helper --shutdown"},
                                  }
                        })
mylauncher = awful.widget.launcher({ image = aws_icon,
									 menu = mymainmenu })

for s = 1, screen.count() do
    promptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    layoutbox[s] = awful.widget.layoutbox(s)
    tasklist[s]  = awful.widget.tasklist(
       function(c)
	  local title, color, _, icon = awful.widget.tasklist.label.currenttags(c, s)
	  return title, color, nil, icon
       end, tasklist.buttons)

    -- Create the taglist
    taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
    -- Create the wibox
    wibox[s] = awful.wibox({ screen = s,
			     fg = beautiful.fg_normal,
			     bg = beautiful.bg_widget,
			     position = "top",
			     height = 16,
    })
    -- Add widgets to the wibox
    local on = function(n, what)
       if s == n or n > screen.count() then return what end
       return ""
    end
    local on_max = function(what)
       if s == screen.count() then return what end
       return ""
    end


    wibox[s].widgets = {
        {
		   sepopen,
		   mylauncher,
		   sepclose,
		   taglist[s],
		   sepopen,
		   layoutbox[s],
		   sepclose,
		   promptbox[s],
		   layout = awful.widget.layout.horizontal.leftright
		},
		-- Display widgets other than date only on higher screen number
		sepclose,
		datewidget, dateicon , on(1,sepopen), on(2,spacer),
		on_max(systray), on_max(spacer),
		on_max(volwidget), on_max(volicon), on_max(spacer),

		on_max(batwidget.widget),
		on_max(batwidget.widget ~= "" and on_max(baticon) or ""),
		on_max(batwidget.widget ~= "" and on_max(spacer) or ""),

		on_max(memwidget), on_max(memicon), on_max(spacer),
		on_max(cpuwidget), on_max(cpuicon), on_max(sepopen),
		tasklist[s],
		layout = awful.widget.layout.horizontal.rightleft, 
	}
end

config.keys.global = awful.util.table.join(
   config.keys.global,
   awful.key({ modkey }, "r", function () promptbox[mouse.screen]:run() end,
	     "Prompt for a command"))

config.taglist = taglist
