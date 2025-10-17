return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    
    telescope.setup({
      defaults = {
        -- Performance: Use ripgrep with optimized flags
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        
        -- Sorting and layout (descending for bottom prompt)
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        
        -- Files to ignore for performance
        file_ignore_patterns = { 
          "node_modules",
          ".git/",
          "%.lock",
          "dist/",
          "build/",
          "target/",
          "%.jpg",
          "%.png",
          "%.jpeg",
          "%.webp",
          "%.pdf",
        },
        
        -- Performance optimizations
        path_display = { "truncate" },
        dynamic_preview_title = true,
        
        -- Cache for speed
        cache_picker = {
          num_pickers = 5,
        },
        
        -- Appearance
        prompt_prefix = "❯ ",
        selection_caret = "▶ ",
        entry_prefix = "  ",
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        
        -- Mappings
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-h>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Esc>"] = actions.close,
            ["<C-c>"] = actions.close,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },
          n = {
            ["<Esc>"] = actions.close,
            ["q"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
        
        -- Layout configuration (prompt at bottom)
        layout_config = {
          horizontal = {
            preview_width = 0.55,
            prompt_position = "bottom",
            width = 0.87,
            height = 0.80,
          },
          vertical = {
            mirror = false,
          },
        },
        
        -- Color scheme integration
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
      },
      
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        oldfiles = {
          prompt_title = "Recent Files",
          only_cwd = false,
        },
        buffers = {
          prompt_title = "Buffers",
          sort_mru = true,
          ignore_current_buffer = true,
        },
        live_grep = {
          prompt_title = "Live Grep",
        },
        grep_string = {
          prompt_title = "Grep String",
        },
      },
      
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    
    -- Load fzf-native extension
    pcall(telescope.load_extension, "fzf")
  end,
}

