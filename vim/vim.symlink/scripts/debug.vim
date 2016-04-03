
function InsertDebugStatement()
  let debug = "debugger; 1"  | " default because it works for ruby & javascript

  if (&filetype == "ruby")
    let debug = "binding.pry"
  endif

  if (&filetype == "elixir")
    let debug = "TestHelper.enable_debug_logging"
  endif

  exec ":normal O" . debug
  exec ":write"

endfunction

map <Leader>db :call InsertDebugStatement()<CR>


