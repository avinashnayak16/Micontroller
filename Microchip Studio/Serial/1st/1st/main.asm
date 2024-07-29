//Write the alp transfer char "A"  serailly at the baud rate
//9600 with 8 bit data no parity and one  stop bit
/*.INCLUDE "M32DEF.INC"
	LDI R21 , HIGH(RAMEND)   // initialise high byte of sp 
	OUT SPH , R21
	LDI R21 , LOW(RAMEND)   // initialise LOW byte of sp 
	OUT SPL , R21



	LDI R16 , (1<<TXEN)   // Enable tranmitter
	OUT UCSRB , R16
	LDI R16 , (1<<UCSZ1)|(1<<UCSZ0)|(1<<URSEL)  // 8 BIT DATA  , NO PARITY ,  
	OUT UCSRC , R16
	LDI R16 , 0X33 // 9600 BAUD
	OUT UBRRL , R16 

AGAIN : SBIS UCSRA , UDRE  // IS UDR Empty?
		RJMP AGAIN		//WAIT MORE
		LDI R16 , '$'	//SEND A
		OUT UDR , R16  //TO UDR 
		RJMP AGAIN		//AGAIN OR REPEAT */

/*
//Write the alp transfer char "ABC"  serailly at the baud rate
//9600 with 8 bit data no parity and one  stop bit
.INCLUDE "M32DEF.INC"
	LDI R21 , HIGH(RAMEND)   // initialise high byte of sp 
	OUT SPH , R21
	LDI R21 , LOW(RAMEND)   // initialise LOW byte of sp 
	OUT SPL , R21


	LDI R16 , (1<<TXEN)   // Enable tranmitter
	OUT UCSRB , R16
	LDI R16 , (1<<UCSZ1)|(1<<UCSZ0)|(1<<URSEL)  // 8 BIT DATA  , NO PARITY ,  
	OUT UCSRC , R16
	LDI R16 , 0X33 // 9600 BAUD
	OUT UBRRL , R16 

STRING : LDI R16 , 'K'	//SEND A
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'L'	//SEND B
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'E'	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , ' '	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'T'	//SEND A
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'E'	//SEND B
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'C'	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'H'	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , ' '	//SEND A
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'S'	//SEND B
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , ' '	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'Y'	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'U'	//SEND A
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'V'	//SEND B
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , 'I'	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		LDI R16 , ' '	//SEND C
		CALL AGAIN		//AGAIN OR REPEAT
		RJMP STRING

AGAIN : SBIS UCSRA , UDRE  // IS UDR Empty?
		RJMP AGAIN		//WAIT MORE
		OUT UDR , R16  //TO UDR 
		RET*/

//Write the alp transfer char "A"  serailly at the baud rate
//9600 with 8 bit data no parity and one  stop bit
.INCLUDE "M32DEF.INC"
	LDI R21 , HIGH(RAMEND)   // initialise high byte of sp 
	OUT SPH , R21
	LDI R21 , LOW(RAMEND)   // initialise LOW byte of sp 
	OUT SPL , R21
	LDI R20 , 0XFF
	OUT DDRB , R20 

	LDI R16 , (1<<RXEN)   // Enable tranmitter
	OUT UCSRB , R16
	LDI R16 , (1<<UCSZ1)|(1<<UCSZ0)|(1<<URSEL)  // 8 BIT DATA  , NO PARITY ,  
	OUT UCSRC , R16
	LDI R16 , 0X33 // 9600 BAUD
	OUT UBRRL , R16 

AGAIN : SBIS UCSRA , RXC  // IS RXC Empty?
		RJMP AGAIN		//WAIT MORE
		IN R16 , UDR  //TO UDR
		OUT PORTB , R16 
		RJMP AGAIN		//AGAIN OR REPEAT

//WRITE AN AVR program with following

//a) send the "YES"  once to pc screen 
//b) get data from switches on port A tranmit it via serial port to the pc's screen 
//c) receive any key press sent by hyperterminal and put it on leds
//the program must do parts (a) and (a) reapeatedly