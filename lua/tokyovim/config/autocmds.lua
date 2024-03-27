local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("tokyovim", { clear = true })

-- diagnostics floating text over the cursor
autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      source = "always",
      prefix = "",
      scope = "cursor",
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

autocmd("FileType", {
  group = augroup,
  pattern = {
    "mason",
    "qf",
    "help",
    "man",
    "notify",
    "neotest-output",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
