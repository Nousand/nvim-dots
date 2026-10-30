local function on_attach(event)
	local buf = event.buf
	local client = vim.lsp.get_client_by_id(event.data.client_id)

	local function map(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
	end

	-- Diagnostics
	map("n", "<leader>ld", vim.diagnostic.open_float, "LSP: Line diagnostics")
	map("n", "<leader>lq", vim.diagnostic.setloclist, "LSP: Diagnostics to location list")

	-- Editing
	map("n", "<leader>ls", vim.lsp.buf.signature_help, "LSP: Signature help")

	if client and client:supports_method("textDocument/formatting") then
		map("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, "LSP: Format buffer")
	end

	if client and client:supports_method("textDocument/inlayHint") then
		map("n", "<leader>lt", function()
			local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
			vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
		end, "LSP: Toggle inlay hints")
	end

	map("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", "LSP: Server information")
	map("n", "<leader>lX", "<cmd>lsp restart<cr>", "LSP: Restart server")
end

return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("NousandLspKeymaps", { clear = true }),
			callback = on_attach,
		})

		vim.diagnostic.config({
			severity_sort = true,
			virtual_text = { spacing = 2, source = true },
			float = { border = "rounded", source = true },
		})
	end,
}
