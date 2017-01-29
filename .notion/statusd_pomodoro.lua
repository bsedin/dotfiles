local pomodoro_base_settings = {
  update_interval = 5*1000 -- 5 seconds
}

local pomodoro_settings = pomodoro_base_settings

local pomodoro_timer

-- Read the active pomodoro
local function read_pomodoro_data ()
  local f = assert(io.popen("pomodoro status"))
  local data = f:read("*all")
  f:close()
  return data
end

-- Write the current state to the statusbar:
local function inform_pomodoro ()

  local pomodoro = read_pomodoro_data()

  statusd.inform("pomodoro", pomodoro)
end


-- Statusbar update loop:
local function update_pomodoro ()
  inform_pomodoro()
  pomodoro_timer:set(pomodoro_settings.update_interval, update_pomodoro)
end


-- Run the script:
if statusd then
  -- we're a statusbar plugin:
  pomodoro_settings = table.join(statusd.get_config("pomodoro"), pomodoro_base_settings)
  pomodoro_timer = statusd.create_timer()
  update_pomodoro()
end

-- vim: set ts=4 sw=4 expandtab
