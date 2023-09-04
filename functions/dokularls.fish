function dokularls --description 'peek in dir and choose file for okular'
  
  set extension (path extension $argv[1])
  if test "$extension" != ""
    dokular $dir
    return
  end
  
  set dir $argv[1]
  set filenum 1
  set pdfs
  
  for file in (ls $dir)
    if test (path extension $file) != ".pdf"
      continue
    end
    if test $filenum -eq 1; echo "Choose file:";end
    echo $filenum". "$file
    set filenum (math $filenum + 1)
    set -a pdfs $file
  end
  
  if test (count $pdfs) -lt 1
    echo "no pdfs present:"
    ls $dir
    return
  end
  
  read i
  if test $i -eq 0
    return
  end
  
  set selection (string join / (path normalize $dir) $pdfs[$i])
  dokular $selection
end
