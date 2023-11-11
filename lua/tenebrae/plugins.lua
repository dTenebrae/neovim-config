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

        -- Colorschemes
        use "eddyekofo94/gruvbox-flat.nvim"
        use "sainnhe/gruvbox-material"
        use 'marko-cerovac/material.nvim'
        use 'dTenebrae/coal.nvim'
        use 'folke/tokyonight.nvim'
        use 'luisiacc/gruvbox-baby'
        use 'aktersnurra/no-clown-fiesta.nvim'
        use 'rose-pine/neovim'

        use 'nvim-lualine/lualine.nvim'                                         -- bottomline
        use "akinsho/bufferline.nvim"
        use 'moll/vim-bbye'                                                     -- Bdelete and other stuff for convinient closing buffers
        use {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }    -- indentation guides (pretty lines on the left in code)
        -- cmp plugins
        use "hrsh7th/nvim-cmp"
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
        use "williamboman/mason.nvim"                                           -- LSP installer
        use "nvim-telescope/telescope.nvim"
        use "nvim-treesitter/nvim-treesitter"
        use "p00f/nvim-ts-rainbow"                                              -- rainbow parenthesis for treesitter
        use "lewis6991/gitsigns.nvim"                                           -- working with git
        use 'kyazdani42/nvim-tree.lua'                                          -- file explorer
        use 'kyazdani42/nvim-web-devicons'                                      -- icons for file explorer and others
        use 'akinsho/toggleterm.nvim'                                           -- terminal emulator
        use ({
                'norcalli/nvim-colorizer.lua',
                config = function()
                require('colorizer').setup()
                end
        })

        use {
            'chikko80/error-lens.nvim',
            requires = {'nvim-telescope/telescope.nvim'}
        }
        use "folke/which-key.nvim"

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if PACKER_BOOTSTRAP then
                require("packer").sync()
        end
end)

