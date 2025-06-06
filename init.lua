-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Exports Mermaid diagrams on save

local function ensure_mermaid_theme(file_path)
  local lines = vim.fn.readfile(file_path)
  local theme_header =
    '%%{init: { "theme": "dark", "themeVariables": { "background": "transparent", "primaryColor": "#bb86fc" }}}%%'

  if not vim.startswith(lines[1], "%%{init:") then
    table.insert(lines, 1, theme_header)
    vim.fn.writefile(lines, file_path)
  end
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.mmd",
  callback = function()
    local input_file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:p:r") .. ".png"
    local width = "2880"
    local height = "1620"
    ensure_mermaid_theme(input_file)
    vim.fn.jobstart({
      "mmdc",
      "-i",
      input_file,
      "-o",
      output_file,
      "-w",
      width,
      "-H",
      height,
      "--backgroundColor",
      "transparent",
    }, {
      on_exit = function(_, code)
        if code == 0 then
          print("Mermaid diagram exported to " .. vim.fn.fnamemodify(output_file, ":~:."))
        else
          print("Failed to export Mermaid diagram")
        end
      end,
    })
  end,
})

-- Keymap to open the exported Mermaid diagram using macOS Preview
vim.keymap.set("n", "<leader>op", function()
  local output_file = vim.fn.expand("%:p:r") .. ".png"
  vim.fn.jobstart({ "open", output_file })
end, { desc = "Open exported Mermaid diagram in Preview" })
