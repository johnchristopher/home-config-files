volume_widget = widget({ type = "textbox", name = "tb_volume", align = "right" })
function update_volume(widget)
  local fd = io.popen("amixer sget Master")
  local status = fd:read("*all")
  fd:close()
        
  local volume = tonumber(string.match(status, "(%d?%d?%d)%%"))

  -- volume = string.format("% 3d", volume)
  status = string.match(status, "%[(o[^%]]*)%]")

  if string.find(status, "on", 1, true) then
    volume = volume.."%"
   else
    volume = "muted"
   end
  widget.text = "volume: "..volume.."  "
  end

update_volume(volume_widget)
awful.hooks.timer.register(1, function () update_volume(volume_widget) end)
