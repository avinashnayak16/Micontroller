//Note: regiser is used immediatestore is 16 to 31 only*ldi r16 ,$64  ; it is taking hex value , LDI IS immedeate value store in register
/*ldi r17 , 64  ; it is convert dec to hex then store in register 
LDS R10 , 0X0100  ; load from directly from memory
STS 0X0200 , R10  ; store directly register to memory
LDS R10 , 0X0101
STS 0X0201 , R10
LDS R10 , 0X0102
STS 0X0202 , R10
LDS R10 , 0X0103
STS 0X0203 , R10
LDS R10 , 0X0104
STS 0X0204 , R10
LDS R10 , 0X0105
STS 0X0205 , R10*/

/*LDS R10 , 0X0105
STS 0X0205 , R10
LDS R10 , 0X0105
STS 0X0205 , R10
LDI R16,0X03
LDI R17,0X03
ADD R16 ,R17 ; add the two register and store as r16 <- r16 + r17 
//PROGRAM TO ADD
LDI R16,0XFF
LDI R17,0X02
LDI R18,0X03
LDI R19,0X01
ADD R18 ,R16
ADC R19 ,R17  ; add with carry bit/*

//PROGRAM TO ADD FROM MEMORY 
LDI R16 , $FF
LDI R17 , $FF
LDI R18 , $FF
STS 0X0100 , R16
STS 0X0101 , R17
STS 0X0102 , R18
LDS R16,0X0100
LDS R17,0X0101
LDS R18 , 0X0102

ADD R17 ,R16
ADC R19 , R0
CLC   ; is used to clear carry bit
ADD R18, R17 
ADC R19 , R0

STS 0X0103, R19
STS 0X0104, R18

ldi r16 , $10
inc r16  ; increase by 1
DEC R16  ; decrese by 1

LDS R10, 0X0100
INC R10
STS 0X0200 ,R10
LDS R10, 0X0101
INC R10
STS 0X0201 ,R10
LDS R10, 0X0102
INC R10
STS 0X0202 ,R10
LDS R10, 0X0103
INC R10
STS 0X0203 ,R10
LDS R10, 0X0104
INC R10
STS 0X0204 ,R10
*//*
ldi r16 , 0x012
lds r16, 0x012*/
//LD and ST are used to indirect load or store
//POINTER REGISTER   we are used pointer as x =( r27, r26 ) , y = (r29 , r28) , z = (r31 , r30)
/*LDI R27, 0X01   ; X-->0X0100
LD R0 , X
LD R1, X+  ; first done the work then increment by 1
LD R2, X+
LD R3, -X  ; first decrement by 1 then duo the work
// INCREMENT IN INDIRECT 
LDI R27 , 0X01
LD R0 , X+    ; load to register from pointer locating
INC R0
LDI R29 , 0X02
ST Y+ , R0  ; store to pointer locating address
/*
LD R0 , X+
INC R0
ST Y+ , R0

LD R0 , X+
INC R0
ST Y+ , R0
LD R0 , X+
INC R0
ST Y+ , R0
LD R0 , X+
INC R0
ST Y+ , R0

//ADD IMMEDIATE VALUE TO PAIR TO REGISTER
LDI R25 , 0X01
LDI R24 ,0XFF
ADIW R25 :R24 , 0X02*/
/*
//COPY  
MOV RO , R2 ; it is used to copy same data

//ROTATE THE CONTENT OF THE REGISTER R0 TO R3
LDS R0 , 0X0100
LDS R1 , 0X0101
LDS R2 , 0X0102
LDS R3 , 0X0103

//Note: Always one or two instruction run after DDR set or else not taking the input
MOV R4 , R3
MOV R3, R2
MOV R2, R1
MOV R1 , R0
MOV R0 , R4*/
//MAKE PORT B OUT
/*LDI R16 , 0XFF   ; when ddr is high then port will be output 
OUT DDRB , R16  ; MAKE PORT IS OUTPUT
LDI R17 , 0X55
OUT PORTB , R17*/

//MAKE PIN C AS INPUT
//
/*LDI R16 , 0X00
OUT DDRC , R16 ; MAKE PORT C AS INPUT PORT  
//after completing input pin then put value in in pin before next instruciton run
LDI R16 , 0XFF
OUT DDRB , R16 ; MAKE PORT B AS OUTPUT PORT
IN  R16,PINC
OUT PORTB , R16  */


//READ TWO NUMBER , ONE FROM PORTB AND ONE FROM MEM. 0X0100, ADD THEM THEN SEND IT TO PORT C
/*LDI R16 , 0X00
OUT DDRB , R16 
LDI R16 , 0XFF
OUT DDRC , R16 
IN  R17,PINB  ; taking input from pin b
LDS R2, 0X0100
ADD R2, R17
OUT PORTC , R2*/  ; port c as output 

//the given is even or odd
/*LDI R20 ,$61
LSR R20  ; right shift
BRCS NEXT ; if carry is one (1) then only 
LDS R10 ,0X00
RJMP LAST ; direct rjmp

NEXT:
  LDI R17 , $FF 
  STS 0X0100, R17 
  LDS R10 ,0X0100
  NOP  ; end 

LAST:
  NOP*/

/*//COUNT NUMBER OF ONCE IN BYTES
LDI R17 ,$24
LDI R18 , $00
BACK :
  LSR R17
  BRLO NEXT  ; if lower bit set one or note : always use cpi if r0 < 0x01 then it true
  BREQ LAST   ; branch if equal
  RJMP BACK

NEXT :
  INC R18  
  RJMP BACK

LAST :
   NOP*/

/*//ASSEMBLER DIRECTOR 
.EQU COUNT =0X08 ; value assign
.EQU VALUE =0XB6
   LDI R17, COUNT 
   LDI R16 , VALUE 
BACK : LSR R16 
       BRSH NEXT   ;BRANCH IF C=0 or branch equal or higher value 1st 
	   INC R20     ; ELSE INCREMENT R20 
NEXT:  DEC R17 
       BRNE BACK ; not equal 
HERE : JMP HERE	    */

//ROTATE 16 BITS DATA 
/*LDI R17 , 0X00
LDI R16 , 0X85
RJMP NEW
CLC
ROR R17 ; rotate right
ROR R16
ROR R0
BRLO NEXT
NOP 
NEXT: OR R0, R17

NEW: CLC
LDI R17 , 0X00
LDI R16 , 0X85
ROR R17
ROR R16 
ROR R0
OR R17 , R0*/ 
 
//REVERSE THE ARRAY USING STACK 
/*LDI R17 , 0X20
LDI R16 , 0X00
LDI R21, 01
LOOP: LDI R20 ,R21+
      STS 0X0200, R20 
	  CPI R21, */
/*.EQU COUNT =10
LDI R27 , 0X02
 LDI R26 , 0X00
 LDI R16 , 0X50
 OUT SPL , R16 
 LDI R16, 0X02
 OUT SPH , R16 
 LDI R17 , COUNT
LOOP: LD R0 ,X+	  
	  PUSH R0
	  DEC R17
	  BRNE LOOP
NOP
*/
/*.EQU COUNT =10
LDI R27 , 0X02
 LDI R26 , 0X51
 LDI R16 , 0XFF
 OUT SPL , R16 
 LDI R16, 0X01
 OUT , SPH , R16 
 LDI R17 , COUNT
  
 BACK : POP R0 
        ST -X , RO 
		DEC R17 
		BRNE BACK 
HERE : RJMP HERE		 
*/
//addition of two 16 bits
/*LDI R16 , $02
LDI R17 , $03
MOV R3 , R16
MOV R4 , R17
LDS  R5 , 0X301
LDS R6, 0X300
SUB R5 , R3
SBC R6 , R4  ; subtract with carry
STS 0X401 , R6
STS 0X400 , R5
ROL R0    ; rotate left
STS 0X402 , R0*/

//note: when rotate left the right most bit will be store in carry and carry data is tranfer to last most bit

//MULTIPLY 16 BIT DATA NUMBER IN MEM LOC 0X301 AND 0X300 WITH CONTENTS OF RC STORE RESULT IN 0X400 , 0X401 , 0X402
/*LDI R16 , $FF
MOV R6 , R16 
LDS R3, 0X300
LDS R4, 0X301
MUL R3, R6  ; RESULT STORE R1, R0
STS 0X400 ,R0
ADC R5, R1
MUL R4 , R6  ; RESULT STORE R1, R0
ADC R0 ,R5   ; add with carry
STS 0X401, R0
STS 0X402, R1  */
      
//WRITE WAP TO LOAD LOWER NIBBLE OF ONE REGISTER TO ANOTHER BOTH HIGHER AND LOWER NIBBLE SAME  AS REGISTER
; SWAP R26 IS SWAP THE NIBBLE (04 TO 40)
/*LDI R16, $F4
ANDI R16 , $0F  ; and with immediate
MOV R17 , R16
SWAP R17     ; the swap higher nibble to lower and lower to higher
OR R17 , R16
*/
//SWAP HIGHER BITS OR NIBBLE LOAD IN R16 ,// WAP TO STORE THE COMPLEMENT OF HIGHER NIBBLLE OF R16 IN LOWER NIBBLE OF R16
/*LDS R17 , 0X300
MOV R0 , R17
ANDI R17 ,$F0
SWAP R17 
COM R17 ; compliment
ANDI R17 , $0F
LDI R16 , $45
ANDI R16 , $F0
OR R16 ,R17
MOV R17 , R0*/
// OPPOSITE
/*LDS R17 , 0X300
MOV R0 , R17
ANDI R17 ,$0F
SWAP R17 
COM R17 
ANDI R17 , $F0
LDI R16 , $45
ANDI R16 , $0F
OR R16 ,R17
MOV R17 , R0*/

/*LDS R17 , 0X300
COM R17
SWAP R17 */

//Store n natural number from 0x0201 onwards and read n from 0x0200
/*LDS R0, 0X0200
LDI R17 , $01
LDI R26 , 0X01
LDI R27, 0X02
BACK : ST X+ ,R17
       INC R17
       DEC R0
	   BRNE BACK*/

//PERFORM LINEAR SEARCH IN AN ARRAY OF N ELEMENTS COUNT THE NUMBER OF OCCURENCES , READ ARRAY SIZE FRO M 0X0200 , KEY FROM PORT A AND READ THE COUNT TO PORT B
/*LDS R0, 0X0200 ; NUMBER OF ELEMENT OR ARRAY SIZE
LDI R26 , 0X01  ; X LOCATE 
LDI R27 , 0X02
LDI R16 , 0X00  ; TO PORTA AS IN
OUT DDRA , R16  //PORT A INPUT
IN R17, PINA
LDI R19 , 0X00
BACK : LD R16, X+
      DEC R0
      CP R16,R17 
	  BRNE NEXT
	  INC R19
	  MOV R2, R0 
	  BRNE BACK 
LDI R20 , 0XFF
OUT DDRB , R20
OUT PINB , R19
NOP

NEXT :RJMP BACK */

//LARGEST NUMBER IN PORTB AND SMALLEST IN PORTA
//bUBBLE SORT       

//Program t generate N Fibonascci numbers where N is read from 0x0200 and store the Fib series from 0x0201 onwards 
/*LDI R16 ,$0
LDI R17 , $1
STS 0X0201,R16
STS 0X0202,R17
LDI R26 , 0X03
LDI R27 ,0X02
LDS R0 , 0X0200
SUBI RO, 0X02
BACK : MOV R1 , R17
       ADD R17 , R16
	   MOV R16 , R1
	   ST  X+, R17
	   DEC R0
	   BRNE BACK; 
	   NOP 
 */
//Program t generate N Fibonascci numbers UP TO  N is read from 0x0200 and store the Fib series from 0x0201 onwards 

/* R16 ,$0
LDI R17 , $1
STS 0X0201,R16
STS 0X0202,R17
LDI R26 , 0X03
LDI R27 ,0X02
LDS R3 , 0X0200
BACK : MOV R1 , R17
       ADD R17 , R16
	   MOV R0 , R3
	   SUB R0 , R17
	   BRMI LOOP; 
	   MOV R16 , R1
	   ST  X+, R17
	   RJMP BACK;
LOOP: NOP */

// WAP TO CHECK IF  LOWER NIBBLE OF R20 IS GREATER THAN UPPER NIBBLE IF SO SET THE CARRY FLAG BIT ELSE CLEAR IT
/*LDI R20 , 0X45
MOV R16 , R20 
ANDI R20 ,0X0F
ANDI R16 , 0XF0
SWAP R16 
SUB R16 , R20
BRPL LAST
SEC
NOP

LAST: CLC 

LDI R20 , 0X45
MOV R16 , R20 
ANDI R20 ,0X0F
ANDI R16 , 0XF0
SWAP R16 
CP R16 , R20
BRLO LAST
SEC
NOP

LAST: CLC */
//WAP TO ADD BIT 3 OF POARTA WITH BIT 4 OF R20. STORE THERESULT IN BIT 5 OF PORTB
/*LDI R16, 0X00
OUT DDRA , R16 

LDI R20 , $10
BST R20 , 4
BLD R20 , 4
IN R16 , PINA
BST R16 , 3
BLD R16 , 3


ADD R16,R20
BST R16, 5
BLD R16 , 5

LDI R20 , 0XFF
OUT DDRB , R20
OUT PORTB , R16
LDI R16 , 0X00
OUT DDRA , R16  ; SET PORTA AS INPUT


LDI R16 , 0XFF
OUT DDRB , R16  ; SET PORTB AS OUTPUT

LDI R16 , 1<<6
OUT SREG , R16
BLD R20 , 4
IN R21, PIN4
LSL R21
ADD R20 , R21
LSL R20
OUT PORTB,R20*/

//WAP AN ALP TO PUT A RANDOM NUMBER NUMBER IN R16 , AND R17 , INCREMENT R16 AND DECREMENT UNTIL THEY ARE EQUAL NOTE:R16  IS ALWAYS LESSER TAHN R17
/*LDI R16 ,$04
LDI R17 ,$08
LOOP: INC R16 
      CP R16 , R17 
	  BREQ LAST 
	  DEC R17 
	  CP R16 , R17 
	  BREQ LAST
	  RJMP LOOP
LAST : NOP
*/
//to count odd and even number in array 
//bubble sort 
//max and min of 2nd largest 
//program to rotate 8 bit 
//swap the array
//sum of  all odd and even 
//count number of odd and even in array
//indicates odd is more 
//store odd and even other memory location

//program to rotate 8 bit 
/*LDI R16 , $21
LDI R17 , 00
LDI R20 , 00
ROR R16 
ADC R20, R17
ROR R20 
ROR 20
OR R16 , R20*/
/*//ROTATE RIGHT
LDI R16, $01
ROR R16
ROR R0
OR R16, R0
//ROTATE LEFT
LDI R16, $02
ROL R16
ROL R0
OR R16,R0*/


/*
//MAX IN R16 , AND MIN IN R20
LDI R16, $FF  ; MIN VALUE IN R16 
LDI R20,$00   ; MAX IN VALUE IN R20
LDS R17, 0X0100  ; SIZE OF ARRRAY 
LDI R27 , 0X01   ; 
LDI R26 , 0X01

LOOP : LD R0, X+
       DEC R17
	   BREQ HERE
       CP R0 , R16
	   BRLO NEXT
	   CP R20,R0
	   BRLO LAST
	   CPI R17,0X00 
	   RJMP LOOP
	  
NEXT : MOV R16 , R0
       RJMP LOOP 

LAST : MOV R20 , R0
       RJMP LOOP 
HERE : NOP
*/
/*LDI R16, $FF  
LDI R20,$00
LDS R17, 0X0100
LDI R27 , 0X01
LDI R26 , 0X01

LOOP : LD R0, X+
       CP R0 , R16
	   BRLO NEXT
	   CP R20,R0
	   BRLO LAST
	   CPI R17,0X00
	   DEC R17
	   BREQ HERE 
	   RJMP LOOP
	  
NEXT : MOV R16 , R0
       DEC R17 
       RJMP LOOP 

LAST : MOV R20 , R0
       DEC R27
       RJMP LOOP 
HERE : NOP*/

//COMPARE M WITH ARRAY THEN COUNT LESSER THAN COUNT
/*.DEF COUNT = R10
.EQU NUM =0X00
LDS R17, 0X0100  ; N VAUE
LDS R18 , 0X0101 ; M VALUE
LDI R27 , 0X01
LDI R26 , 0X02

LOOP : LD R0, X+
       CP R0 , R18
	   BRLO NEXT
	   DEC R17
	   BREQ HERE 
	   RJMP LOOP
	  
NEXT : INC R9
       DEC R17 
	   BREQ HERE
       RJMP LOOP 

HERE : NOP*/

/*//Bubble sort
LDI R26 , 0X01  ; X POINTER
LDI R27, 0X01
LDI R28 , 0X02  ; Y POINTER 
LDI R29, 0X01
LDS R0 , 0X0100 ; ARRAY SIZE IN RO

LOOP: 


SWAPPING: LD R3, X
		  LD R4 , Y
		  MOV R1, R0 
		  CP R4, R3
		  BRLO SWAP_NUM

SWAP_NUM: MOV R5, R3
		  MOV R4, R3
		  MOV R5, R3
		  INC X
		  INC Y

//store odd and even other memory location
LDS R0,0X0100; ARRAY SIZE
LDI R26 , 0X01  ; X POINTER
LDI R27, 0X01
LDI R28 , 0X01  ; Y POINTER FO EVEN 
LDI R29, 0X02
LDI R30 , 0X01  ; Z POINTER FO ODD 
LDI R31, 0X03

LOOP : LD R1 ,X+ ; COPY X LOCATION DATA
	   LSR R1
	   BRCS ODD
	   ST Z+,R1
	   DEC R0
	   BRNE LOOP
	   NOP

ODD : ST Z+,R1
      DEC R0
	  RJMP LOOP

//COUNT odd and even other memory location
LDS R0,0X0100; ARRAY SIZE
LDI R26 , 0X01  ; X POINTER
LDI R27, 0X01  ; 
LDI R28 , 0X00  ;COUNT ODD
LDI R29 , 0X00; COUNT EVEN

LOOP : LD R1 ,X+ ; COPY X LOCATION DATA
	   LSR R1
	   BRCS ODD
	   INC R29
	   DEC R0
	   BRNE LOOP
	   NOP

ODD : INC R28
      DEC R0
	  RJMP LOOP

//indicates odd is more 
LDS R0,0X0100; ARRAY SIZE
LDI R26 , 0X01  ; X POINTER
LDI R27, 0X01  ; 
LDI R28 , 0X00  ;COUNT ODD
LDI R29 , 0X00; COUNT EVEN

LOOP : LD R1 ,X+ ; COPY X LOCATION DATA
	   LSR R1
	   BRCS ODD
	   INC R29
	   DEC R0
	   BRNE LOOP
	   RJMP HERE

ODD : INC R28
      DEC R0
	  RJMP LOOP
HERE: CP R28, R29
      BRLO HERE

//sum of  all odd and even
LDS R0,0X0100; ARRAY SIZE
LDI R26 , 0X01  ; X POINTER
LDI R27, 0X01  ; 
LDI R28 , 0X00  ;COUNT ODD
LDI R29 , 0X00; COUNT EVEN

LOOP : LD R1 ,X+ ; COPY X LOCATION DATA
       MOV R2,R1
	   LSR R1
	   BRCS ODD
	   ADD R29 ,R2
	   DEC R0
	   BRNE LOOP
	   NOP

ODD : ADD R28, R2
      DEC R0
	  RJMP LOOP
	  */

/*//Bubble sort
.DEF TEMP=R10

LDI R26,$00
LDI R27,$02
LD R16,X+
MOV R3,R16
MOV R18,R3
DEC R3
MOV R8,R3
MOV R31,R3


LOOP2:
	LDI R26,$01
	LDI R27,$02
	LDI R28,$02
	LDI R29,$02
	DEC R18
	BREQ END
	MOV R3,R8

LOOP: 

		LD R16,X
		LD R17,Y
		CP R17,R16
		BRLO SWAPPER
PT:		LD R31,X+
		LD R31,Y+
		DEC R3
		BREQ LOOP2
		RJMP LOOP


SWAPPER: 
		MOV TEMP,R17
		MOV R17,R16
		MOV R16,TEMP
		ST Y,R17
		ST X,R16
		RJMP PT 

END: NOP*/
//5.Write an ALP to insert/delete an element in the position of x of an array of n 
//numbers where x<n.
/*LDS R0, 0X0100 ; N 
LDI R17 , 0X04; VALUE OF INSERT

LDI R26, 0X01  ; X LOCATE
LDI R27,0X01
LD R1, X
CP R1,R0 ; CHECKING X<N
BRLO HERE;
ST X, R17
NOP

HERE : NOP*/

/*//BUBBLE SORT
.EQU COUNT=R0
LDS COUNT,0X0100

LOCATE: LDI R26, 0X01   ; LOCATE X POINTER TO 
		LDI R27, 0X01
		LDI R28, 0X02   ; LOCATE Y POINTER TO 
		LDI R29, 0X01
		DEC COUNT 
		BREQ END

*/

//WRITE AN ALP TO SEPERATE ODD AND EVEN NO. 
//READ THE ARRAY SIZE FROM 0X0100. 
//ARRAY STARTS FROM ADDRESS 0X0101 ONWARDS STORE ODD NUMBERS FROM MEMORY LOC 0X0200 
//EVEN FROM MEMO LOC 0X0300
/*
LDI R16, 0x0100     ; Load address of array size
LD R17, X           ; Load array size from memory location
LDI R18, 0x0101     ; Load base address of array
LDI R19, 0x0200     ; Load base address of odd numbers
LDI R20, 0x0300     ; Load base address of even numbers
LDI R21, 0          ; Initialize loop counter
LDI R22, 0          ; Initialize index for odd array
LDI R23, 0          ; Initialize index for even array

SEPARATE_NUMBERS:
    LD R24, X+        ; Load byte from array
    TST R24           ; Test if byte is zero
    BRNE CHECK_ODD    ; If not zero, it's odd, so check odd
    RJMP STORE_EVEN   ; If zero, it's even, so store in even numbers

CHECK_ODD:
    SBRS R24, 0       ; Skip next instruction if LSB is not set
    RJMP STORE_ODD    ; If LSB is set, the number is odd, so store in odd numbers
    RJMP STORE_EVEN   ; If LSB is not set, the number is even, so store in even numbers

STORE_ODD:
    ST Y+, R24        ; Store the odd number at the next available memory location
    INC R22           ; Increment index for odd array
    RJMP CONTINUE_SEPARATION

STORE_EVEN:
    ST Z+, R24        ; Store the even number at the next available memory location
    INC R23           ; Increment index for even array

CONTINUE_SEPARATION:
    INC R21           ; Increment loop counter
    CP R21, R17       ; Comparing loop counter with array size
    BRNE SEPARATE_NUMBERS ; If loop counter is not equal to array size, continue separating

END_LOOP:
*/

//Q.2_PLACE ANY NO.IN INTERNAL RAM LOCATION 0X0234 AND 
//INCREMENT IT UNTIL THE NUMBER EQUALS 2A
LDI R16, 0x0234  ; Load address of internal RAM location
LDI R17, 0x18    ; Load initial value
LDI R18, 0x2A    ; Load target value

STS R16, R17     ; Place initial number in internal RAM location

INCREMENT_LOOP:
    CP R17, R18         ; Compare current value with target value
    BREQ END_LOOP    ; If equal, end the loop

    INC R17             ; Increment number
    STS R16, R17        ; Store updated number in internal RAM location
    RJMP INCREMENT_LOOP

END_LOOP: