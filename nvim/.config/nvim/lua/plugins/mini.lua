return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.icons").setup()

    local map = require("mini.map")
    map.setup()
    map.open()
  end,
}
