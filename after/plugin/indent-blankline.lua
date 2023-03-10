vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol: "

require("indent_blankline").setup {
    char = '┊',
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,

    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    -- space_char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    show_trailing_blankline_indent = false,
}
