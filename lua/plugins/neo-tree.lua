return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      custom_line_number = {
        highlight = "LineNr",
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = true
          vim.opt_local.relativenumber = true
        end,
      },
    },
    window = {
      position = "left",
      width = 40,
      mappings = {
        ["<space>"] = "none",
      },
    },
  },
}
