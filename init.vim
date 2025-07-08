" ============================================
" Plugin Manager Configuration
" ============================================
"Load vim-plug from autoload directory
call plug#begin('~/.config/nvim/plugged')

" Theme: Tokyonight
Plug 'folke/tokyonight.nvim'
" File Explorer
Plug 'preservim/nerdtree'

" Fuzzy Finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'  " Icon support (optional)


Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}


call plug#end()


" ============================================
" ToggleTerm Configuration
" ============================================
lua << EOF
require("toggleterm").setup{
  size = 15,
  open_mapping = [[<C-t>]],
  direction = "horizontal", -- tetap horizontal  shade_terminals = true,
  start_in_insert = true,
  on_open = function(term)
    vim.cmd("wincmd K")  -- ⬅️ pindahkan terminal ke atas
  end,
}
EOF

" ============================================
" Split file opener with position shortcut
" ============================================
function! OpenFileInSplit(direction)
  let l:file = expand('%')  " ambil file yang sedang aktif

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
" Set line numbers
set number

" Set relative line numbers (optional)
" set relativenumber

" Enable syntax highlighting
syntax on

" Set colorscheme to tokyonight
colorscheme tokyonight

" Enable true color support (if your terminal supports it)
set termguicolors

" ============================================
" Indentation Settings
" ============================================
" Enable auto indent
set autoindent

" Set shift width to 4 spaces
set shiftwidth=2

" Set tab stop to 4 spaces
set tabstop=2

" Use spaces instead of tabs
set expandtab

" Enable smart indentation
set smartindent

" ============================================
" Key Mappings
" ============================================
" Map 'jk' to escape in insert mode
inoremap jk <Esc>
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
vnoremap <C-c> "+y
nnoremap <C-c> "+yy
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>


let mapleader = " "


" Split file openers (dengan prompt file)
nnoremap <leader>sh :call OpenFileInSplit('left')<CR>
nnoremap <leader>sl :call OpenFileInSplit('right')<CR>
nnoremap <leader>sk :call OpenFileInSplit('up')<CR>
nnoremap <leader>sj :call OpenFileInSplit('down')<CR>


" Navigasi antar split dari mode normal
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Navigasi antar split dari terminal mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" ============================================
" Performance and Usability
" ============================================
" Enable mouse support
set mouse=a

" Enable clipboard to work with system clipboard
set clipboard=unnamedplus

" Save undo history to a file
set undofile

" Show command in the bottom bar while typing
set showcmd

" ============================================
" Search Settings
" ============================================
" Highlight search results
set hlsearch

" Ignore case while searching
set ignorecase

" Override ignorecase if search contains uppercase letters
set smartcase


