local autopairs_setup , autopairs = pcall(require,"nvim-autopair")
if not autopairs_setup then
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = {"string"},
    javascript = {"template_string"},
    java = false,
  },
})

local cmp_autopairs_setup , cmp_autopairs = pcall(require,"nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  return
end
 local cmp_setup  , cmp = pcall(require , "cmp") 
 if not cmp_setup then
   return
 end 

 cmp.event:on("config_done",cmp_autopairs.on_config_done())