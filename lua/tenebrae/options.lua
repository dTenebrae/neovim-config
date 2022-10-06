-- =======================================
--  05.10.22 tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
-- :help options

local options = {
        backup = false,                          -- creates a backup file
        writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        swapfile = false,                        -- creates a swapfile
        fileencoding = "utf-8",                  -- the encoding written to a file
        completeopt = { "menuone", "noselect" }, -- mostly just for cmp
        conceallevel = 0,                        -- so that `` is visible in markdown files
        clipboard = "unnamed",                   -- allows neovim to access the system clipboard
        undofile = true,                         -- enable persistent undo
        incsearch = true,                        -- search as characters are entered
        hlsearch = true,                         -- highlight all matches on previous search pattern
        ignorecase = true,                       -- ignore case in search patterns
        mouse = "a",                             -- allow the mouse to be used in neovim
        showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
        pumheight = 10,                          -- pop up menu height
        showtabline = 2,                         -- always show tabs
        cmdheight = 2,                           -- more space in the neovim command line for displaying messages
        smartcase = true,                        -- smart case
        smartindent = true,                      -- make indenting smarter again
        splitbelow = true,                       -- force all horizontal splits to go below current window
        splitright = true,                       -- force all vertical splits to go to the right of current window
        linebreak = true,                        -- wrap lines on 'word' boundaries
        timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
        updatetime = 300,                        -- faster completion (4000ms default)
        expandtab = true,                        -- convert tabs to spaces
        shiftwidth = 8,                          -- the number of spaces inserted for each indentation
        tabstop = 8,                             -- insert 2 spaces for a tab
        scrolloff = 8,                           -- don't let cursor touch edge of viewport
        sidescrolloff = 8,                       -- same for horizontal scroll
        numberwidth = 4,                         -- set number column width to X {default 4}
        cursorline = true,                       -- highlight the current line
        number = true,                           -- set numbered lines
        relativenumber = false,                  -- set relative numbered lines
        signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
        wrap = false,                            -- display lines as one long line
        guifont = "monospace:h17",               -- the font used in graphical neovim applications
        termguicolors = true,                    -- set term gui colors (most terminals support this)
}

for k, v in pairs(options) do
        vim.opt[k] = v
end

-- old commands
vim.cmd "set whichwrap+=<,>,[,],h,l"            -- wrap around line (move cursor at end or beginning of a next line)
vim.cmd [[set iskeyword+=-]]                    -- treat dash separated words as one word object

vim.g.gruvbox_flat_style = "hard"               -- darker mode for gruvbox-flat colorscheme
