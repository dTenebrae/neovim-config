local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
        return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
        return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ  icons for suggestions
local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
}
-- find more symbols here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
        snippet = {
                expand = function(args)
                        luasnip.lsp_expand(args.body)                                -- For `luasnip` users. (we are)
                end,
        },
        mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),                                  -- up on suggestions list
        ["<C-j>"] = cmp.mapping.select_next_item(),                                  -- down on suggestions list
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),          -- docs scrolling backward
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),           -- docs scrolling forward
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),           -- start suggestions with ctrl + space
        ["<C-y>"] = cmp.config.disable,                                              -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {                                                    -- cancel suggestions
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
        },

        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },                            -- Enter for confirm selection

        ["<Tab>"] = cmp.mapping(function(fallback)                                   --
                if cmp.visible() then                                                --
                        cmp.select_next_item()                                       --
                elseif luasnip.expandable() then                                     --
                        luasnip.expand()                                             --
                elseif luasnip.expand_or_jumpable() then                             --
                        luasnip.expand_or_jump()                                     --
                elseif check_backspace() then                                        --
                        fallback()                                                   --
                else                                                                 --  Changing behavior of TAB in suggestions.
                        fallback()                                                   --  It jumps over certain points in snippet
                end                                                                  --
        end, {"i", "s", }),                                                          --
        ["<S-Tab>"] = cmp.mapping(function(fallback)                                 --
                if cmp.visible() then                                                --
                        cmp.select_prev_item()                                       --
                elseif luasnip.jumpable(-1) then                                     --
                        luasnip.jump(-1)                                             --
                else                                                                 --
                        fallback()                                                   --
                end                                                                  --
        end, {"i", "s", }),                                                          --
        },                                                                           --
        formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format(                                       -- This concatenates the icons with the name of the item kind
                        '%s %s', 
                        kind_icons[vim_item.kind], 
                        vim_item.kind
                ) 
                vim_item.menu = ({
                        luasnip = "[Snippet]",                                       -- 
                        buffer = "[Buffer]",                                         -- item menu names
                        path = "[Path]",                                             --
                })[entry.source.name]
                return vim_item
        end,
        },
        sources = {
                { name = "luasnip" },                                                --
                { name = "buffer" },                                                 -- Order of suggestions (snippet first, buffer second, etc)
                { name = "path" },                                                   --
                { name = "crates" },
        },
        confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
        },
        window = {
                documentation = cmp.config.window.bordered(),                        -- border for docs
       },
        experimental = {
                ghost_text = true,                                                   -- zsh autosuggestions-like feature
                native_menu = false,
        },
}

