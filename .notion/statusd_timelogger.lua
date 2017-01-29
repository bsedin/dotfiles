local timelogger_base_settings = {
  update_interval = 5*1000 -- 5 seconds
}

local timelogger_settings = timelogger_base_settings

local timelogger_timer

-- Read the active timelogger
local function read_timelogger_data ()
  local f = assert(io.popen("timelogger status"))
  local current = f:read("*all")
  f:close()
  local f = assert(io.popen("timelogger today"))
  local total = f:read("*all")
  f:close()
  return tonumber(current), tonumber(total)
end

-- Write the current state to the statusbar:
local function inform_timelogger ()

  local tl_current, tl_total = read_timelogger_data()

  statusd.inform("timelogger", tostring(math.floor(tl_current/60).." min / "..tostring(math.ceil(tl_total/3600).." hr")))

  if tl_current >= 40*60 then
    statusd.inform("timelogger_hint", "critical")
  elseif tl_current >= 25*60 then
    statusd.inform("timelogger_hint", "important")
  end
end


-- Statusbar update loop:
local function update_timelogger ()
  inform_timelogger()
  timelogger_timer:set(timelogger_settings.update_interval, update_timelogger)
end


-- Run the script:
if statusd then
  -- we're a statusbar plugin:
  timelogger_settings = table.join(statusd.get_config("timelogger"), timelogger_base_settings)
  timelogger_timer = statusd.create_timer()
  update_timelogger()
end

-- vim: set ts=4 sw=4 expandtab
