-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local telescope = require("telescope")
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  file_ignore_patterns = { "node%_modules/.*" }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
