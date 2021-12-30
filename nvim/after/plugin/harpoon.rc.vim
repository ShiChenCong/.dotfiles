nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
" nnoremap <C-y> :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>h :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>j :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>k :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap <leader>l :lua require("harpoon.ui").nav_file(4)<CR>

lua <<EOF
require("harpoon").setup({ menu = { width = 90, height = 6 } })
EOF
