if vim.loader then
  vim.loader.enable()
end
-- TODO:
-- FIXME:
-- NOTE:
_G.dd = function(...)
  require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")
