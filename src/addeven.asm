.data 
	prompt1: .asciiz "\nAdd Even Numbers from value: "
	prompt2: .asciiz "\nAdd Even Numbers to value: "
	
	result1: .asciiz "\nFrom Value: "
	result2: .asciiz "\nTo Value: "
	
.text
   
   main:
   
# Get a From Value from user

	li $v0, 4                    # Prompting the user for the from value (integer)
    	la $a0, prompt1
    	syscall
        
    	li $v0, 5                    # calling the console input read integer function to 
    	syscall                      # get the From Value
    
	move $t6, $v0                # Using register $t6 to hold the From Value
    
# Get a To Value from user

	li $v0, 4                    # Prompting the user for the from value (integer)
    	la $a0, prompt1
    	syscall
        
    	li $v0, 5                    # calling the console input read integer function to 
    	syscall                      # get the From Value
    
    	move $t7, $v0                # Using register $t7 to hold the to value

fromValue:	andi $s0,$t6, 1 	# Extract the Least Significant Bit (LSB)
		beqz $s0, toValue	# If LSB is a zero Branch to toValue
		addi  $t6, $t6, 1 	# If value is odd add 1
  toValue:
		andi $s0, $t7, 1 	# Extract the Least Significant Bit (LSB)
		beqz $s0, DisplayResults # If LSB is a zero Branch to DisplayResults
		addi  $t7, $t7, 1 	# If value is odd add 1
		
DisplayResults:
#   Display the From To values as even integers

    
DisplayFromValue:
    li      $v0, 4
    la      $a0, result1
    syscall                      # print out result1 message

    li      $v0, 1
    move    $a0, $t6
    syscall                      # print out From Value as an even integer

DisplayToValue:
    
    li      $v0, 4
    la      $a0, result1
    syscall                      # print out result2 message

    li      $v0, 1
    move    $a0, $t7
    syscall                      # print out To Value as an even integer


EndAndExit:
    li      $v0, 10              # terminate program run and
    syscall                      # Exit 
