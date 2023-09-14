local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
mason.setup{}
