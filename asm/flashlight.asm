; Changes samus' x-ray scope into a flashlight.
; Flashlight angle depends on samus' velocity

lorom

!absmask = $7fff
!negmask = $8000
!speedx = TODO
!speedy = TODO
!xray_angle = $0A82
!neg_angle_mask = $0080
!max_angle = $007f

; Set x-ray angle based on samus speed.
SETANGLE:
    ; Get the quadrant angle in X
    JMP SETQANGLE
    ; Determine quadrant (up or down)
    LDA !yspeed
    AND !negmask
    CMP #$0000
    BNE .up ; y-speed negative means moving up -> upper quadrant
    ; y-speed positive means bottom quadrant -- need to subtract X from the max angle
    ; (for upper quadrant, no action is required)
    ; Temporarily store quadrant angle in ram
    TXA
    STA $12
    CLC
    LDA !max_angle
    SBC $12
    TAX
    .up
    ; Determine quadrant (left or right)
    LDA $0A1E
    AND #$00FF
    CMP #$0004
    TXA ; going to store angle in A now
    BNE .right
    ; If it was left, need to or in the negative bit
    ORA !neg_angle_mask
    .right
    ; Finally, write it out to x-ray angle in RAM
    STA !xray_angle
    RTS

; Helper: Compute the angle within the first quadrant
; Leaves the qangle in X
SETQANGLE:
    LDA !speedx
    AND !absmask
    ; x-speed is zero?
    CMP #$0000
    BNE .nonxzero
    ; if y-speed is also zero, default is straight ahead $0040.
    ; Top routine will use samus' facing to set the negative
    LDA !speedy
    AND !absmask
    CMP #$0000
    BNE .nonyzero
    LDX #$0040
    RTS
    .nonyzero:
    ; X holds the quadrant angle. In this case since samus is moving vertically, the quadrant angle is zero
    LDX #$0000
    RTS
    .nonxzero:
    ; If y-speed is zero, quadrant angle is $0040
    LDA !speedy
    AND !absmask
    CMP #$0000
    BNE .nonxyzero
    LDX #$0040
    RTS
    ; They're both nonzero -- do something interesting
    .nonxyzero:
    TODO

; set x-ray angle to defaults based on samus facing
SETFACE:
    LDA $0A1E
    AND #$00FF
    CMP #$0004
    BEQ .isleft
    LDA #$0040
    STA !xray_angle
    RTS
    .isleft
    LDA #$00C0
    STA !xray_angle
    RTS

