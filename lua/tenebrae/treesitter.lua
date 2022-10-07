local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
        return
end

configs.setup {
        ensure_installed = { "c", "python", "lua", "rust" },            -- A list of parser names, or "all"
        sync_install = false,                                           -- Install parsers synchronously (only applied to `ensure_installed`)
        auto_install = true,                                            -- Automatically install missing parsers when entering buffer
        ignore_install = { "" },                                        -- List of parsers to ignore installing
        highlight = {
                enable = true,                                          -- false will disable the whole extension
                disable = { "" },                                       -- list of language that will be disabled
                additional_vim_regex_highlighting = {
                        enable = true,
                        disable ={ "c", "python", "lua", "rust" },
                },
        },
        indent = {
                enable = true,
                disable = { "yaml" }
        },
        rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
        },
        autopairs = {
                enable = true,
        },

        -- disable slow treesitter highlight for large files
        --disable = function(lang, buf)
                --local max_filesize = 100 * 1024 -- 100 KB
                --local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                --if ok and stats and stats.size > max_filesize then
                        --return true
                --end
        --end,
}
