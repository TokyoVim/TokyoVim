--- Module containing functions related to Git operations.
-- @module git_utils

local M = {}

local config = require "tokyovim.config"

--- Executes a Git command with the given arguments.
-- @param arg The Git command and its arguments as a string.
-- @param dir (optional) The directory where the command should be executed.
-- @return The output of the Git command as a string.
function M.cmd(arg, dir)
  dir = dir or vim.fn.stdpath "config"
  return vim.fn.system("git -C " .. dir .. " " .. arg)
end

--- Checks if Git is available in the system.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if Git is available.
function M.is_available()
  return vim.fn.executable(config.opts.bin.git) == 1
end

--- Checks if a specific branch exists in the remote repository.
-- @param branch (string) The name of the branch to check.
-- @param dir (string) Optional. The directory of the repository. Defaults to the current directory.
-- @return (boolean) Returns true if the branch exists in the remote repository, false otherwise.
function M.branch_exists_in_remote(branch, dir)
  local result = M.cmd("ls-remote --heads --quiet origin " .. branch, dir)
  return string.find(result, branch) ~= nil
end

--- Compares the hash of the last local commit with the remote one.
--- is different from the hash of the last local commit
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if updates are available.
function M.has_updates(branch, dir)
  branch = branch or M.get_current_branch(dir)

  if not M.branch_exists_in_remote(branch) then
    return false
  end

  local local_hash = M.cmd("rev-parse " .. branch, dir):gsub("\n", "")
  local remote_hash = M.cmd("ls-remote --refs --heads --quiet origin " .. branch, dir):match "%S+"

  return local_hash ~= remote_hash
end

--- Checks if there are uncommitted changes.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if there are uncommitted changes.
function M.has_uncommitted_changes(dir)
  local status = M.cmd("status --porcelain", dir):gsub("\n", "")
  return status ~= ""
end

--- Get Git version.
-- @return The version of Git, or nil if Git is not available.
function M.version()
  if M.is_available() then
    return vim.version.parse(M.cmd "--version")
  end
  return nil
end

--- Checks if the Git repository has a remote with the specified URL.
-- @param remote The remote URL to check.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if the remote URL exists in the Git repository.
function M.is_remote(remote, dir)
  local remote_url = M.cmd("config --get remote.origin.url", dir):gsub("\n", "")
  return string.find(remote_url, remote, 1, true) ~= nil
end

--- Checks if the current directory is a Git repository.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if the current directory is a Git repository.
function M.is_repo(dir)
  dir = dir or vim.fn.stdpath "config"
  local git_dir = dir .. "/.git"
  return vim.fn.isdirectory(git_dir) == 1
end

--- Retrieves the name of the current Git branch.
-- @param dir (optional) The directory where the command should be executed.
-- @return The name of the current branch as a string.
function M.get_current_branch(dir)
  return M.cmd("rev-parse --abbrev-ref HEAD", dir):gsub("\n", "")
end

--- Get the URL of the remote repository.
-- @param dir (optional) The directory where the command should be executed.
-- @return The URL of the remote repository as a string.
function M.get_remote_url(dir)
  return M.cmd("config --get remote.origin.url", dir):gsub("\n", "")
end

--- Get the username/repository from the URL.
-- @param dir (optional) The directory where the command should be executed.
-- @return The username/repository from the URL of the remote repository as a string.
function M.get_repository(dir)
  local remote_url = M.get_remote_url(dir)
  local repo = remote_url:match "^.+:(.+/.+)%.git$"
  return repo
end

function M.switch(branch, discard_changes, dir)
  M.cmd("switch " .. branch .. (discard_changes and " --discard-changes" or ""), dir)
  return vim.v.shell_error == 0 and true or false
end

--- Checkout to branch.
-- @param branch The branch to checkout.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating success or failure of the operation.
function M.checkout(branch, dir)
  if M.get_current_branch(dir) == branch then
    return true
  end

  M.cmd("checkout -q " .. branch, dir)
  return M.get_current_branch(dir) == branch
end

--- Fetches the latest changes from the remote repository.
-- Performs a fetch and pull to retrieve the latest changes from the remote repository.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if the fetch and pull were successful.
function M.fetch(dir)
  local fetch_commands = {
    "fetch -q",
    "pull -q",
  }

  for _, cmd in ipairs(fetch_commands) do
    M.cmd(cmd, dir)
    if vim.v.shell_error ~= 0 then
      return false
    end
  end

  return true
end

--- Cleans the local repository.
-- Performs a series of cleanup operations on the local repository,
-- including status check, clean, and hard reset.
-- @param dir (optional) The directory where the command should be executed.
-- @return A boolean indicating if the cleanup was successful.
function M.clean(dir)
  local clean_commands = {
    "status -s -b",
    "clean -q -f -d",
    "reset -q --hard HEAD",
  }

  for _, cmd in ipairs(clean_commands) do
    M.cmd(cmd, dir)
    if vim.v.shell_error ~= 0 then
      return false
    end
  end

  return true
end

return M
