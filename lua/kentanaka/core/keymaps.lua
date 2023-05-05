vim.g.mapleader = " "


local keymap = vim.keymap 

keymap.set("i","jk","<ESC>")

keymap.set("n","<leader>nh", ":nohl<CR>")


keymap.set("n","x","_x")
keymap.set("n","<leader>+","<C-a>")
keymap.set("n","<leader>-","<C-x>")

--split windows
keymap.set("n","<leader>sv","<C-w>v")
keymap.set("n","<leader>sh","<C-w>s")
keymap.set("n","<leader>se","<C-W>=")
keymap.set("n","<leader>sx",":close<CR>")

keymap.set("n","<leader>to",":tabnew<CR>")
keymap.set("n","<leader>tx",":tabclose<CR>")
keymap.set("n","<leader>tn",":tabn<CR>")
keymap.set("n","<leader>tp",":tabp<CR>")

-- plugin keymaps


-- vim-maximize
keymap.set("n","<leader>sm",":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n","<leader>e",":NvimTreeToggle<CR>")

-- telescope
keymap.set("n","<leader>ff","<cmd>Telescope find_files<CR>")
keymap.set("n","<leader>fs","<cmd>Telescope live_grep<CR>")
keymap.set("n","<leader>fc","<cmd>Telescope grep_string<CR>")
keymap.set("n","<leader>fb","<cmd>Telescope buffers<CR>")
keymap.set("n","<leader>fh","<cmd>Telescope help_tags<CR>")

