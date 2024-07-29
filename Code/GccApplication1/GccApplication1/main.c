#include <avr/io.h>
#include <avr/interrupt.h>

// Define buzzer pin
#define BUZZER_PIN PD0

// Initialize external interrupt on INT0 (PD2)
void init_interrupt() {
	// Set INT0 to trigger on the rising edge
	MCUCR |= (1<<ISC01) | (1<<ISC00);
	// Enable INT0 interrupt
	GICR |= (1<<INT0);
	// Enable global interrupts
	sei();
}

// ISR for INT0
ISR(INT0_vect) {
	// Turn on the buzzer
	PORTD |= (1<<BUZZER_PIN);
}

int main(void) {
	// Set BUZZER_PIN as output
	DDRD |= (1<<BUZZER_PIN);
	// Initialize the interrupt
	init_interrupt();

	while (1) {
		// Main loop does nothing, interrupt handles the buzzer
	}

	return 0;
}
