return {
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			checkOnSave = true,
			procMacro = { enable = true },
			completion = {
				postfix = { enable = true },
			},
		},
	},
}
