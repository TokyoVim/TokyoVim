return {
  "nvim-lualine/lualine.nvim",
  event = "BufEnter",
  opts = function()
    local file_icon = require("lualine.components.filename"):extend()
    file_icon.apply_icon = require("lualine.components.filetype").apply_icon
    local api = require "tokyovim.core.utils.api"

    return {
      options = {
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          "alpha",
          "dash",
        },
        ignore_focus = {
          "NvimTree",
        },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icon = "",
            section_separators = { left = "" },
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
          },
        },
        lualine_c = {
          {
            file_icon,
            file_status = false,
            symbols = {
              unnamed = "No Name",
              newfile = "New",
            },
          },
          {
            "diff",
          },
        },

        lualine_x = { { "diagnostics", update_in_insert = true } },
        lualine_y = { { api.get_lsp_clients } },
        lualine_z = { { "progress", icon = "" } },
      },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
