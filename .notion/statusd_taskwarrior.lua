local task_base_settings = {
  update_interval = 30*1000, -- every minute
}

local task_settings = task_base_settings

local task_timer

-- Read the active task
local function read_task_data ()
  local f = assert(io.popen("/usr/bin/task statusd limit:1 | head -n 4 | tail -n 1 | sed 's/\s\+/ /g'"))
  local data = f:read("*all")
  f:close()
  return data
end

-- Write the current state to the statusbar:
local function inform_task ()

  local task = read_task_data()

  statusd.inform("taskwarrior", task)
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
