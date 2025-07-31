return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
		{
			-- Open yazi at the nearest project root
			"<leader>pr",
			mode = { "n", "v" },
			-- TODO: find a more robust way to find project roots. As is this breaks.
			function()
				-- Function to find the project root
				local function find_project_root()
					local root_markers = {
						".git", -- Git repository
						"Makefile", -- Common for C/C++ projects
						"package.json", -- Node.js/JavaScript
						"pyproject.toml", -- Python (Poetry, Hatch)
						"Cargo.toml", -- Rust
						".svn", -- Subversion
						".hg", -- Mercurial
						".project_root", -- Custom marker you can create
						"pom.xml", -- Maven (Java)
						".editorconfig", -- General editor config
						".env", -- Environment variables (often at root)
					}

					-- Get the directory of the current file
					local current_file_dir = vim.fn.expand("%:p:h")

					-- Search upwards for any of the root markers
					-- 'limit' prevents searching beyond the home directory for performance/relevance
					local root_dir = vim.fs.find(
						root_markers,
						{ upward = true, limit = vim.loop.os_homedir(), path = current_file_dir }
					)[1]

					-- If a root is found, return it. Otherwise, default to the current working directory.
					return root_dir or vim.fn.getcwd()
				end

				local project_root = find_project_root()

				if project_root then
					vim.cmd("Yazi " .. project_root)
				else
					-- Fallback and notify if no project root is found
					vim.notify(
						"Could not find project root. Opening in current working directory.",
						vim.log.levels.WARN
					)
					vim.cmd("Yazi cwd")
				end
			end,
			desc = "Open yazi at the [p]roject [r]oot",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
