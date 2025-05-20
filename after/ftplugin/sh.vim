" Add support for joining comments and deleting the comment leader
if v:version > 703 || v:version == 703 && has ('patch541')
  setlocal formatoptions+=j
endif

" Bash has had shellcheck support for a while now, so for
if has('eval')
    augroup ShSpecific
        autocmd!
        autocmd FileType sh compiler shellcheck
    augroup END
    " Tell shellcheck to use GCC compatible output formatting. This, and the
    " autocmd means I don't have to write a custom errorformat expression
    setlocal makeprg=shellcheck\ -x\ -f\ gcc\ %
endif

