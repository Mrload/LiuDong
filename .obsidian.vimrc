" 让j和k导航到视觉行而不是逻辑行
"nmap j gj
"nmap k gk
" 我喜欢使用H和L来移动到行的开头和结尾
"nmap H ^
"nmap L $
" 快速删除搜索高亮
"nmap <F9> :nohl

" 复制到系统剪贴板
"set clipboard=unnamed

" 使用Ctrl+O和Ctrl+I返回和前进
"（确保删除默认的Obsidian快捷键以使其工作）
"exmap back obcommand app:go-back
"nmap <C-o> :back
"exmap forward obcommand app:go-forward
"nmap <C-i> :forward

