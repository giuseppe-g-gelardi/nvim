vim.cmd([[ " Relative and absolute line numbers with git signs"
  let &stc='%s' . '%#NonText#%{&nu?v:lnum:""} ' . '%=%#CursorLineNr#%{&rnu&&(v:relnum==0)?"\ ".v:lnum:""}' . '%#NonText#%{&rnu&&(v:relnum!=0)&&(v:lnum%2)?"\ ".v:relnum:""}' . '%#LineNr#%{&rnu&&(v:relnum!=0)&&!(v:lnum%2)?"\ ".v:relnum:""} '
]])

-- vim.cmd([[ " Relative and absolute line numbers with git signs"
--   let &stc='%s' . '%#NonText#%{&nu?v:lnum:""} ' . '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' . '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""} '
-- ]])

