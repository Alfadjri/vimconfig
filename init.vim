" ============================================
" Plugin Manager Configuration
" ============================================
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'

" File Explorer
Plug 'preservim/nerdtree'

" Fuzzy Finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Terminal Split
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

" ============================================
" Theme: Material with Custom Background & Split Colors
" ============================================
lua << EOF
vim.g.material_style = "deep ocean"
require('material').setup({
  contrast = {
    terminal = true,
    sidebars = true,
    floating_windows = true,
    cursor_line = true,
    non_current_windows = true,
  },
  styles = {
    comments = { italic = true },
    functions = { bold = true },
    keywords = { italic = true },
  },
})
vim.cmd('colorscheme material')
EOF

" ============================================
" Highlight Overrides
" ============================================
" Gunakan warna latar dari Tokyonight tapi tetap pertahankan style Material
highlight clear Normal
highlight Normal guibg=#1a1b26

highlight NormalNC guibg=#16161e
highlight ActiveWindow guibg=#000000

highlight VertSplit guifg=white guibg=#000000
highlight WinSeparator guifg=white guibg=#000000
highlight CursorLine guibg=#2a2e3e
highlight StatusLine guifg=white guibg=#3b1e5c
highlight StatusLineNC guifg=white guibg=#1a1a1a
highlight Visual guibg=#5a189a guifg=NONE

augroup HighlightActiveWin
  autocmd!
  autocmd WinEnter * setlocal winhighlight=Normal:ActiveWindow
  autocmd WinLeave * setlocal winhighlight=Normal:NormalNC
augroup END

set termguicolors
set cursorline

" ============================================
" ToggleTerm Configuration
" ============================================
lua << EOF
require("toggleterm").setup{
  size = 15,
  open_mapping = [[<C-t>]],
  direction = "horizontal",
  start_in_insert = true,
  on_open = function(term)
    vim.cmd("wincmd K")
  end,
}
EOF

" ============================================
" Split file opener with position shortcut
" ============================================
function! OpenFileInSplit(direction)
  let l:file = expand('%')
  if empty(l:file)
    echo "Tidak ada file aktif"
    return
  endif
  if a:direction ==# 'left'
    execute 'leftabove vsplit ' . l:file
  elseif a:direction ==# 'right'
    execute 'rightbelow vsplit ' . l:file
  elseif a:direction ==# 'up'
    execute 'leftabove split ' . l:file
  elseif a:direction ==# 'down'
    execute 'rightbelow split ' . l:file
  else
    echo "Arah tidak valid"
  endif
endfunction

" ============================================
" Basic Settings
" ============================================
set number
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent
set mouse=a
set clipboard=unnamedplus
set undofile
set showcmd
set hlsearch
set ignorecase
set smartcase

" ============================================
" Key Mappings
" ============================================
let mapleader = " "
inoremap jk <Esc>
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
vnoremap <C-c> "+y
nnoremap <C-c> "+yy
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>

" Split dengan arah
nnoremap <leader>sh :call OpenFileInSplit('left')<CR>
nnoremap <leader>sl :call OpenFileInSplit('right')<CR>
nnoremap <leader>sk :call OpenFileInSplit('up')<CR>
nnoremap <leader>sj :call OpenFileInSplit('down')<CR>

" Navigasi antar split (normal mode)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigasi antar split (terminal mode)
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

