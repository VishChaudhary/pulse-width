;
; pulse_width.asm.asm 
;
; Created: 10/13/2021 2:46:07 PM
; Author : vish75000 
; Target: AVR128DB48    


; Replace with your application code
start:
ldi r16, 0xFF           ;load r16 with all 1s
out VPORTD_DIR, r16     ;configure VPORTD as output

again:
    ldi r16, 0x00       ;load r16 with all 0s
    sbic VPORTA_IN, 7   ;wait for a 0 in pin 7 of VPORTA
    rjmp again          ;if 1 loop to again

leading_edge: 
sbis VPORTA_IN, 7       ;wait for a 1 in pin 7 of VPORTA
rjmp leading_edge       ;if 0 loop to leading_edge

trailing_edge:
inc r16                 ;incremenet r16 by 1
sbic VPORTA_IN, 7       ;wait for a 0 in pin 7 of VPORTA
rjmp trailing_edge      ;if 1 loop to trailing_edge
com r16                 ;complement values of r16
out VPORTD_OUT, r16     ;output value to LED
rjmp again              ;jump to again

 






