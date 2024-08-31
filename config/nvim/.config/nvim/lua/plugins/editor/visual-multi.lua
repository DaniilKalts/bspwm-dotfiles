return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    -- Basic configuration for vim-visual-multi
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",      -- Optional: Default for finding under the cursor
      ["Add Cursor Down"] = "<C-Down>", -- Add a cursor below
      ["Add Cursor Up"] = "<C-Up>",  -- Add a cursor above
    }
  end,
}
