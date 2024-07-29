//Array adding
/*lds r0, 0x0100
ldi r26,0x00  ; x pointer
ldi r27,0x02
ldi r28,0x00 ; y pointer
ldi r29,0x03
ldi r30,0x00 ; z pointer
ldi r31,0x04

loop: ld r1, x+
      ld r2, y+
	  add r1,r2
	  st z+,r1
	  dec r0
	  brne loop+
//odd number between m and n
lds r1, 0x0250  ; m value 
lds r2,0x0251  ; n value 
ldi r17, 0x02
ldi r26,0x52  ; x pointer
ldi r27,0x02 
mov r0, r1
lsr r1
brcs loop
ldi r16, 0x01
add r0 , r16

loop: st x+, r0
	  add r0, r17
	  cp r0, r2
	  brlo loop
	  rjmp last 
last: nop

lds r1, 0x08  ; m value 
ldi r17, 0x02
ldi r26,0x50  ; x pointer
ldi r27,0x02 
lsr r1
brcs loop
ldi r16, 0x01
add r0 , r16

loop: st x+, r0
	  add r0, r17
	  cp r0, r2
	  brlo loop
	  rjmp last 
last: nop


*/
ldi R27,0x00
ldi R26,0x02;X
ldi R16,0x05
mov r17, r16

loop :
       st x+,R16
	   mul R17,R16
	   dec R16
	   brne loop
	   nop
