vim.cmd([[ " Relative and absolute line numbers with git signs"
  let &stc='%s' . '%#NonText#%{&nu?v:lnum:""} ' . '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' . '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""} '
]])
