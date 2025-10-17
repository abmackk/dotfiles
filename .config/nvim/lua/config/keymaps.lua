local keymap = vim.keymap.set

-- ===========================
-- Better Escape Alternatives
-- ===========================
-- Exit insert mode with jj (faster than reaching for Esc)
keymap("i", "jj", "<Esc>", { desc = "Exit insert mode" })
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Make sure Esc works everywhere (explicitly set for insert mode)
keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
-- ===========================
-- Window Navigation
-- ===========================
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- ===========================
-- Better Indenting
-- ===========================
-- Stay in visual mode when indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- ===========================
-- Move Lines
-- ===========================
-- Move line up/down in normal and visual mode
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ===========================
-- Better Paste
-- ===========================
-- Don't copy replaced text after paste in visual mode
keymap("v", "p", '"_dP', { desc = "Paste without yanking" })

-- ===========================
-- Better Scrolling
-- ===========================
-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- ===========================
-- Buffer Management
-- ===========================
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })
keymap("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>ba", ":%bd|e#<CR>", { desc = "Close all buffers except current" })

-- ===========================
-- File Explorer
-- ===========================
keymap("n", "<leader>e", function()
	require("oil").toggle_float()
end, { desc = "Open file explorer (float)" })

keymap("n", "-", function()
	require("oil").toggle_float()
end, { desc = "Open parent directory" })

-- ===========================
-- Telescope (Optimized Fuzzy Finder)
-- ===========================
keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Find buffers" })
keymap("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Help tags" })
keymap("n", "<leader>fc", "<CMD>Telescope commands<CR>", { desc = "Commands" })
keymap("n", "<leader>fw", "<CMD>Telescope grep_string<CR>", { desc = "Find word under cursor" })
keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "Keymaps" })
keymap("n", "<leader>fm", "<CMD>Telescope marks<CR>", { desc = "Marks" })

-- ===========================
-- LSP Shortcuts
-- ===========================
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- ===========================
-- Diagnostics
-- ===========================
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- ===========================
-- Formatting
-- ===========================
keymap("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- ===========================
-- Copilot Shortcuts
-- ===========================
keymap("i", "<C-l>", function()
	require("copilot.suggestion").accept()
end, { desc = "Accept Copilot suggestion" })

keymap("i", "<C-]>", function()
	require("copilot.suggestion").next()
end, { desc = "Next Copilot suggestion" })

keymap("i", "<C-[>", function()
	require("copilot.suggestion").prev()
end, { desc = "Previous Copilot suggestion" })

keymap("i", "<C-x>", function()
	require("copilot.suggestion").dismiss()
end, { desc = "Dismiss Copilot suggestion" })

keymap("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Open Copilot panel" })
keymap("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })

-- ===========================
-- DAP (Debugging)
-- ===========================
keymap("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
keymap("n", "<leader>dc", "<CMD>DapContinue<CR>", { desc = "Continue" })
keymap("n", "<leader>di", "<CMD>DapStepInto<CR>", { desc = "Step into" })
keymap("n", "<leader>do", "<CMD>DapStepOver<CR>", { desc = "Step over" })
keymap("n", "<leader>dt", "<CMD>DapTerminate<CR>", { desc = "Terminate" })

-- ===========================
-- Quick Save & Quit
-- ===========================
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all without saving" })

-- ===========================
-- Clear Search Highlighting
-- ===========================
-- keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Clear search highlighting with leader
keymap("n", "<leader>/", ":noh<CR>", { desc = "Clear search highlight" })

-- ===========================
-- Split Windows
-- ===========================
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- ===========================
-- Toggle colorizer
-- ===========================
keymap("n", "<leader>ct", ":ColorizerToggle<CR>", { desc = "Toggle colorizer" })

-- ===========================
-- Dashboard
-- ===========================
-- Command to open alpha dashboard
vim.api.nvim_create_user_command("Dashboard", function()
	require("alpha").start()
end, {})

-- YAML navigation (for K8s manifests, Ansible, etc.)
keymap("n", "<leader>yk", ":YAMLView<CR>", { desc = "View YAML path" })
keymap("n", "<leader>yt", ":Telescope yaml_schema<CR>", { desc = "YAML schema" })

-- Kubernetes management from Neovim
keymap("n", "<leader>k", ":Kubectl<CR>", { desc = "Kubectl menu" })

-- Terminal shortcuts
keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Float terminal" })
keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })

-- ===========================
-- Session Management
-- ===========================
-- Restore the last session for current directory
keymap("n", "<leader>qs", function()
	require("persistence").load()
end, { desc = "Restore Session" })

-- Restore the last session (global)
keymap("n", "<leader>ql", function()
	require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })

-- Stop persistence (don't save on exit)
keymap("n", "<leader>qd", function()
	require("persistence").stop()
end, { desc = "Don't Save Session" })

-- ===========================
-- Toggle Between Material and Vague
-- ===========================
local current_theme = "material"

keymap("n", "<leader>tt", function()
  if current_theme == "material" then
    vim.cmd("colorscheme vague")
    current_theme = "vague"
    print("Theme: Vague")
  else
    vim.g.material_style = "deep ocean"
    vim.cmd("colorscheme material")
    current_theme = "material"
    print("Theme: Material Deep Ocean")
  end
end, { desc = "Toggle theme" })

