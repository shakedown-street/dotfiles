return {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
  keys = {
    {
      "]b",
      function()
        for _ = 1, vim.v.count1 do
          vim.cmd("BufferLineCycleNext")
        end
      end,
      desc = "Next buffer",
    },
    {
      "[b",
      function()
        for _ = 1, vim.v.count1 do
          vim.cmd("BufferLineCyclePrev")
        end
      end,
      desc = "Prev buffer",
    },
    {
      "]B",
      function()
        local els = require("bufferline").get_elements().elements
        vim.cmd("BufferLineGoToBuffer " .. #els)
      end,
      desc = "Last buffer",
    },
    { "[B", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "First buffer" },

    { "<leader>ch", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
    { "<leader>cl", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
    { "<leader>co", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other buffers" },

    {
      "<leader>rh",
      function()
        for _ = 1, vim.v.count1 do
          vim.cmd("BufferLineMovePrev")
        end
      end,
      desc = "Move buffer left",
    },
    {
      "<leader>rl",
      function()
        for _ = 1, vim.v.count1 do
          vim.cmd("BufferLineMoveNext")
        end
      end,
      desc = "Move buffer right",
    },
    {
      "<leader>rH",
      function()
        local els = require("bufferline").get_elements().elements
        local cur = vim.api.nvim_get_current_buf()
        for i, el in ipairs(els) do
          if el.id == cur then
            for _ = 1, i - 1 do
              vim.cmd("BufferLineMovePrev")
            end
            break
          end
        end
      end,
      desc = "Move buffer to far left",
    },
    {
      "<leader>rL",
      function()
        local els = require("bufferline").get_elements().elements
        local cur = vim.api.nvim_get_current_buf()
        for i, el in ipairs(els) do
          if el.id == cur then
            for _ = 1, #els - i do
              vim.cmd("BufferLineMoveNext")
            end
            break
          end
        end
      end,
      desc = "Move buffer to far right",
    },
  },
}
