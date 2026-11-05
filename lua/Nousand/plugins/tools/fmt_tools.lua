return {
    {
	'Wansmer/treesj',
	keys = {
	    { "<leader>mm", "<cmd>TSJToggle<cr>", desc = "toggle lists" },
	    { "<leader>mj", "<cmd>TSJJoin<cr>", desc = "join lists" },
	    { "<leader>ms", "<cmd>TSJSplit<cr>", desc = "split lists" },
	},
	dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
	config = function()
	    require('treesj').setup({--[[ your config ]]})
	end,
    }
}
