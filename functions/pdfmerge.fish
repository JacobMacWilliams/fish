function pdfmerge
  \gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$argv[1] $argv[2..3]
end
