return {
  -- Set up formatting
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save" for languages that don't have a well standardized coding style.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
      bash = { 'shfmt' },
      sh = { 'shfmt' },
      zsh = { 'shfmt' },
      nix = { 'nixfmt' },
      lua = { 'stylua' },
      toml = { 'taplo' },
      yaml = { { 'prettierd', 'prettier', stop_after_first = true } },
      json = { { 'prettierd', 'prettier', stop_after_first = true } },
      markdown = { { 'prettierd', 'prettier', stop_after_first = true } },
    },
  },
}
