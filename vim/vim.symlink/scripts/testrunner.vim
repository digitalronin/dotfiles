"vim-rspec  https://github.com/thoughtbot/vim-rspec
let g:rspec_command = "Tmux rspec {spec}"
"override this with a local .vimrc file, if necessary (e.g. rails projects
"that use spring"

"vim-ex_test https://github.com/moofish32/vim-ex_test
let g:ex_test_command = "Tmux MIX_ENV=test mix test {test}"

function MyRunCurrentSpecFile()
  exec ":write"

  if (&filetype == "elixir")
    call RunCurrentTestFile()
  else
    call RunCurrentSpecFile()
  endif
endfunction

function MyRunNearestSpec()
  exec ":write"

  if (&filetype == "elixir")
    call RunNearestTest()
  else
    call RunNearestSpec()
  endif
endfunction

function MyRunLastSpec()
  exec ":write"

  if (&filetype == "elixir")
    call RunLastTest()
  else
    call RunLastSpec()
  endif
endfunction

function MyRunAllSpecs()
  exec ":write"

  if (&filetype == "elixir")
    call RunAllTests()
  else
    call RunAllSpecs()
  endif
endfunction

nmap <Leader>rf :call MyRunCurrentSpecFile()<CR>
nmap <Leader>rs :call MyRunNearestSpec()<CR>
nmap <Leader>rl :call MyRunLastSpec()<CR>
nmap <Leader>ra :call MyRunAllSpecs()<CR>

