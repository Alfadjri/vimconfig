local status, _ = pcall(vim.cmd,"color nightfly")
if not status then
  print("Colorscheme not found")
  return
end
