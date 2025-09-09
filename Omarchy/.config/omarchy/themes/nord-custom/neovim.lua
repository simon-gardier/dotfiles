return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                default_integrations = true,  -- ensures bufferline & other integrations
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    -- {
    --     "LazyVim/LazyVim",
    --     opts = {
    --         colorscheme = "catppuccin",
    --     },
    -- },
}
