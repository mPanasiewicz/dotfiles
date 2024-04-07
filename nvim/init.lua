require 'impatient'
require('maciejpanasiewicz.base')
require('maciejpanasiewicz.highlights')
require('maciejpanasiewicz.maps')
require('maciejpanasiewicz.plugins')

local os = vim.loop.os_uname().sysname

if os == "Darwin" then
  require('maciejpanasiewicz.macos')
elseif os == "Linux" then
  require('maciejpanasiewicz.linux')
elseif os == "Windows_NT" then
  require('maciejpanasiewicz.windows')
else
  error("Unknown OS")
end
