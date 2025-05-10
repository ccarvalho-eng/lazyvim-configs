local M = {}

-- Function to switch between test and implementation files
function M.switch_test_implementation()
  local current_file = vim.fn.expand("%:p")
  local target_file

  if current_file:match("_test%.exs$") then
    -- We're in a test file, switch to implementation
    target_file = current_file:gsub("/test/", "/lib/"):gsub("_test%.exs$", ".ex")
  elseif current_file:match("%.ex$") then
    -- We're in an implementation file, switch to test
    target_file = current_file:gsub("/lib/", "/test/"):gsub("%.ex$", "_test.exs")
  else
    vim.notify("Not a recognized Elixir file type", vim.log.levels.WARN)
    return
  end

  if vim.fn.filereadable(target_file) == 1 then
    vim.cmd("edit " .. target_file)
  else
    -- Create directory if it doesn't exist
    local target_dir = vim.fn.fnamemodify(target_file, ":h")
    if vim.fn.isdirectory(target_dir) == 0 then
      vim.fn.mkdir(target_dir, "p")
    end

    -- Create and open the new file
    vim.cmd("edit " .. target_file)

    if current_file:match("%.ex$") then
      -- Extract full module path from the implementation file path
      local rel_path = current_file:match(".*/lib/(.+)%.ex$")
      if rel_path then
        -- Convert path to module name
        local module_name = rel_path
          :gsub("/", ".")
          :gsub("_(%l)", function(l)
            return l:upper()
          end) -- convert snake_case to camelCase
          :gsub("^%l", string.upper) -- capitalize first letter
          :gsub("%.%l", string.upper) -- capitalize letters after dots

        -- Generate test module content
        local test_content = string.format(
          [[
defmodule %sTest do
  use ExUnit.Case
  doctest %s

  test "greets the world" do
    assert true
  end
end]],
          module_name,
          module_name
        )

        -- Insert the test module content
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(test_content, "\n"))

        -- Save the file
        vim.cmd("write")
      end
    end
  end
end

return M
