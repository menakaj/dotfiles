let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +44 ~/dotfiles/.config/nvim/init.lua
badd +20 ~/dotfiles/.config/nvim/lua/core/options.lua
badd +94 ~/dotfiles/.config/nvim/lua/core/keymaps.lua
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/dotfiles/.config/nvim/lua/core/keymaps.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 40 + 107) / 214)
exe 'vert 2resize ' . ((&columns * 86 + 107) / 214)
exe 'vert 3resize ' . ((&columns * 86 + 107) / 214)
argglobal
enew
file neo-tree\ filesystem\ \[1]
balt ~/dotfiles/.config/nvim/lua/core/options.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
wincmd w
argglobal
balt ~/dotfiles/.config/nvim/lua/core/options.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 126 - ((40 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 126
normal! 03|
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/.config/nvim/lua/core/keymaps.lua", ":p")) | buffer ~/dotfiles/.config/nvim/lua/core/keymaps.lua | else | edit ~/dotfiles/.config/nvim/lua/core/keymaps.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/.config/nvim/lua/core/keymaps.lua
endif
balt ~/dotfiles/.config/nvim/lua/core/options.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 69 - ((46 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 69
normal! 07|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 107) / 214)
exe 'vert 2resize ' . ((&columns * 86 + 107) / 214)
exe 'vert 3resize ' . ((&columns * 86 + 107) / 214)
tabnext
argglobal
enew
balt ~/dotfiles/.config/nvim/lua/core/keymaps.lua
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
