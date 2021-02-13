local M = {}

function M.create_window()
    -- Dimentions
    local stats = vim.api.nvim_list_uis()[1]
    local height = stats.height
    local width = stats.width

    local factor = 0.6

    -- Creating buffer
    local buf = vim.api.nvim_create_buf(true, false)

    -- Creating window for the buffer
    return vim.api.nvim_open_win(
        buf,
        true,
        {
            relative = "editor",
            col = math.floor(width * (1 - factor) / 2),
            row = math.floor(height * (1 - factor) / 2),
            width = math.floor(width * factor),
            height = math.floor(height * factor)
        }
    )
end

function M.run_cmd(cmd, enter_or_not)
    local get_win = M.create_window()

    vim.api.nvim_exec("set nonu norelativenumber", get_win)
    vim.cmd(":term")

    local special_return = vim.api.nvim_replace_termcodes("<CR>", true, false, true)

    vim.api.nvim_feedkeys("a" .. cmd, "n", {})
    if enter_or_not then
        vim.api.nvim_feedkeys(special_return, "n", {})
    end
end

function M.compile_cpp(cmd)
    local name_of_file = vim.api.nvim_buf_get_name(0)
    cmd = cmd .. name_of_file
    M.run_cmd(cmd, false)
end

function M.run_program()
    -- TODO 1. get file path
    -- 2. use string formatting for getting the folder path
    M.run_cmd("./program", true)
end

function M.take_input()
    M.run_cmd("cat > in", false)
end

-- M.run_program()

return M
