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
vim.opt.backup = false                          -- creates a backup file
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp

vim.opt.noerrorbells = true                     -- disable beeps
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.incsearch = true                        -- search as characters are entered
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.linebreak = true                        -- wrap lines on 'word' boundaries
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 8                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 8                             -- insert 2 spaces for a tab
vim.opt.scrolloff = 8                           -- don't let cursor touch edge of viewport
vim.opt.sidescrolloff = 8                       -- same for horizontal scroll
vim.opt.numberwidth = 4                         -- set number column width to X {default 4}
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
-- vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)

-- old commands
vim.cmd "set whichwrap+=<,>,[,],h,l"            -- wrap around line (move cursor at end or beginning of a next line)
vim.cmd [[set iskeyword+=-]]                    -- treat dash separated words as one word object

-- should work by default
--vim.cmd "set inccommand=nosplit"                -- interactive find and replace preview
