#
# ELECTRAN QUESTION 9.
#
# The first unsigned halfword gives the number of data values to add together.
# Then the data values follow this given as  unsigned 16-bit values.
# The final memory location allocated with a  'space  2' directive gives the
# memory location to put the result.
#
# No overflow exceptions should result (similar to C-code) when doing the
# addition - any  unsigned overflow should just be ignnored.

# Your key task is to write some MIPS assembly language to add together the
# data values given and put the answer into the  last memory location. 
 
# You should write your assembly language below the comment line saying:
# "WRITE ASSEMBLY LANGUAGE SOLUTION BELOW".

.data

vals:

# Number of data values to add together as a unsigned halfword.
.half 5

# The actual data values themselves as "16-bit unsigned values".
.half 0x0010, 0x0020, 0x0030 ,0x0040, 0x0050

# Memory address to put the sum into.  The result should be stored as a unsigned halfword.
# In this case the assembly language should put  0x00F0 onto this memory location.
# However the code should work in general for any given lists of data values.
.space 2


########## WRITE ASSEMBLY LANGUAGE SOLUTION BELOW ##########
.text
main:
la $t0, vals
lhu $t3, 0($t0)
addu $t1, $0, $0

while: beq $t3, $0, done
       lhu $t2, 2($t0)
       addu $t1, $t2, $t1 #sum stored in $t1
       subiu $t3, $t3, 1
       addi $t0, $t0, 2
       j while
done:
     la $t0, vals
     lhu $t4, 0($t0) #stores 5
     li $t5, 2
     mult $t4, $t5
     mfhi $t6
     mflo $t7 #stored 10
     addu $t7, $t7, $t0
     sh $t1, 2($t7)
     lhu $a0, 2($t7)


exit:
     li $v0, 10
     syscall




