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
	-./ex00/libft_creator.sh
	-gcc ./ex02/ft_split.c test_ex02_ft_split.c -Wall -Werror -Wextra -o test_ex02_ft_split

build-sample: compile
	-./test_ex02_ft_split "aaa,bbb,ccc" "," > result_sample_ex02_ft_split_case_1.txt
	-./test_ex02_ft_split "aaa,bbb,ccc ddd,eee" "," > result_sample_ex02_ft_split_case_2.txt
	-./test_ex02_ft_split "aaa,bbb,ccc ddd,eee" ", " > result_sample_ex02_ft_split_case_3.txt
	-./test_ex02_ft_split "ImtmVrV6Ov8QrkGGUglBy7Vgsu iIsdl5XyT35Czv4xeu" "yenORYQ" > result_sample_ex02_ft_split_case_4.txt
	-./test_ex02_ft_split "SJLoauIorpGcYMqTxOURsOVhv6P9gQB" "4JTWPF" > result_sample_ex02_ft_split_case_5.txt

run:	compile
	-./test_ex02_ft_split "aaa,bbb,ccc" "," > result_current_ex02_ft_split_case_1.txt
	-./test_ex02_ft_split "aaa,bbb,ccc ddd,eee" "," > result_current_ex02_ft_split_case_2.txt
	-./test_ex02_ft_split "aaa,bbb,ccc ddd,eee" ", " > result_current_ex02_ft_split_case_3.txt
	-./test_ex02_ft_split "ImtmVrV6Ov8QrkGGUglBy7Vgsu iIsdl5XyT35Czv4xeu" "yenORYQ" > result_current_ex02_ft_split_case_4.txt
	-./test_ex02_ft_split "SJLoauIorpGcYMqTxOURsOVhv6P9gQB" "4JTWPF" > result_current_ex02_ft_split_case_5.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex02_ft_split_case_1.txt result_sample_ex02_ft_split_case_1.txt
	-diff result_current_ex02_ft_split_case_2.txt result_sample_ex02_ft_split_case_2.txt
	-diff result_current_ex02_ft_split_case_3.txt result_sample_ex02_ft_split_case_3.txt
	-diff result_current_ex02_ft_split_case_4.txt result_sample_ex02_ft_split_case_4.txt
	-diff result_current_ex02_ft_split_case_5.txt result_sample_ex02_ft_split_case_5.txt

clean:
	-rm -rf */*.a
	-rm -rf libft.a
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex02_ft_split

clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master
