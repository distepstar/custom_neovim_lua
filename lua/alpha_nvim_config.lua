local status_ok, alpha_nvim = pcall(require, 'alpha')

if not status_ok then
  return
end

alpha_nvim.setup(require "alpha.themes.dashboard".config)

