return {
	"nvim-mini/mini.surround",
	version = false,
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
