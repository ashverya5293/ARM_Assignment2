       ;Exponential Series
  	    AREA    appcode ,CODE,READONLY
        EXPORT __main
        ENTRY
__main    FUNCTION
		
        MOV R0,#15;Holding the Number of Terms in Series 'n'
        MOV R1,#1;Counting Variable 'i'
				
		LDR R3,= 0x00000001 ; Used to store the final sum of the exponent
	    VMOV.F S0,R3 ; 
	    VCVT.F32.U32 S0,S0
	   
	    LDR R4,= 0x00000001 ; Temp variable to store intermediate multiplication result
	    VMOV.F S1,R4 ; 
	    VCVT.F32.U32 S1,S1
	   
	    LDR R5,= 0x00000004 ; Value of X
	    VMOV.F S2,R5 ; 
	    VCVT.F32.U32 S2,S2
	   
	    LDR R6,= 0x00000001 ; Temp variable to store factorial
	    VMOV.F S6,R6 ; 
	    VCVT.F32.U32 S6,S6
				
loop1    CMP R1,R0; Compare values of 'i' and 'n' 
        BLE loop; if i < n goto LOOP
        B stop;else goto stop
		
loop    VMUL.F32 S1,S1,S2; temp = temp*x
		VMOV.F32 S3,S1;
        VMOV.F32 S5,R1; Moving bitstream from register R1 to floating register S5
        VCVT.F32.U32 S5, S5;Converting bitstream into floating point number
		
		VMUL.F32 S6,S6,S5
        VDIV.F32 S3,S3,S6;Divide temp by factorial S6 and store it back in temp
        VADD.F32 S0,S0,S3;Final Sum
		
        ADD R1,R1,#1;Increment the counter variable 'i'
        B loop1;Again goto comparision
		
stop    B stop
        ENDFUNC
        END