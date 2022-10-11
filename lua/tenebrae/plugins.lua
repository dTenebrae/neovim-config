-- =======================================
--        tenebrae's nvim config
--            _
--     __   _(_)_ __ ___  _ __ ___
--     \ \ / / | '_ ` _ \| '__/ __|
--  _   \ V /| | | | | | | | | (__
-- (_)   \_/ |_|_| |_| |_|_|  \___|
--
-- =======================================
local fn = vim.fn

-- Automatically install packer
-- data dir - ~/.local/share/nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
        PACKER_BOOTSTRAP = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
        }
        print "Installing packer close and reopen Neovim..."
        vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
        return
end

-- Have packer use a popup window
packer.init {
        display = {
        open_fn = function()
                return require("packer.util").float { border = "rounded" }
        end,
        },
}

-- Install your plugins here
return packer.startup(function(use)
        use "wbthomason/packer.nvim"                                            -- Have packer manage itself
        use "nvim-lua/popup.nvim"                                               -- An implementation of the Popup API from vim in Neovim
        use "nvim-lua/plenary.nvim"                                             -- Useful lua functions used ny lots of plugins
        use "scrooloose/nerdcommenter"                                          -- Commenting things
        use {
                'phaazon/hop.nvim',                                             -- easy jump analogy
                branch = 'v2' -- optional but strongly recommended
        }
        use 'eddyekofo94/gruvbox-flat.nvim'                                     -- colorscheme
        use 'nvim-lualine/lualine.nvim'                                         -- bottomline
        use 'akinsho/bufferline.nvim'                                           -- bufferline (thing on top) itself
        use 'moll/vim-bbye'                                                     -- Bdelete and other stuff for convinient closing buffers
        use "lukas-reineke/indent-blankline.nvim"                               -- indentation guides (pretty lines on the left in code)
        -- cmp plugins
        use {
                "hrsh7th/nvim-cmp",                                             -- completion plugin
                commit = "99ef854322d0de9269044ee197b6c9ca14911d96"             -- commit after this one was broken
        }
        use "hrsh7th/cmp-buffer"                                                -- buffer completions
        use "hrsh7th/cmp-path"                                                  -- path completions
        use "hrsh7th/cmp-cmdline"                                               -- cmdline completions
        use "hrsh7th/cmp-nvim-lua"                                              -- lua completions
        use "hrsh7th/cmp-nvim-lsp"                                              -- LSP completions
        use "saadparwaiz1/cmp_luasnip"                                          -- snippet completions
        use "L3MON4D3/LuaSnip"                                                  -- snippet engine
        use "rafamadriz/friendly-snippets"                                      -- a bunch of snippets to use
        -- LSP
        use "neovim/nvim-lspconfig"                                             -- enable LSP
        use "williamboman/nvim-lsp-installer"                                   -- simple to use language server installer
        use "nvim-telescope/telescope.nvim"                                     -- telescope (fzf)
        use {
                "nvim-treesitter/nvim-treesitter",                              -- treesitter
                run = ":TSUpdate",                                              -- TODO not working on fresh install
        }
        use "p00f/nvim-ts-rainbow"                                              -- rainbow parenthesis for treesitter
        use {
                "windwp/nvim-autopairs",                                        -- parenthesis(and not only) autopairs
                config = function() require("nvim-autopairs").setup {} end      -- 
        }
        use "lewis6991/gitsigns.nvim"                                           -- working with git
        use 'kyazdani42/nvim-tree.lua'                                          -- file explorer
        use 'kyazdani42/nvim-web-devicons'                                      -- icons for file explorer and others
        use 'akinsho/toggleterm.nvim'                                           -- terminal emulator
        use 'lewis6991/impatient.nvim'                                          -- speedup starting time

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
                require("packer").sync()
        end
end)

