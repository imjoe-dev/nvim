return {
	"nvim-mini/mini.surround",
	version = false,
	keys = { "ys", "ds", "cs" },
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "ys",
				delete = "ds",
				replace = "cs",
			},
		})
	end,
}
