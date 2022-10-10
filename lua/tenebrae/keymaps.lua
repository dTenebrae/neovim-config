--   Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",

-- Define options
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)                       --  
vim.g.mapleader = " "                                      -- map leader key to spacebar
vim.g.maplocalleader = " "                                 --

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--keymap("n", "<leader>e", ":Lex 30<cr>", opts)              -- open default file exploprer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)      -- open file exploprer
keymap("n", "<leader>v", "viw", opts)                      -- select word
keymap("n", "<leader>y", "\"+y", opts)                     -- yank in external buffer
keymap("n", "<leader>p", "\"+p", opts)                     -- paste from external buffer
keymap("n", "<leader>/", ":nohlsearch<cr>", opts)          -- clear search highlight
keymap("n", "<leader>\\", ":vsp<cr>", opts)                -- create vertical split
keymap("n", "<leader>-", ":sp<cr>", opts)                  -- create horizontal split
keymap("n", "<leader>n", ":set relativenumber!<cr>", opts) -- toggle relative number
keymap("n", "<leader>s", "<Plug>(leap-forward)", opts)     -- jump forward (leap plugin)
keymap("n", "<leader>S", "<Plug>(leap-backward)", opts)    -- jump backward


-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)              -- resize horizontal split up
keymap("n", "<C-Down>", ":resize -2<CR>", opts)            -- resize horizontal split down
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)   -- resize vertical split left
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)  -- resize vertical split right

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)                   -- next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts)               -- previous buffer
--keymap("n", "<leader>q", ":bd<cr>", opts)                  -- close buffer

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)                           -- exit from insert mode

-- Visual --
keymap("v", "<", "<gv", opts)                               -- stay in indent mode (do not cancel indentation mode after one press) 
keymap("v", ">", ">gv", opts)                               --

keymap("v", "<A-j>", ":m .+1<CR>==", opts)                  -- move selected text up
keymap("v", "<A-k>", ":m .-2<CR>==", opts)                  -- move selected text down
keymap("v", "p", '"_dP', opts)                              -- do not replace text in buffer when paste
keymap("v", "<leader>y", "\"+y", opts)                      -- yank in external buffer(same for normal mode)

-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)               -- move selected text up
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)               -- move selected text down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)           -- move selected text up
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)           -- move selected text down

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)        -- 
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)        -- same navigation buttons as for windows
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)        --
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)        --

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
