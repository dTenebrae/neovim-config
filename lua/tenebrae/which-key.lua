local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

--which_key.register({
        --f = {
                --name = "file", -- optional group name
                --f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
                --r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
                --n = { "New File" }, -- just a label. don't create any mapping
                --e = "Edit File", -- same as above
                --["1"] = "which_key_ignore",  -- special label to hide it in the popup
                --b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
        --},
        --},
        --{ prefix = "<leader>" }
--)

which_key.setup {

}
