--
-- Quickfix stuff
-- ----------------

vim.opt_local.wrap = false

-- Remove the current line from the quickfix list
local function remove_qf_entry()
    local qflist = vim.fn.getqflist()
    local current_line = vim.fn.line('.') - 1 -- 0-indexed

    if #qflist > 0 and current_line >= 0 and current_line < #qflist then
        table.remove(qflist, current_line + 1)
        vim.fn.setqflist(qflist, 'r')
    end
end

-- Map 'dd' to remove the entry
vim.api.nvim_buf_set_keymap(0, 'n', 'dd', '', {
    noremap = true,
    silent = true,
    callback = remove_qf_entry
})
