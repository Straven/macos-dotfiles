return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    quickfile = { enabled = true },
    dashboard = {
      row = nil,
      col = nil,
      pane_gap = 4,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
        
██╗░░░██╗░█████╗░██████╗░██╗░░░██╗██╗░█████╗░██╗░░██╗██╗
╚██╗░██╔╝██╔══██╗██╔══██╗██║░░░██║██║██╔══██╗██║░░██║██║
░╚████╔╝░██║░░██║██████╔╝██║░░░██║██║██║░░╚═╝███████║██║
░░╚██╔╝░░██║░░██║██╔══██╗██║░░░██║██║██║░░██╗██╔══██║██║
░░░██║░░░╚█████╔╝██║░░██║╚██████╔╝██║╚█████╔╝██║░░██║██║
░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝░╚═════╝░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝

░██████╗██╗░░██╗██╗██╗░░██╗░█████╗░██╗░░░██╗██╗███╗░░██╗
██╔════╝██║░░██║██║██║░░██║██╔══██╗██║░░░██║██║████╗░██║
╚█████╗░███████║██║███████║██║░░██║██║░░░██║██║██╔██╗██║
░╚═══██╗██╔══██║██║██╔══██║██║░░██║██║░░░██║██║██║╚████║
██████╔╝██║░░██║██║██║░░██║╚█████╔╝╚██████╔╝██║██║░╚███║
╚═════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚═╝░╚════╝░░╚═════╝░╚═╝╚═╝░░╚══╝

███╗░░██╗██╗░░░██╗██╗███╗░░░███╗
████╗░██║██║░░░██║██║████╗░████║
██╔██╗██║╚██╗░██╔╝██║██╔████╔██║
██║╚████║░╚████╔╝░██║██║╚██╔╝██║
██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║
╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
      ]],
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    image = {},
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {},
      },
    },
  },
}
