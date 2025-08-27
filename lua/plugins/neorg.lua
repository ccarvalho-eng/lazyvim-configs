return {
  {
    "nvim-neorg/neorg",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local neorg_path = vim.env.NEORG_PATH

      local function ws(path_fallback)
        return neorg_path and (neorg_path .. path_fallback) or ("~/neorg" .. path_fallback)
      end

      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                personal = ws("/personal"),
                work = ws("/work"),
                notes = ws("/notes"),
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}
