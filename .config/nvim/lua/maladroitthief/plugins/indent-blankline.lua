return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    tag = "v3.8.2", -- TODO: Remove tagged version -ian
    opts = {
        indent = {
            char = "┃",
        },
        scope = {
            show_start = false,
            show_end = false,
        },
    },
}
