     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION 
;tanx function
		VLDR.F32 S1, =0.5235; Loading the value of x in radians
		
		MOV R10,#1; temp variable to store intermediate result
		MOV R11,#2; temp variable to calculate factorial
		MOV R9,#3;  temp variable to calculate factorial
		MOV R1,#0;
		VLDR.F32 S11, =1;
		VMUL.F32 S2,S1,S1;
		
sine	VDIV.F32 S1,S1,S11; calculating the value of sin x
		VADD.F32 S0,S0,S1;  
		VMUL.F32 S1,S2,S1;  Series calculation
		MUL R10,R11,R9;  Factorial calculation
		ADD R11,R11,#2; incrementing the factorial variable by 2
		ADD R9,R9,#2;  incrementing the factorial variable by 2
		
		VNEG.F32 S1,S1;  Negate the value of register S1
		VMOV.F32 S11, R10;  Moving the content of register R10 to S11
		VCVT.F32.U32 S11,S11; Converting floating point to unsigned decimal
		ADD R1,R1,#1;  incrementing the counter
		CMP R1,#10;  Comparing the counter value
		BNE sine 
	
		MOV R12, #3;  
		MOV R6, #4;
		VLDR.F32 S5, =1;
		VMOV.F32 S15, S2;
		VNEG.F32 S15,S15; Creating x^2 term
		VMOV.F32 S6,S15;
		VLDR.F32 S11, =2;
		MOV R1,#0;
		
cos	VDIV.F32 S6,S6,S11;  Computing cosx term
		VADD.F32 S5,S5,S6;  Cos series calculation
		VMUL.F32 S6,S6,S2;  Calculating temp variable
		MUL R10,R12,R6;  
		VMOV.F32 S11, R10;
		VCVT.F32.U32 S11,S11;
		VNEG.F32 S6,S6;   Converting to negative number
		ADD R12,R12,#2;
		ADD R6,R6,#2;
		ADD R1,R1,#1; incrementing the counter
		CMP R1,#10;   Comparing the value of counter variable with n
		BNE cos
		
		VDIV.F32 S17,S0,S5; Final value of tanx is stored in this variable

stop    B stop ; stop program
	ENDFUNC
	END
