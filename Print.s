# This program calculates and prints the number of seconds in an hour, a day, and a week
# Output format:
# Hour: 3600
# Day: 86400
# Week: 604800

# define system call code
.eqv PRINT_INT 1
.eqv SYS_EXIT 10
.eqv PRINT_STR 4

        .data

hour: .asciiz "Hour: "
day: .asciiz "Day: "
week: .asciiz "Week: "
new_line: .asciiz "\n"

        .text

main:

        li      $v0, PRINT_STR          # print "Hour: "
        la      $a0, hour
        syscall

        li      $t0, 60                 # load the number of seconds in a minute into $t0
        mul     $t1, $t0, $t0           # an hour has 60 * 60 secs, load the value into $t1

        li      $v0, PRINT_INT          # print the number of seconds in an hour
        move    $a0, $t1
        syscall

        la      $a0, new_line           # print a new line
        li      $v0, PRINT_STR
        syscall

        la      $a0, day                # print "Day: "
        li      $v0, PRINT_STR
        syscall

        mul     $t2, $t1, 24            # number of seconds in a day = number of seconds in an hour * 24

        li      $v0, PRINT_INT          # print the number of seconds in a day
        move    $a0, $t2
        syscall

        la      $a0, new_line           # print a new line
        li      $v0, PRINT_STR
        syscall

        la      $a0, week               # print "Week: "
        li      $v0, PRINT_STR
        syscall

        mul     $t3, $t2, 7             # the number of seconds in a week = number of seconds in a day * 7

        move    $a0, $t3                # print the number of seconds in a week
        li      $v0, PRINT_INT
        syscall

        li      $v0, SYS_EXIT
        syscall                         # program exists
