//GEnarate square wave on PB.5 using timer0 while at the same  time 
//tranfer the data from portc to portd
/*
.INCLUDE "M32DEF.INC"
.ORG	0X0 ; LOCATION FRO RESET 
		JMP MAIN
.ORG	0X16 ; LOC, FOR TIMER0 OVER 
		JMP T0_OV_ISR

; --------MAIN PROGRAM FRO INITILAIZTION 
.ORG	0x100
MAIN :	LDI R20 , HIGH(RAMEND)
	`	OUT SPH , R20 
		LDI R20 , LOW(RAMEND)
	`	OUT SPL , R20
		SBI DDRB , 5  ; SET Portb b as output
		LDI R20 , 0
		OUT DDRC , R20 ; set portc as input
		LDI R20 , 0XFF
		OUT DDRD , R20 ; set portb as ouput

; --------interrupt initialization
		LDI R20 , (1<<TOIE0)
		OUT TIMSK , R20 
		SEI

;-------timer0 initialisation
		LDI R20 , -32
		OUT TCNT0, R20
		LDI R20 , 0X01
		OUT TCCR0, R20

HERE :  IN R20 , PINC
		OUT PORTD , R20 
		JMP HERE

;------------ISR  for timer 0
.ORG 0X200
T0_OV_ISR:
		IN R16 , PORTB 
		LDI R17 , 0X20
		EOR R16 , R17   ; TOGGLE PB.5 VPIN 
		OUT PORTB ,R16 
		LDI R20 , -32   ; RELOAD THE count value in tcnt0
		OUT TCNT0 , R20 
		RETI*/


//genrate the square wave on pb.1 and  pb.7 using timer0 and timer 1
//while at rhe same time transfer the data from to portc to portd
/*
.INCLUDE "M32DEF.INC"
.ORG	0X0 ; LOCATION FRO RESET 
		JMP MAIN
.ORG	0X12 ; LOC, FOR TIMER1 OVER 
		JMP T1_OV_ISR
.ORG	0X16 ; LOC, FOR TIMER0 OVER 
		JMP T0_OV_ISR

; --------MAIN PROGRAM FRO INITILAIZTION 
.ORG	0x100
MAIN :	LDI R20 , HIGH(RAMEND)
	`	OUT SPH , R20 
		LDI R20 , LOW(RAMEND)
	`	OUT SPL , R20
		SBI DDRB , 1  ; SET Portb b as output
		SBI DDRB , 7  ; SET Portb b as output
		LDI R20 , 0
		OUT DDRC , R20 ; set portc as input
		LDI R20 , 0XFF
		OUT DDRD , R20 ; set portb as ouput

; --------interrupt initialization
		LDI R20 , (1<<TOIE0) | (1<<TOIE1)
		OUT TIMSK , R20 
		SEI

;-------timer0 initialisation  AND timer1
		LDI R20 , -160   ; value of 20us
		OUT TCNT0, R20
		LDI R20 , 0X01
		OUT TCCR0, R20

		LDI R20 , HIGH(-640)
		OUT TCNT1H, R20
		LDI R20 , LOW(-640)
		OUT TCNT1L, R20
		LDI R20 , 0X00
		OUT TCCR1A, R20
		LDI R20 , 0X01
		OUT TCCR1B, R20

HERE :  IN R20 , PINC
		OUT PORTD , R20 
		JMP HERE

;------------ISR  for timer 0
.ORG 0X200
T0_OV_ISR:
		IN R16 , PORTB 
		LDI R17 , 0X02
		EOR R16 , R17   ; TOGGLE PB.1 VPIN 
		OUT PORTB ,R16 
		LDI R20 , -160   ; RELOAD THE count value in tcnt0
		OUT TCNT0 , R20 
		RETI

;------------ISR  for timer 1
.ORG 0X300
T1_OV_ISR:
		IN R16 , PORTB 
		LDI R17 , 0X80
		EOR R16 , R17   ; TOGGLE PB.7 VPIN 
		OUT PORTB ,R16 
		LDI R20 , HIGH(-640)  ;  ; RELOAD THE count value in tcnt0
		OUT TCNT1H, R20
		LDI R20 , LOW(-640)
		OUT TCNT1L, R20 
		RETI
*//*
//WRITE PROGRAMMING TO TIMER0 IN CTC MODE in interrupts
.INCLUDE "M32DEF.INC"
.ORG	0X0 ; LOCATION FRO RESET 
		JMP MAIN
.ORG	0X14 ; LOC, FOR TIMER0 OVER 
		JMP T0_CM_ISR

; --------MAIN PROGRAM FRO INITILAIZTION 
.ORG	0x100
MAIN :	LDI R20 , HIGH(RAMEND)
	`	OUT SPH , R20 
		LDI R20 , LOW(RAMEND)
	`	OUT SPL , R20
		LDI r20 , 39
		OUT OCR0 ,R20
		SBI DDRB , 1  ; SET Portb b as output
		SBI DDRB , 7  ; SET Portb b as output
		LDI R20 , 0
		OUT DDRC , R20 ; set portc as input
		LDI R20 , 0XFF
		OUT DDRD , R20 ; set portb as ouput

; --------interrupt initialization
		LDI R20 , (1<<TOIE0) | (1<<TOIE1)
		OUT TIMSK , R20 
		SEI

;-------timer0 initialisation  AND timer1
		LDI R20 , -160   ; value of 20us
		OUT TCNT0, R20
		LDI R20 , 0X01
		OUT TCCR0, R20

		

HERE :  IN R20 , PINC
		OUT PORTD , R20 
		JMP HERE

;------------ISR  for timer 0
.ORG 0X200
T0_CM_ISR:
		IN R16 , PORTB 
		LDI R17 , 0X20
		EOR R16 , R17   ; TOGGLE PB.1 VPIN 
		OUT PORTB ,R16 
		RETI

*/
//programming timer0 in ctc mode using interrupts
/*
.INCLUDE"M32DEF.INC"
.ORG	0X00 ;LOCATION FOR RESET
	JMP MAIN
.ORG	0X14 ;LOCATION FOR TIMER0 COMPARE MATCH
	JMP T0_CM_ISR

;MAIN PROGRAM FOR INITIALISATION AND KEEPING CPU BUSY
.ORG	0X100
MAIN:	LDI R20, HIGH(RAMEND)
		OUT SPH, R20
		LDI R20, LOW(RAMEND)
		OUT SPL, R20
		LDI R20, 39
		OUT OCR0, R20	;OCR0=39
		LDI R20, 0X09
		OUT TCCR0, R20	;START TIMER0
		SBI DDRB, 5	;PB5 AS AN OUTPUT
		LDI R20, (1<<OCIE0)	 ;TIMER0 COMPARE MATCH
		OUT TIMSK, R20
		SEI
		LDI R20, 0X00
		OUT DDRC, R20
		LDI R20, 0XFF
		OUT DDRD, R20
HERE:	IN R20, PINC 
		OUT PORTD, R20
		RJMP HERE

;------ISR FOR TIMER0
.ORG 0X300
T0_CM_ISR:
		IN R16, PORTB
		LDI R17, 0X20
		EOR R16, R17
		OUT PORTB, R16
		RETI*/

//External interrupt INT0 connected to switch and its toggle
//and led connected to pc.3 whenever switch goes low
.INCLUDE"M32DEF.INC"
.ORG	0X00 ;LOCATION FOR RESET
	JMP MAIN
.ORG	0X02 ;LOCATION FOR TIMER0 
	JMP EX0_ISR

;MAIN PROGRAM FOR INITIALISATION AND KEEPING CPU BUSY
.ORG	0X100
MAIN:	LDI R20, HIGH(RAMEND)
		OUT SPH, R20
		LDI R20, LOW(RAMEND)
		OUT SPL, R20
		SBI DDRC , 3
		SBI PORTD , 2
		LDI R20 , 1<<INT0
		OUT GICR , R20 
		LDI R20 , 0X02
		OUT MCUCR , R20 
		SEI
HERE:	RJMP HERE

;------ISR FOR TIMER0
.ORG 0X300
EX0_ISR:
		IN R16, PINC
		LDI R17, 0X08
		EOR R16, R17
		OUT PORTC, R16
		RETI