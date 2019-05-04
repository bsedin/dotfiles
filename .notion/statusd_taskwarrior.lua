local task_base_settings = {
  update_interval = 15*1000, -- every 15 seconds
}

local task_settings = task_base_settings

local task_timer

-- Read the active task
local function read_task_data ()
  local f = assert(io.popen("~/.notion/statusd_task"))
  local data = f:read("*all")
  f:close()
  return data
end

-- Write the current state to the statusbar:
local function inform_task ()

  local task = read_task_data()

  statusd.inform("taskwarrior", task)
  statusd.inform("taskwarrior_hint", "critical")
end


-- Statusbar update loop:
local function update_task ()
  inform_task()
  task_timer:set(task_settings.update_interval, update_task)
end


-- Run the script:
if statusd then
  -- we're a statusbar plugin:
  task_settings = table.join(statusd.get_config("task"), task_base_settings)
  task_timer = statusd.create_timer()
  update_task()
end

-- vim: set ts=4 sw=4 expandtab
