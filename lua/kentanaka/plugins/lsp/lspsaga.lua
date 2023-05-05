local saga_status , sagat = pcall(require,"lspsaga")
if not saga_status then
  return
end
sagat.setup({
  move_in_saga = { prev = "<C-k>", next = "<C-j>"},
  finder_action_key = {
    open = "<CR>",
  },
  definition_action_key = {
    edit = "<CR>",
  },
})
