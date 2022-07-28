
call plug#begin()

" General Plugins
Plug 'preservim/nerdtree' " File System Explorer
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'dkarter/bullets.vim' " Bullets for markdown and text file
Plug 'morhetz/gruvbox' " Gruvbox (Color Theme)
Plug 'arcticicestudio/nord-vim' " Nord (Color Theme)
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-airline/vim-airline-themes' " Airline Themes
Plug 'junegunn/goyo.vim' " Zen Mode

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'webdevel/tabulous'

" Geneal Dev Specific Plugins
Plug 'https://github.com/tpope/vim-commentary' " Commenting Code
Plug 'https://github.com/tpope/vim-fugitive' " Running git commands in vim
Plug 'https://github.com/ap/vim-css-color' " Preview Colors
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production'  } " Prettier for formatting code
Plug 'jiangmiao/auto-pairs' " Complete pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
Plug 'https://github.com/airblade/vim-gitgutter' " Viewing changes from origin

" Node.js Specific Plugins
Plug 'https://github.com/pangloss/vim-javascript' " JS Bundle


" Flutter Specific Plugins
Plug 'dart-lang/dart-vim-plugin'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()


" Custome Defaults
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set autoindent
set termguicolors
colorscheme nord


" Telescope remaps
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" NERDTree remaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" Custom rempas
nnoremap <C-t> :NERDTreeToggle <CR> :TagbarToggle <CR>
nnoremap <C-q> :tabclose <CR>

" Coc setup
" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "             \ CheckBackspace() ? "\<TAB>" :
  "                   \ coc#refresh()
  "                   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  "                   function! CheckBackspace() abort
  "                     let col = col('.') - 1
  "                       return !col || getline('.')[col - 1]  =~# '\s'
  "                       endfunction
 


" imap <tab> <Plug>(coc-snippets-expand)
" let g:UltiSnipsExpandTrigger = '<Nop>'
" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'

" if has('nvim')
"     inoremap <silent><expr> <c-space> coc#refresh()
" else
" 	inoremap <silent><expr> <c-@> coc#refresh()
" endif

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ ]

" Startup Commands
au BufEnter * :PrettierAsync <CR> :GitGutterEnable <CR>


" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
 inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
             \ CheckBackspace() ? "\<TAB>" :
                   \ coc#refresh()
                   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

                   function! CheckBackspace() abort
                     let col = col('.') - 1
                       return !col || getline('.')[col - 1]  =~# '\s'
                       endfunction

                       " Use <c-space> to trigger completion.
                       if has('nvim')
                         inoremap <silent><expr> <c-space> coc#refresh()
                         else
                           inoremap <silent><expr> <c-@> coc#refresh()
                           endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"                               " Use `[g` and `]g` to navigate diagnostics
"                               " Use `:CocDiagnostics` to get all diagnostics
"                               of current buffer in location list.
                              nmap <silent> [g <Plug>(coc-diagnostic-prev)
                              nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"                               " GoTo code navigation.
                               nmap <silent> gd <Plug>(coc-definition)
                               nmap <silent> gy <Plug>(coc-type-definition)
                               nmap <silent> gi <Plug>(coc-implementation)
                               nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
		      call CocActionAsync('doHover')
			    else
					    call feedkeys('K', 'in')
						  endif
					  endfunction
