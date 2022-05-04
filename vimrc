"split ===================================================  GLOBAL SETTINGS
"
let g:python3_host_prog="/usr/bin/python3"
"
"
let g:vimroot=expand($HOME . "/.vim")

"| PLUGINS START
"v

" init
let g:plug_dir=expand(g:vimroot . "/plugged")
call plug#begin(g:plug_dir)

"disable parallel plugs
"let g:plug_threads = 1

"
" Core plugins with toggles
"

" open filesystem browser (on demand loading) (toggle with Ctrl + g)
if has('nvim')
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
else
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeTabsToggle' }
    Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeTabsToggle' }
endif
" display list of functions, variables etc. (',t')
Plug 'majutsushi/tagbar'
" git-based per-file local undo tree (toggle with 'U')
Plug 'mbbill/undotree'
" comment multiple lines (visual select + ',cc' to comment/',cu' to uncomment)
Plug 'scrooloose/nerdcommenter'

" align text (e.g., '=' in consequent lines - visual select then ,<sumbol>)
Plug 'godlygeek/tabular'
" git diff/blame functionality (',gb' for blame, ',gd' for diff etc)
Plug 'tpope/vim-fugitive'
" show guides at indent stops (toggle with F4)
Plug 'nathanaelkane/vim-indent-guides'
" distraction-free editing (:Goyo and :Goyo! for on/off)
Plug 'junegunn/goyo.vim'

"
" Other always-on plugins
"

" Colorschemes
let colorschemes=expand(g:vimroot . "/colorschemes")
Plug colorschemes
" visual line (requires syntastic for error/warning detection)
Plug 'itchyny/lightline.vim' | Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
" search and local vimrc files (".lvimrc") in the dir tree
if has('nvim') || v:version >= 704
    Plug 'embear/vim-localvimrc'
endif
" interpret a file by function
Plug 'MarcWeber/vim-addon-mw-utils'
" pretty vim -d (diff)
Plug 'chrisbra/vim-diff-enhanced'
" change working directory to project root
Plug 'airblade/vim-rooter'
" auto-completion for quotes, parentheses etc.
" this plugin does not play well with vim-tex, so keep this in mind
" See https://github.com/Raimondi/delimitMate/issues/48 and
" https://github.com/junegunn/vim-plug/issues/63
" Plug 'Raimondi/delimitMate'

" faster folding
Plug 'Konfekt/FastFold'

" cscope
let has_cscope = system("which cscope")
if !v:shell_error && !(has('win32') || has ('win64'))
    Plug 'brookhong/cscope.vim'
endif

if (has('python') || has('python3')) && (has('nvim') || v:version >= 704)
    " more snippets (depends on ultisnips)
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif

" run tests
Plug 'janko/vim-test'

" language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

"
" Language-specific plugins
"

" Javascript
Plug 'editorconfig/editorconfig-vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
if !(has('win32') || has ('win64'))
	Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
endif

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" Python
if has ('black')
    Plug 'psf/black', { 'for': 'python', 'tag': '*' }
else
    Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
    Plug 'tell-k/vim-autopep8', { 'for': 'python' }
endif
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'heavenshell/vim-pydocstring', { 'for': 'python' }

" check if jedi is present an load it accordingly
let has_jedi = system("python -c 'import jedi'")
if !v:shell_error
    if has('nvim')
        Plug 'zchee/deoplete-jedi', { 'for': 'python' }
    else
        Plug 'davidhalter/jedi-vim', { 'for': 'python' }
    endif
endif

Plug 'tpope/vim-commentary'
Plug 'ycm-core/YouCompleteMe'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'

" Go (order matters?)
" let has_go = system("which go")
" if !v:shell_error && !(has('win32') || has ('win64'))
    " Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
    " Plug 'buoto/gotests-vim', { 'for': 'go' }
    " if has('nvim')
        " Plug 'mdempsky/gocode', {
                    " \ 'for': 'go',
                    " \ 'rtp': 'nvim',
                    " \ 'do': '~/.vim/plugged/gocode/nvim/symlink.sh'
                    " \ }
        " Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
        " Plug 'sebdah/vim-delve', { 'for': 'go' }
    " else
        " Plug 'mdempsky/gocode', {
                    " \ 'for': 'go',
                    " \ 'rtp': 'vim',
                    " \ 'do': '~/.vim/plugged/gocode/vim/symlink.sh'
                    " \ }
    " endif
" endif

" PHP
if !(has('win32') || has ('win64'))
    if has('nvim')
        Plug 'padawan-php/deoplete-padawan', { 'for': 'php' }
    endif
endif

" html css
Plug 'mattn/emmet-vim'

" Java-specific -- really slow!
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'tfnico/vim-gradle', { 'for': 'java' }
Plug 'tpope/vim-classpath', { 'for': 'java' }

" LaTeX
Plug 'lervag/vimtex'

" other
Plug 'lilydjwg/colorizer',  { 'for' : 'CSS' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
Plug 'msteinert/vim-ragel', { 'for': 'ragel' }
Plug 'raichoo/smt-vim'
Plug 'tomlion/vim-solidity'
Plug 'ElmCast/elm-vim'

" MATLAB
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }

" wrap it up
call plug#end()

"^
"| PLUGINS END

" load configs
let default_config = expand(g:vimroot . "/config/default.vim")
execute "source ".fnameescape(default_config)
let plugins_config = expand(g:vimroot . "/config/plugins.vim")
execute "source ".fnameescape(plugins_config)
let misc_config = expand(g:vimroot . "/config/misc.vim")
execute "source ".fnameescape(misc_config)

"===================================================  USER SETTINGS

" user settings - this will be ignored by git
let user_config = expand(g:vimroot . "/config/user.vim")
execute "source ".fnameescape(user_config)


" -----------------------------------------------------------------------------
"  VIMTEX OPTIONS
"  ----------------------------------------------------------------------------
if has('unix')
    if has('mac')
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        " let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    else
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
    endif
elseif has('win32')

endif

let g:tex_flavor = "lualatex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : 'build',
  \ 'callback' : 1,
  \ 'continuous' : 1,
  \ 'executable' : 'latexmk',
  \ 'hooks' : [function('UpdateSkim')],
  \   'options' : [
  \       '-file-line-error',
  \       '-synctex=1',
  \       '-interaction=nonstopmode',
  \       '-shell-escape',
  \       '-pdflatex=lualatex',
  \       '-output-directory=build',
  \     ],
  \}


" Simple Config
let g:Tex_BibtexFlavor = 'biber'
" let g:Tex_CompileRule_bib = 'biber $*'
" let g:Tex_CompileRule_pdf = 'mkdir -p build && pdflatex -output-directory=build -interaction=nonstopmode $* && cp *.bib build && cd build && bibtex %:r && cd .. && pdflatex -output-directory=build -interaction=nonstopmode $* && mv build/$*.pdf .'
" let g:tex_flavor='latex' # Default tex file format
" let g:vimtex_view_method = 'skim' # Choose which program to use to view PDF file
" let g:vimtex_view_skim_sync = 1 # Value 1 allows forward search after every successful compilation
" let g:vimtex_view_skim_activate = 1 # Value 1 allows change focus to skim after command `:VimtexView` is given
" let g:vimtex_compiler_latexmk = {
    " \ 'build_dir' : 'build',
    " \ }

" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
let g:tex_conceal = ""
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]
