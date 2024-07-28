return {
    "folke/tokyonight.nvim",
    opts = {
        style = "night",
        dim_inactive = true,
    },
    init = function ()
	    vim.cmd [[ colorscheme tokyonight-night ]]
    end
}
