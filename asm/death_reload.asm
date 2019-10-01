; Instead of dying, on reaching 0 energy you're set back to full energy and reload from where you entered the room.
; Credit to Black_Falcon for the Door Glitch fix that allows the scrolls to work properly
lorom

; Macros
!screensubx = $090F
!screensuby = $0913
!screenx = $0911
!screeny = $0915
!samusx = $0AF6
!samusy = $0AFA

; Where to save the flag and samus' subpos
!samusdied = $7ED890
!samussavex = $7ED892
!samussavey = $7ED894

org $82DBA2 ; Hijack and replace samus at 0 energy routine. Instead of setting frozen time, do my stuff!
JSR WHENDIE
;RTS         ; Skip the other stuff
org $82DBAC
LDA #$0009  ; Set game state to 0x9 instead of 0x13

; Hijack the place samus routine $82:E3C0
;org $82E3C5
;JSR LOADPOS
;org $82E3E5
;JSR SAVEPOS

org $82F800
WHENDIE:
    ; First, reset samus' energy to max
    LDA $09C4
    STA $09C2
    ; Then, set the game state to 9 (entering a door)
    ;LDA #$0009
    ;STA $0998
    ; Then, set the flag that samus died:
    ; the door transition code will load her position instead of using the door.
    RTS

; If samus died, load her position from memory and unset died
LOADPOS:
    LDA !samusdied
    CMP #$0000
    BEQ .nodie
    LDA !samussavex
    STA !samusx
    LDA !samussavey
    STA !samusy
    ; If this is a regular door transition, don't do anything
    .nodie:
    LDA $0AF6 ; Reload samus X (hijack fixup)
    RTS

; Save samus' position to memory (Happens regardless)
SAVEPOS:
    LDA !samusx
    STA !samussavex
    LDA !samusy
    STA !samussavey
    STZ $0931   ; Door transition finished scrolling (hijack fixup)
    
