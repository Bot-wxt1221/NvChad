local M = {}

local whichkey = require "which-key"
-- local legendary = require "legendary"

-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end

function M.setup()
  local keymap = {
    l = {
      name = "DAP",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
  }
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }
  whichkey.register(keymap, opts)
  --- require("legendary.integrations.which-key").bind_whichkey(keymap, opts, false)
  vim.api.nvim_create_autocmd("FileType", {
        pattern = "cpp",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F5>",
                ":w<CR>:split<CR>:te g++ '%' -g -DONLINE_JUDGE -std=c++14 -Wall -O0 -o '%:r' -fsanitize=address -fsanitize=undefined<CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                ":w<CR>:split<CR>:te g++ '%' -g -std=c++14 -Wall -O0 -o '%:r' -fsanitize=address -fsanitize=undefined<CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F6>",
            ":w<CR>:split<CR>:te '%:r'<CR>i",
        {silent=true,noremap=true}
      )
        end,
    })

  local keymap_v = {
    l = {
      name = "Debug",
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    },
  }
  opts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }
  whichkey.register(keymap_v, opts)
  --- require("legendary.integrations.which-key").bind_whichkey(keymap_v, opts, false)
end

return M
