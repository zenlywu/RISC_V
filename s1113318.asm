.data
student_ID: .string "1113318\n"
str1: .string "Please enter the strokes of the last name = "
str2: .string "Please enter the strokes of the first character of the first name = "
str3: .string "Please enter the strokes of the second character of the first name = "
str4: .string "Please enter how many characters your last name has (1 or 2) = "
str5: .string "Please enter how many characters your name has (1 or 2) = "
str_SP: .string "\n"
sky: .string "Sky= "
people: .string "People= "
land: .string "Land= "
outside: .string "Outside= "
total: .string "Total= "
strsky:.string"Sky"
strpeople:.string"People"
strland:.string"Land"
stroutside:.string"Oustside"
strtotal:.string"Total"
wood: .string "wood\n"
fire: .string "fire\n"
earth:.string "earth\n"
metal:.string "metal\n"
water:.string "water\n"
generate:.string " generate "
restraint:.string " restraint "
equal:.string " equal "
.text
main:
	li a1,1 #initial a1 to 1
	li a2,2 #initial a2 to 2
	li s10,10 #initial s10 to 10
	
	jal printID #print Student ID
	
	jal printlastname #print lastname
	jal inputlastname #input lastname
	mv a4,a0
	
	jal printfirstname #print firstname
	jal inputfirstname #input firstname
	mv a5,a0
	
	jal four_case ##process four case
	jal add_name #add all thing
	jal check_s8 #check s8 total
	
	jal print_sky
	mv a0,s4 #print sky number
	rem a0 ,a0,s10 #a0 = a0 / 10
	jal computeWuXin # computeWuXin(M=a0), return a0
	jal print_answer #sky answer
	mv s4,s9
	
	jal print_people
	mv a0,s5 #print people number
	rem a0 ,a0,s10 #a0 = a0 / 10
	jal computeWuXin # computeWuXin(M=a0), return a0
	jal print_answer #people answer
	mv s5,s9
	
	jal print_land
	mv a0,s6 #print land number
	rem a0 ,a0,s10 #a0 = a0 / 10
	jal computeWuXin # computeWuXin(M=a0), return a0
	jal print_answer #land answer
	mv s6,s9
	
	jal print_outside
	mv a0,s7 #print outside number
	rem a0 ,a0,s10 #a0 = a0 / 10
	jal computeWuXin # computeWuXin(M=a0), return a0
	jal print_answer #outside answer
	mv s7,s9
	
	jal print_total
	mv a0,s8 #print total number
	rem a0 ,a0,s10 #a0 = a0 / 10
	jal computeWuXin # computeWuXin(M=a0), return a0
	jal print_answer #total answer
	mv s8,s9
	
	#sky to all
	jal sky_people #sky and people to cal
	jal cal_printans
	jal endl
	
	jal sky_land #sky and land to cal
	jal cal_printans
	jal endl
	
	jal sky_outside #sky and outside to cal
	jal cal_printans
	jal endl
	
	jal sky_total
	jal cal_printans
	jal endl
	#people to all(no sky)
	jal people_land
	jal cal_printans
	jal endl
	
	jal people_outside
	jal cal_printans
	jal endl
	
	jal people_total
	jal cal_printans
	jal endl
	#land to all(no sky people)
	jal land_outside
	jal cal_printans
	jal endl
	
	jal land_total
	jal cal_printans
	jal endl
	#outside to all(no sky people land)
	jal outside_total
	jal cal_printans
	jal endl
	
	j end
printID:
	la a0,student_ID
	li a7,4
	ecall
	ret
printlastname:
	la a0,str4
	li a7,4
	ecall
	ret
inputlastname:
	li a7,5
	ecall
	ret
printfirstname:
	la a0,str5
	li a7,4
	ecall
	ret
inputfirstname:
	li a7,5
	ecall
	ret
four_case:
	beq a1,a4,onelastonefirst
	beq a2,a4,twolastonefirst
onelastonefirst:#單姓單名
	bne a1,a5,onelasttwofirst
	
	la a0,str1 #print str1
	li a7,4
	ecall
	
	li a7,5 #input s1
	ecall 
	mv s1,a0
	
	la a0,str2 #print str2
	li a7,4
	ecall
	
	li a7,5 #input s2
	ecall 
	mv s2,a0
	
	li s0,1
	li s3,1
	ret
onelasttwofirst:
	la a0,str1 #print str1
	li a7,4
	ecall
	li a7,5 #input s1
	ecall 
	mv s1,a0
	
	la a0,str2 #print str2
	li a7,4
	ecall
	li a7,5 #input s2
	ecall 
	mv s2,a0
	
	la a0,str3 #print str2
	li a7,4
	ecall
	li a7,5 #input s2
	ecall 
	mv s3,a0
	
	li s0,1
	ret

twolastonefirst:
	bne a1,a5,twolasttwofirst
	
	la a0,str1 #print str1
	li a7,4
	ecall
	li a7,5 #input s0
	ecall 
	mv s0,a0
	
	la a0,str1 #print str1
	li a7,4
	ecall
	li a7,5 #input s1
	ecall 
	mv s1,a0
	
	la a0,str2 #print str2
	li a7,4
	ecall
	li a7,5 #input s2
	ecall 
	mv s2,a0
	
	li s3,1
	ret
twolasttwofirst:
	la a0,str1 #print str1
	li a7,4
	ecall
	li a7,5 #input s0
	ecall 
	mv s0,a0
	
	la a0,str1 #print str1
	li a7,4
	ecall
	li a7,5 #input s1
	ecall 
	mv s1,a0
	
	la a0,str2 #print str2
	li a7,4
	ecall
	li a7,5 #input s2
	ecall 
	mv s2,a0
	
	la a0,str3 #print str3
	li a7,4
	ecall
	li a7,5 #input s2
	ecall 
	mv s3,a0
	ret
add_name:
	add s4,s0,s1 #sky
	add s5,s1,s2 #people
	add s6,s2,s3 #land
	add s7,s0,s3 #outside
	add s8,s8,s5 #total
	ret
check_s8:
	#mv s8,s5 #total one part
	beq a4,a2,add_lastname_total#if a4 = a2 = 2 add s0 to s8
	beq a5,a2,add_lastfirst_total#if a5 = a2 = 2 add s3 to s8
	ret
add_lastname_total:
	add s8,s8,s0
	beq a5,a2,add_lastfirst_total#if a5 = a2 = 2 add s3 to s8
	ret
add_lastfirst_total:
	add s8,s8,s3
	ret
computeWuXin:
    mv t1, a0

    addi sp, sp, -4
    sw ra, 0(sp)

    blez t1, ModeWater
    li a2, 2
    ble t1, a2, ModeWood
    li a2, 4
    ble t1, a2, ModeFire
    li a2, 6
    ble t1, a2, ModeEarth
    li a2, 8
    ble t1, a2, ModeMetal
    li a2, 9
    ble t1, a2, ModeWater

ModeWood:
    la a0, wood
    li s9,0
    j endcomputeWuXin

ModeFire:
    la a0, fire
    li s9,1
    j endcomputeWuXin

ModeEarth:
    la a0, earth
    li s9,2
    j endcomputeWuXin

ModeMetal:
    la a0, metal
    li s9,3
    j endcomputeWuXin

ModeWater:
    la a0, water
    li s9,4
    j endcomputeWuXin
endcomputeWuXin:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret  # 返回 (a0将持有结果字符串的地址)

print_sky:
	la a0,sky
	li a7,4
	ecall
	mv a0,s4
	li a7,1
	ecall
	ret
print_people:
	la a0,people
	li a7,4
	ecall
	mv a0,s5
	li a7,1
	ecall
	ret
print_land:
	la a0,land
	li a7,4
	ecall
	mv a0,s6
	li a7,1
	ecall
	ret
print_outside:
	la a0,outside
	li a7,4
	ecall
	mv a0,s7
	li a7,1
	ecall
	ret
print_total:
	la a0,total
	li a7,4
	ecall
	mv a0,s8
	li a7,1
	ecall
	ret
print_answer:
	li a7,4
	ecall
	ret
############Advanced##############
sky_people:
	la t0,strsky
	la t1,strpeople
	mv t2,s4 #sky
	mv t3,s5 #people
	ret
sky_land:
	la t0,strsky
	la t1,strland
	mv t2,s4 #sky
	mv t3,s6 #land
	ret
sky_outside:
	la t0,strsky
	la t1,stroutside
	mv t2,s4 #sky
	mv t3,s7 #outside
	ret
sky_total:
	la t0,strsky
	la t1,strtotal
	mv t2,s4 #sky
	mv t3,s8 #total
	ret
people_land:
	la t0,strpeople
	la t1,strland
	mv t2,s5 #people
	mv t3,s6 #land
	ret
people_outside:
	la t0,strpeople
	la t1,stroutside
	mv t2,s5 #people
	mv t3,s7 #outside
	ret
people_total:
	la t0,strpeople
	la t1,strtotal
	mv t2,s5 #people
	mv t3,s8 #total
	ret
land_outside:
	la t0,strland
	la t1,stroutside
	mv t2,s6 #land
	mv t3,s7 #outside
	ret
land_total:
	la t0,strland
	la t1,strtotal
	mv t2,s6 #land
	mv t3,s8 #total
	ret
outside_total:
	la t0,stroutside
	la t1,strtotal
	mv t2,s7 #outside
	mv t3,s8 #total
	ret
cal_printans:
	beq t2,t3,t2_t3equal #if t2 = t3 print equal
	
	addi t2,t2,-1
	beq t2,t3,t2_t3rG
	addi t2,t2,-1
	beq t2,t3,t2_t3rR
	addi t2,t2,2
	
	addi t2,t2,1
	beq t2,t3,t2_t3G
	addi t2,t2,1
	beq t2,t3,t2_t3R
	addi t2,t2,-2
	
	addi t2,t2,4
	beq t2,t3,t2_t3rG
	addi t2,t2,-1
	beq t2,t3,t2_t3rR
	addi t2,t2,-3
	
	addi t2,t2,-4
	beq t2,t3,t2_t3G
	addi t2,t2,1
	beq,t2,t3,t2_t3R
	addi t2,t2,3
	
	ret
t2_t3equal:
	mv a0,t0
	li a7,4
	ecall
	
	la a0,equal
	li a7,4
	ecall
	
	mv a0,t1
	li a7,4
	ecall
	ret
t2_t3rG:
	mv a0,t1
	li a7,4
	ecall
	
	la a0,generate
	li a7,4
	ecall
	
	mv a0,t0
	li a7,4
	ecall
	ret
t2_t3rR:
	mv a0,t1
	li a7,4
	ecall
	
	la a0,restraint
	li a7,4
	ecall
	
	mv a0,t0
	li a7,4
	ecall
	ret
t2_t3G:
	mv a0,t0
	li a7,4
	ecall
	
	la a0,generate
	li a7,4
	ecall
	
	mv a0,t1
	li a7,4
	ecall
	ret
t2_t3R:
	mv a0,t0
	li a7,4
	ecall
	
	la a0,restraint
	li a7,4
	ecall
	
	mv a0,t1
	li a7,4
	ecall
	ret
endl:
	la a0,str_SP
	li a7,4
	ecall
	ret
end:
    	li a7,10
    	ecall
	
	
