local status_ok, litee = pcall(require, "litee.lib")
if not status_ok then
  return
end

local status_ok, litee_calltree = pcall(require, "litee-calltree")
if not status_ok then
  return
end

litee.setup {}
litee_calltree.setup {}
