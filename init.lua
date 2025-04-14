-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local function ensure_mermaid_theme(file_path)
  local lines = vim.fn.readfile(file_path)
  local theme_header =
    '%%{init: { "theme": "dark", "themeVariables": { "background": "#1e1e1e", "primaryColor": "#bb86fc" }}}%%'

  if not vim.startswith(lines[1], "%%{init:") then
    table.insert(lines, 1, theme_header)
    vim.fn.writefile(lines, file_path)
  end
end

-- Exports Mermaid diagrams on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.mmd",
  callback = function()
    local input_file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:p:r") .. ".png"
    local width = "1200"
    local height = "800"

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
      "#1e1e1e",
    }, {
      on_exit = function(_, code)
        if code == 0 then
          print("Mermaid diagram exported to " .. output_file)
          local win_id = vim.fn.bufwinid(output_file)
          if win_id == -1 then
            vim.fn.jobstart({ "open", output_file }) -- macOS-specific
          else
            vim.api.nvim_set_current_win(win_id)
          end
        else
          print("Failed to export Mermaid diagram")
        end
      end,
    })
  end,
})
