lorom


;door scroll fix by Black_Falcon
;This finally gets rid of this stupidly annoying door scroll glitch by simply correcting messed up data during the transition that would otherwise cause 
;an annoying graphical glitch that coulf otherwise only be fixed if the game is reloaded from a save

!screensubx = $090F
!screensuby = $0913
!screenx = $0911
!screeny = $0915
!samusx = $0AF6
!samusy = $0AFA

    
org $82DE32 : JSR FREE                                      ;hijacking the transition routine
org $82F710

FREE:
    STA $0791 : CMP #$0002 : BCS .a                           ;skip if vertical transition is happening
    LDA !screenx : AND #$FF00 : STA !screenx                    ;cuts out low bytes of the coordinates
    LDA !screeny : AND #$FF00 : STA !screeny
    STZ !screensubx : STZ !screensuby                           ;get rid of subpixel coords
.a
    RTS
    
org $8FEA00                                                 ;put this as door asm pointer!
    LDA $0791 : BEQ .b
    CMP #$0001 : BNE .c
    LDA !screenx : SEC : SBC #$0068 : STA !samusx           ;hardcoded, but should work
    BRA .c
.b
    LDA !screenx : CLC : ADC #$0068 : STA !samusx
.c
    RTS





    
    
    
    
    
    
    
    
    
    
    
    
