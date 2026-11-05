local function icon(glyph, color)
    return { icon = glyph, color = color }
end

local groups = {
    { "<leader>f", group = "Find", icon = icon("\u{f002} ", "blue") }, -- nf-fa-search
    { "<leader>g", group = "Git", icon = icon("\u{e702} ", "orange") }, -- nf-dev-git
    { "<leader>l", group = "LSP", icon = icon("\u{f121} ", "cyan") }, -- nf-fa-code
    { "<leader>c", group = "Code", icon = icon("\u{f0ad} ", "purple") }, -- nf-fa-wrench
    { "<leader>m", group = "Format", icon = icon("\u{f0753} ", "purple") }, -- nf-md-format_align_bottom
    { "<leader>u", group = "UI", icon = icon("\u{f0ae2} ", "yellow") }, -- nf-md-format_align_bottom
    { "<leader>o", group = "Open", icon = icon("\u{f05da} ", "red") }, -- nf-md-format_align_bottom
}

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
	preset = "modern",
	win = { border = "rounded" },
	icons = {
	    breadcrumb = "»",
	    separator = "➜",
	    group = "+",
	},
    },
    config = function(_, opts)
	local wk = require("which-key")
	wk.setup(opts)
	wk.add(groups)
    end,
    keys = {
	{
	    "<leader>?",
	    function()
		require("which-key").show({ global = false })
	    end,
	    desc = "Buffer local keymaps",
	},
    },
}
