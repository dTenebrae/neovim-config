-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
        return
end

nvim_tree.setup {
        update_focused_file = {
                enable = true,
                update_cwd = true,
        },
        actions = {
                open_file = {
                        quit_on_open = true,
                        },
        },
        renderer = {
                root_folder_modifier = ":t",
                icons = {
                        glyphs = {
                                default = "",
                                symlink = "",
                                folder = {
                                        arrow_open = "",
                                        arrow_closed = "",
                                        default = "",
                                        open = "",
                                        empty = "",
                                        empty_open = "",
                                        symlink = "",
                                        symlink_open = "",
                        },
                                git = {
                                        unstaged = "",
                                        staged = "S",
                                        unmerged = "",
                                        renamed = "➜",
                                        untracked = "U",
                                        deleted = "",
                                        ignored = "◌",
                                },
                        },
                },
        },
        diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                },
        },
        view = {
                width = 30,
                side = "left",
        },
}
