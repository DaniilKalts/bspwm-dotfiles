-- Insert Mode: Map 'jk' to escape
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Exit Insert Mode" })

-- Normal Mode: Disable search highlighting with 'hs'
vim.api.nvim_set_keymap("n", "hs", ":noh<CR>", { noremap = true, silent = true, desc = "Disable Search Highlighting" })

-- Visual Mode: Take a snapshot with Silicon using Ctrl + s
vim.api.nvim_set_keymap(
  "v",
  "<C-s>",
  ":Silicon<CR>",
  { noremap = true, silent = true, desc = "Take Snapshot with Silicon" }
)

-- Normal Mode: Toggle the Alpha Dashboard with Ctrl + m
vim.api.nvim_set_keymap(
  "n",
  "<C-m>",
  ":lua ToggleAlpha()<CR>",
  { noremap = true, silent = true, desc = "Toggle Alpha Dashboard" }
)

-- Normal Mode: Toggle Neo-tree with Ctrl + e
vim.api.nvim_set_keymap(
  "n",
  "<C-e>",
  ":Neotree toggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Neo-tree" }
)

-- Normal Mode: Toggle Markdown Preview with 'mp'
vim.api.nvim_set_keymap(
  "n",
  "mp",
  ":MarkdownPreviewToggle<CR>",
  { noremap = true, silent = true, desc = "Toggle Markdown Preview" }
)

-- Normal Mode: Invoke Telescope's find_files limited to the current file's directory with Ctrl + p
vim.api.nvim_set_keymap(
  "n",
  "<C-p>",
  [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>]],
  { noremap = true, silent = true, desc = "Telescope Find Files" }
)

-- Normal Mode: Search for a substring within files in the current file's directory with Ctrl + g
vim.api.nvim_set_keymap(
  "n",
  "<C-g>",
  [[<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })<CR>]],
  { noremap = true, silent = true, desc = "Telescope Live Grep" }
)

-- Normal Mode: Buffer navigation using bufferline.nvim
vim.api.nvim_set_keymap(
  "n",
  "<S-Tab>",
  "<Cmd>BufferLineCyclePrev<CR>",
  { noremap = true, silent = true, desc = "Previous Buffer" }
)
vim.api.nvim_set_keymap(
  "n",
  "<Tab>",
  "<Cmd>BufferLineCycleNext<CR>",
  { noremap = true, silent = true, desc = "Next Buffer" }
)

-- Function: Close buffer or switch to the Alpha dashboard if it's the last buffer
function CloseBufferOrSwitchToAlpha()
  local buf_count = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 }))
  if buf_count > 1 then
    -- There are multiple buffers, switch to the previous buffer and delete the current one
    vim.cmd("bprev")
    vim.cmd("bdelete #")
  else
    -- Only one buffer left, so open the alpha menu
    vim.cmd("Alpha")
  end
end

-- Normal Mode: Close the current buffer or switch to the Alpha dashboard with Ctrl+c
vim.api.nvim_set_keymap(
  "n",
  "<leader>w",
  ":lua CloseBufferOrSwitchToAlpha()<CR>",
  { noremap = true, silent = true, desc = "Close Buffer or Switch to Alpha" }
)

-- Normal Mode: Navigate to specific buffers using Numbers
for i = 1, 9 do
  vim.api.nvim_set_keymap(
    "n",
    "<leader>" .. tostring(i),
    "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
    { noremap = true, silent = true, desc = "Go to Buffer " .. i }
  )
end
vim.api.nvim_set_keymap(
  "n",
  "<leader>0",
  "<Cmd>BufferLineGoToBuffer -1<CR>",
  { noremap = true, silent = true, desc = "Go to Last Buffer" }
)

-- Normal Mode: Adjust Neo-tree Width
vim.keymap.set("n", "=", ":vertical resize +5<CR>", { noremap = true, silent = true, desc = "Increase Neo-tree Width" })
vim.keymap.set("n", "-", ":vertical resize -5<CR>", { noremap = true, silent = true, desc = "Decrease Neo-tree Width" })
