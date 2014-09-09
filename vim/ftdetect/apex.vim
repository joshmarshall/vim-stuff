"apex / salesforce stuff
au BufRead,BufNewFile *.apxc set filetype=apexclass
au BufRead,BufNewFile *.cls set filetype=apexclass
au BufRead,BufNewFile *.trigger set filetype=apexclass

au FileType apexclass set syntax=apex tabstop=4 shiftwidth=4 softtabstop=4 nowrap
