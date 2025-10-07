return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup({
      --- `mcp-hub` binary related options-------------------
      config = vim.fn.expand("~/.config/mcphub/servers.json"),                         -- Absolute path to MCP Servers config file (will create if not exists)
      port = 37373,                                                                    -- The port `mcp-hub` server listens to
      shutdown_delay = 5 * 60 * 000,                                                   -- Delay in ms before shutting down the server when last instance closes (default: 5 minutes)
      use_bundled_binary = false,                                                      -- Use local `mcp-hub` binary (set this to true when using build = "bundled_build.lua")
      mcp_request_timeout = 60000,                                                     --Max time allowed for a MCP tool or resource to execute in milliseconds, set longer for long running tasks
      global_env = {},                                                                 -- Global environment variables available to all MCP servers (can be a table or a function returning a table)
      workspace = {
        enabled = true,                                                                -- Enable project-local configuration files
        look_for = { ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" }, -- Files to look for when detecting project boundaries (VS Code format supported)
        reload_on_dir_changed = true,                                                  -- Automatically switch hubs on DirChanged event
        port_range = { min = 40000, max = 41000 },                                     -- Port range for generating unique workspace ports
        get_port = nil,                                                                -- Optional function returning custom port number. Called when generating ports to allow custom port assignment logic
      }
    })
  end
}
