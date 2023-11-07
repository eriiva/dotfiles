require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'ibhagwan/fzf-lua'
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'navarasu/onedark.nvim'
  use 'ntpeters/vim-better-whitespace'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'LnL7/vim-nix'
end)

require('onedark').load()

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set completeopt to have a better completion experience
--vim.o.completeopt = 'menuone,noselect'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
--  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require('lspconfig').ccls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
require'lspconfig'.pylsp.setup{
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100,
        }
      }
    }
  }
}

local cmp = require 'cmp'
cmp.setup{
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-j>'] = cmp.mapping(function (fallback)
      if vim.fn['vsnip#jumpable'](1) == 1 then
        feedkeys.call(t"<Plug>(vsnip-jump-next)", "")
      else
        fallback()
      end
    end, { 'i', 's', 'c' }),
    ['<C-h>'] = cmp.mapping(function (fallback)
      if vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkeys.call(t"<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, { 'i', 's', 'c' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
}

require('lualine').setup{
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup{
    show_end_of_line = true,
    space_char_blankline = " ",
}

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

--Enable mouse mode
vim.o.mouse = 'a'

local fzf = require 'fzf-lua'
vim.keymap.set('n', '<leader>f', fzf.files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', fzf.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>g', fzf.grep, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>n', "<cmd>nohls<CR>", { noremap = true, silent = true })
