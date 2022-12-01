# a) r = m + n
#	add  $s0, $s1,  $s2
# b) r = m - (n + o)
#	add  $t0, $s2, $s3
#	sub  $s0, $s1, $t0
# c) r = (m - n) - (o + p)
#	sub  $t0, $s1, $s2 
#	add  $t1, $s3, $s4
#	sub  $s0, $t0, $t1
# d) r = m - (n + 2)
#	addi $t0, $s2, 0x02
#	sub  $s0, $s1, $t0
# e) r = [m- (2 - n)] - (o + p + 3)

	addi $s1, $zero, 0x0A # 10 m
	addi $s2, $zero, 0x01 # 1 n
	addi $s3, $zero, 0x01 # 1 o
	addi $s4, $zero, 0x03 # 3 p
	
	add  $t0, $s3, $s4 # o + p = 4 
	addi $t0, $t0, 3 # o + p + 3 = 7
	
	addi $t1, $s2, -2 # 2 - n = 1
	sub  $t1, $s1, $t2  # m - (2 - n) = 9 
	
	sub  $s0, $t1, $t0 #9 - 7 = 2