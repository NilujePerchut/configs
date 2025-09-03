-- Orgmode related stuff
return {
	{
		"nvim-orgmode/orgmode",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    --event = "VeryLazy",
    ft = { "org" },
		config = function()
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      })
    end,
  },
	{
		"akinsho/org-bullets.nvim",
    dependencies = {
      "nvim-orgmode/orgmode",
    },
		opts = {},
    ft = { "org" },
	},
}
