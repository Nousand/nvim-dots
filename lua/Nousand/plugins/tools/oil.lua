return {
    'stevearc/oil.nvim',
    keys = { 
	{ "<leader>od", "<cmd>Oil<cr>", desc = "Open current directory (fill buffer)" },
	{ "<leader>of", "<cmd>Oil --float<cr>", desc = "Open current directory (floating)" },
    },
    opts = {
        columns = {
	    --{ "type", icons = { directory = "\u{f413}", file = "\u{f15c}", link = "\u{f482}" } },
            "icon",
	    "size",
	    {
	      "permissions",
	      highlight = function(perm_str)
		local hls = {}
		for i = 1, #perm_str do
		  local ch = perm_str:sub(i, i)
		  local op = { r = "String", w = "Keyword", x = "Identifier" }
		  local hl = op[ch] or "NonText"
		  table.insert(hls, { hl, i - 1, i })
		end
		return hls
	      end,
	    },
        },
	view_options = { show_hidden = true },
	buf_options = { filetype = "oil" },
	win_options = { signcolumn = "yes", spell = false },
	float = {
	    border  = "rounded",
	    padding = 5,
	}
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
}
