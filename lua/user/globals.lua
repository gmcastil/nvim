-- Unload all user modules and then reload the configuration
function _G.ReloadConfig()
  for name, val in pairs(package.loaded) do
    if name:match("^user%.") then
      print("Unloading module"..name)
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print("Configuration reloaded!")
end
