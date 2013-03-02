function batteryInfo(adapter)
  local fcur = io.open("/sys/class/power_supply/"..adapter.."/charge_now")
  local fcap = io.open("/sys/class/power_supply/"..adapter.."/charge_full")
  local fsta = io.open("/sys/class/power_supply/"..adapter.."/status")
  local cur = fcur:read()
  local cap = fcap:read()
  local sta = fsta:read()
  local battery = math.floor(cur * 100 / cap)
  if battery < 10 then
    color = "orange"
    if battery < 5 then
      color = "red"
    end
    battery = "<span color='"..color.."'>"..battery.."</span>"
  end
  if sta:match("Charging") then
    -- battery = "A/C: "..battery.."%"
    battery = "A/C: "..battery.."%"
  elseif sta:match("Discharging") then
    -- battery = ": "..battery.."%"
    battery = adapter..": "..battery.."%"
  else
    -- Wrongly assume powercable is plugged because the battery is fully
    -- charged but the function is called batteryInfo, right? :)
    battery = "A/C: Full"
  end
  batterywidget.text = battery.." "
  fcur:close()
  fcap:close()
  fsta:close()
end

-- Create a battery widget
batterywidget = widget({type = "textbox",
                        name = "batterywidget",
                        align = "right" })

-- Update the widget as soon as this file is loaded in awesome
batteryInfo("BAT0")

-- Hook, updated every 20 seconds
awful.hooks.timer.register(20, function() batteryInfo("BAT0") end)
