return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = false,
		filesystem = {
			follow_current_file = {
				enabled = false, -- No auto-expansion
			},
			hijack_netrw_behavior = "disabled", -- Don't auto-open Neo-tree
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			window = {
				position = "right",
				width = 30,
				mappings = {
					["<space>"] = "toggle_node", -- Manual expand/collapse
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Toggle Neo-tree with <leader>e
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {
			desc = "Toggle Neo-tree",
			noremap = true,
			silent = true,
		})
	end,
}
