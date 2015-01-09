set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim7.1��windows�µı������á�
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

set fileencodings=utf-8,chinese,latin-1

if has("win32")

 set fileencoding=chinese

else

 set fileencoding=utf-8

endif

"����˵�����

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

"���consle�������

language messages zh_CN.utf-8

"��ʾ�к�
set nu


"vundle����"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/vimfiles/bundle' 
call vundle#begin(path)
Bundle 'gmarik/Vundle.vim'
Bundle 'python_fold_compact'
Bundle 'a.vim'
Bundle 'vimplugin/project.vim'
Bundle 'jmcomets/vim-pony'
Bundle 'vim-scripts/snipMate'
Bundle 'vim-scripts/Tagbar'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'powerline/powerline'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/neocomplcache'
Bundle 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on    " required
" ����ΪҪ��װ����µĲ������ͬ�ֿⶼ�У�������д�淶��ο�������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
""��������
"""""""""""""""""""""""""""""""""""""""""""""
set number                                            "��ʾ�к�
set laststatus=2                                      "����״̬����Ϣ
set cmdheight=2                                       "���������еĸ߶�Ϊ2��Ĭ��Ϊ1
set cursorline                                        "ͻ����ʾ��ǰ��
set nowrap                                            "���ò��Զ�����
set shortmess=atI                                     "ȥ����ӭ����
" au GUIEnter * simalt ~x                           "��������ʱ�Զ����
winpos 100 10                                     "ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
set lines=38 columns=120                          "ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
colorscheme slate
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=
syntax enable
syntax on
"----------TagBar-------����
nmap <F8> :TagbarToggle<CR>
"ָ����ɫ����Ϊ
colorscheme Tomorrow-Night-Eighties

"��������ʱ���Դ�Сд
set ignorecase
" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
set writebackup                             "�����ļ�ǰ�������ݣ�����ɹ���ɾ���ñ���
set nobackup                                "�����ޱ����ļ�
set noswapfile                              "��������ʱ�ļ�
set vb t_vb=                                "�ر���ʾ��
set guifont=Courier_New:h12:cANSI   " ��������  
set ruler           " ��ʾ���  
set showcmd         " �����������ʾ�������������Щ  
set cmdheight=1     " �����У���״̬���£��ĸ߶ȣ�����Ϊ1  
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
highlight Comment ctermfg=green guifg=green
"--------------------------ctags----------
set tags=tags; 
set autochdir
"--------------------------Tlist--------------
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"-------------------------- ����winmanager
" ���ý���ָ�
let g:winManagerWindowLayout = "TagList|FileExplorer"
"����winmanager�Ŀ�ȣ�Ĭ��Ϊ25
let g:winManagerWidth = 30
"����򿪹ر�winmanager��ݼ�ΪF8
nmap <silent> <F8> :WMToggle<cr>
"�ڽ���vimʱ�Զ���winmanager
let g:AutoOpenWinManager = 1
"Youcomplate ����
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

"------------PownerLine����-------------
let g:Powerline_symbols = 'fancy'

"-----------vim-scripts/neocomplcache ����--------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'




"-----------set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"-------------syntastic  seting----------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
