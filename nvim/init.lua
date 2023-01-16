require('maciejpanasiewicz.base')
require('maciejpanasiewicz.highlights')
require('maciejpanasiewicz.maps')
require('maciejpanasiewicz.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('maciejpanasiewicz.macos')
end
if is_win then
  require('maciejpanasiewicz.windows')
end
