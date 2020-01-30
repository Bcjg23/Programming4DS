 #!/bin/bash
 
curl http://www.gutenberg.org/files/35/35-0.txt | sed '0,/\*\*\* START OF THIS PROJECT GUTENBERG EBOOK THE TIME MACHINE \*\*\*/d' | sed '/\*\*\* END OF THIS PROJECT GUTENBERG EBOOK THE TIME MACHINE \*\*\*/,$d' | grep -o  -E '\w+' | sort | uniq -c | sort -nr | head -10  >> problema-1.sh

exit
