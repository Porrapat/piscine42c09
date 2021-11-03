.DEFAULT_GOAL := all
norminette:
	-norminette ./ex00/ft_putchar.c
	-norminette ./ex00/ft_putstr.c
	-norminette ./ex00/ft_strcmp.c
	-norminette ./ex00/ft_strlen.c
	-norminette ./ex00/ft_swap.c
	-norminette ./ex01/includes/ft.h
	-norminette ./ex01/srcs/ft_putchar.c
	-norminette ./ex01/srcs/ft_putstr.c
	-norminette ./ex01/srcs/ft_strcmp.c
	-norminette ./ex01/srcs/ft_strlen.c
	-norminette ./ex01/srcs/ft_swap.c
	-norminette ./ex02/ft_split.c

compile: norminette
	-gcc ./ex00/ft_strlen.c test_ex00_ft_strlen.c -Wall -Werror -Wextra -o test_ex00_ft_strlen
	-gcc ./ex01/ft_putstr.c test_ex01_ft_putstr.c -Wall -Werror -Wextra -o test_ex01_ft_putstr
	-gcc ./ex02/ft_putnbr.c test_ex02_ft_putnbr.c -Wall -Werror -Wextra -o test_ex02_ft_putnbr

build-sample: compile
	-./test_ex00_ft_strlen > result_sample_ex00_ft_strlen.txt
	-./test_ex01_ft_putstr > result_sample_ex01_ft_putstr.txt
	-./test_ex02_ft_putnbr > result_sample_ex02_ft_putnbr.txt

run:	compile
	-./test_ex00_ft_strlen > result_current_ex00_ft_strlen.txt
	-./test_ex01_ft_putstr > result_current_ex01_ft_putstr.txt
	-./test_ex02_ft_putnbr > result_current_ex02_ft_putnbr.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00_ft_strlen.txt result_sample_ex00_ft_strlen.txt
	-diff result_current_ex01_ft_putstr.txt result_sample_ex01_ft_putstr.txt
	-diff result_current_ex02_ft_putnbr.txt result_sample_ex02_ft_putnbr.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00_ft_strlen
	-rm test_ex01_ft_putstr
	-rm test_ex02_ft_putnbr


clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master
