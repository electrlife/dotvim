"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => THIS IS .vimrc Don't edit, vimrc.local instead of customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vim/myconf/vimrc.local"))
    source ~/.vim/myconf/vimrc.local
endif

if has('gui_running')
    if filereadable(expand("~/.vim/myconf/gvimrc.local"))
        source ~/.vim/myconf/gvimrc.local
    endif
endif

" if filereadable(expand("~/.vim/myconf/.ycm_extra_conf.py"))
"     let g:ycm_global_ycm_extra_conf = "~/.vim/myconf/.ycm_extra_conf.py"
" endif
"
set mouse=a
set ttymouse=xterm2
set cmdheight=1
set t_BG=
set t_RB=1
set switchbuf=

"set background=light
"set background=dark
" colorscheme lightcolors
" colorscheme default
colorscheme codedark

if has('gui_running')
    set guifont=Consolas:h14
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ClangFormat
augroup ClangFormatSettings
  autocmd!
  " map to <Leader>cf in C++ code
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
augroup END

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++17 -stdlib=libc++'

" let g:gutentags_cache_dir = ~/.LefCache/gtags
" let g:gutentags_modules = gtags
let g:gutentags_enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" agrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets the default flags to use with the grep command.
" Default is '-I --exclude-dir=.{git,svn}' (exclude binary files, .git and .svn directories.
let g:agrep_default_flags = '-I --exclude-dir=.{git,svn} -P'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To fold in a style like python-mode [6]
let g:vim_markdown_folding_style_pythonic = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc reload and edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is disabled by default; add the following to your vimrc to enable the extension:
let g:airline#extensions#tabline#enabled = 1
" Separators can be configured independently for the tabline, so here is how you can define "straight" tabs:
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" subcommands
"
" tag                 navigate tags using the tags file
" line                search a line in the buffer
" command             execute built-in/user-defined Ex commands
" file                search files
" mru                 search most recently used files
" filetype            navigate the filetype
" bufTag              navigate tags in the buffer
" rg                  grep using rg
" function            navigate functions or methods in the buffer
" self                execute the commands of itself
" cmdHistory          execute the command in the history
" searchHistory       execute the search command in the history
" gtags               navigate tags using the gtags
" help                navigate the help tags
" colorscheme         switch between colorschemes
" buffer              search buffers

" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
" let g:Lf_StlSeparator = { 'left': ">", 'right': ">" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

" let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
