-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Space>", "<PageDown>", { silent = true })
map("n", "<S-Space>", "<PageUp>", { silent = true })
--map("n", "<Leader>", ":<C-u>WhichKey ','<CR>" { silent = true })
--map("n", "<Leader>?", ":WhichKey ','<CR>")
--map("n", "<Leader>a", ":cclose<CR>")


--function scroll_half(direction)
--	height = vim.fn.winheight(0)

--end
