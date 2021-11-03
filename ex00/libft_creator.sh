rm -f libft.a
find . -maxdepth 1 -name "*.c" -type f -exec gcc -Wall -Werror -Wextra -c {} \;
ar -rcs libft.a *.o
find . -maxdepth 1 -name "*.o" -type f -delete

echo "===== norminette -v ========="
norminette -v
echo "===== lsb_release -a ========="
lsb_release -a
echo "===== xcode-select -p ========="
lsb_release -a
echo "===== uname -a ========="
uname -a
echo "===== uname -m ========="
uname -m
echo "===== hostnamectl ========="
hostnamectl
echo "===== gcc -v ========="
gcc -v
echo "===== clang -v ========="
clang -v
echo "===== printenv ========="
printenv
