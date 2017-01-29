-- A battery statusbar meter for the ion3 window manager for Apple Powerbooks
-- running Linux. These machines do not use APM or ACPI but have a PMU, Power
-- Management Unit.
--
-- Install the meter in ~/.ion3/statusd_battery.lua
--
-- Edit your ~/.ion3/cfg_statusbar.lua to add this meter:
--   template="%date - %battery %filler%systray",
--
-- When the battery is charged and you're on AC power, you don't see anything.
-- When the system is on AC power and charging the battery, you'll see a tilde
-- sign, ~, followed by the percentage that the battery is charged.  When the
-- system is running on battery power, you'll an equal, =, sign, followed by
-- the remaining capacity in percentages.
--
-- See /usr/src/linux/include/battery.h and
-- /usr/src/linux/drivers/macintosh/via-battery.c for some documentation on the
-- exported data.
--
-- Author: Jeroen Pulles
-- Rotterdam, 15 november 2007


local battery_base_settings = {
  update_interval = 15*1000, -- every 15 sec
  important_threshold = 33 , -- 33% cap. remaining
  critical_threshold = 15, -- 15% capacity remaining
}

local battery_settings = battery_base_settings

local battery_timer


-- Read the battery battery info
local function read_battery_data ()
  -- assume only one of possible two batteries is present:
  local f = assert(io.open("/sys/class/power_supply/BAT0/uevent", "r"))
  local data = f:read("*all")
  f:close()
  local _, _, capacity = string.find(data, "POWER_SUPPLY_CAPACITY=(%d+)")
  local _, _, status = string.find(data, "POWER_SUPPLY_STATUS=(%w+)")
  return status, tonumber(capacity)
end

-- Write the current state to the statusbar:
local function inform_battery ()

  local status, cap = read_battery_data()

  if status == 'Discharging' then
    -- On battery power, percentage remaining:
    statusd.inform("battery", string.format("BAT %d%%", cap))
  else
    -- Charging the battery on AC power, percentage charged:
    statusd.inform("battery", string.format("AC %d%%", cap))
  end

  if cap <= battery_settings.critical_threshold then
    statusd.inform("battery_hint", "critical")
  elseif cap <= battery_settings.important_threshold then
    statusd.inform("battery_hint", "important")
  end
end


-- Statusbar update loop:
local function update_battery ()
  inform_battery()
  battery_timer:set(battery_settings.update_interval, update_battery)
end


-- Run the script:
if statusd then
  -- we're a statusbar plugin:
  battery_settings = table.join(statusd.get_config("battery"), battery_base_settings)
  battery_timer = statusd.create_timer()
  update_battery()
end

-- vim: set ts=4 sw=4 expandtab
