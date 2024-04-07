require 'impatient'
require('maciejpanasiewicz.base')
require('maciejpanasiewicz.highlights')
require('maciejpanasiewicz.maps')
require('maciejpanasiewicz.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_linux = has "unix"

if is_mac then
  require('maciejpanasiewicz.macos')
end
if is_win then
  require('maciejpanasiewicz.windows')
end
if is_linux == 1 then
  require('maciejpanasiewicz.linux')
end
