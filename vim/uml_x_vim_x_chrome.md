vimでumlを書いてchromeで確認する

install aklt/plantuml-syntax 

```.vimrc
" UML
au FileType plantuml command! OpenUml :!open "/Applications/Google Chrome.app" --args --disable-web-security file:///Users/konumashuri/%
```

chrome
install [PlantUml Viewer](https://chrome.google.com/webstore/detail/plantuml-viewer/legbfeljfbjgfifnkmpoajgpgejojooj)
