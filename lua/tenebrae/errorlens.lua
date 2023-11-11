local status_ok, error_lens = pcall(require, "error-lens")
if not status_ok then
  return
end

error_lens.setup(client, {

})

