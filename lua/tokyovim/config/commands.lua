local api = require "tokyovim.core.utils.api"
local session = require "tokyovim.core.utils.session"
local buffer = require "tokyovim.core.utils.buffer"
local config = require "tokyovim.config"

local command = vim.api.nvim_create_user_command

command("TokyoVimUpdate", function()
  require("tokyovim.core.updater").update()
end, { nargs = "*", desc = "TokyoVim update" })

command("TokyoVimSaveSession", function()
  session.save_session()
end, { nargs = "*", desc = "Save session" })

command("TokyoVimLoadSession", function()
  session.load_session()
end, { nargs = "*", desc = "Load session" })

command("TokyoVimCloseBuffer", function()
  buffer.delete_current()
end, { nargs = "*", desc = "Close buffer" })

command("TokyoVimCloseEmptyBuffers", function()
  buffer.delete_all_empty_buffers()
end, { nargs = "*", desc = "Close empty buffers" })

command("TokyoVimFormat", function()
  buffer.format()
end, { nargs = "*", desc = "Code format" })

command("TokyoVimSaveAllBuffers", function()
  buffer.save_all()
end, { nargs = "*", desc = "Save all modified buffers" })
