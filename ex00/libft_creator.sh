rm -f libft.a
find . -maxdepth 1 -name "*.c" -type f -exec gcc -Wall -Werror -Wextra -c {} \;
ar -rcs libft.a *.o
find . -maxdepth 1 -name "*.o" -type f -delete

echo "===== norminette -v ========="
norminette -v
echo "===== lsb_release -a ========="
lsb_release -a
echo "===== hostnamectl ========="
hostnamectl
echo "===== gcc -v ========="
gcc -v
echo "===== printenv ========="
printenv
