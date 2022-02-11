local function init()
  require 'Gabriel.vim'.init()
  require 'Gabriel.packer'.init()
end

return {
  init = init,
}
