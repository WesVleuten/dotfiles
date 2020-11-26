if exists("did_load_filetypes_userafter")
  finish
endif
let did_load_filetypes_userafter = 1

augroup filetypedetect
	autocmd BufReadPre,FileReadPre *.json set ft=json
augroup END

