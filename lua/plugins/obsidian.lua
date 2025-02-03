return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/wiki",
      },
      {
	name = "work",
	path = "~/Documents/SailVault",
      },
    },
    disable_frontmatter = true,
    checkboxes = {
      [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      ["x"] = { char = "✔", hl_group = "ObsidianDone" },
    },
  mappings = {
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },
  ---@param title string|?
---@return string
note_id_func = function(title)
  if title ~= nil and title ~= "" then
    -- If a title is given, return it as is (without modifications)
    return title
  else
    -- If no title is given, generate a Zettelkasten-style timestamp (YYYYMMDDHHMMSS)
    return "Zettelkasten/" .. os.date("%Y%m%d%H%M%S")
    end
end,

  },
}
