local presence = require('presence')
local M = {}

M.setup = function()
   presence:setup({
      neovim_image_text   = "uwu",
       main_image          = "file",
       log_level           = nil, 
       enable_line_number  = false,
     })
end

return M
