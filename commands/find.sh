find /var -name "*.log" -size +500M -exec ls -lh {} \;

# 5 biggest files
find . -type f -exec ls -s {} \; | sort -n -r | head -5

find . -type f -print0 | xargs -0 du -h | sort -hr | head -20

# find the 10 PHP files that have the most "use" statements
find src -type f -name "*.php" -exec grep --with-filename -c "^use " {} \; | sort -t ":" -k 2 -n -r | head -n 10

# find files with abstract classes
find src -type f -name "*.php" -exec grep --with-filename -c "^abstract class " {} \; | grep ":[^0]"

# find files with 2 or more classes in a single file
find src -type f -name "*.php" -exec grep --with-filename -c "^class " {} \; | grep ":[2-99]" | sort -t ":" -k 2 -n -r

# find empty files or directories
find . -type f -empty
