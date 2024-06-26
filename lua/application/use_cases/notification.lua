local M = {}

local log_levels = require("domain.log_levels")
local adapter = require("infraestrucuture.adapters.notification")

M.list = function()
	adapter.list()
end

M.dismiss = function()
	adapter.dismiss()
end

M.notify = function(opts)
	local level = opts.level
	local message = opts.message

	adapter.notify({
		message = vim.inspect(message),
		level = level,
	})
end

M.debug = function(message)
	M.notify({ message = message, level = log_levels.DEBUG })
end

M.info = function(message)
	M.notify({ message = message, level = log_levels.INFO })
end

M.warn = function(message)
	M.notify({ message = message, level = log_levels.WARN })
end

M.error = function(message)
	M.notify({ message = message, level = log_levels.ERROR })
end

return M
