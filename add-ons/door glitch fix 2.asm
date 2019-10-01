lorom


; door scroll fix by Black_Falcon v1.1

; - v1.1 fixes several issues related to me being bad at coding half a century ago.
; NOTE: Fixing doors going DOWN into a room requires them to be in a green scroll, going into a blue scroll
;       Fixing doors going UP into a room requires them to be in a blue scroll, going into a green scroll
;
; if there are any other issues, feel free contact me on the metconst discord

!posScreenSubx	= $090F
!posScreenSuby = $0913
!posScreenx = $0911
!posScreeny = $0915

!posSamusx = $0AF6
!posSamusy = $0AFA

!transitionType = $0791         ; Current room transition direction. 0 = right, 1 = left, 2 = down, 3 = up. +4 = Close a door on next screen
!corrSamusPosRight = #$0060     ; amount of pixels to correct Samus' offset based on direction
!corrSamusPosLeft = #$0060      ; these are just values that worked for me during testing
!corrSamusPosDown = #$0060      ; can be changed if necessary
!corrSamusPosUp = #$0060  
	
org $82DE32	: JSR FREE										;hijacking the transition routine
org $82F710
{ ; Fix screen position to prevent glitches

FREE:
    STA !transitionType
    PHX
	STA !transitionType : AND #$0003 : ASL : TAX : JMP (JUMPFIXSCROLL,x)
    
JUMPFIXSCROLL:
    DW FIXSCROLL     ; right
    DW FIXSCROLL     ; left
    DW FIXSCROLLDOWN     ; down
    DW FIXSCROLL       ; up
    
FIXSCROLL:
    LDA !posScreenx : AND #$FF00 : STA !posScreenx					;cuts out low bytes of the coordinates
	LDA !posScreeny : AND #$FF00 : STA !posScreeny
    BRA OUT
FIXSCROLLDOWN:
    LDA !posScreenx : AND #$FF00 : STA !posScreenx					;cuts out low bytes of the coordinates
	LDA !posScreeny : AND #$FF00 : ORA #$001F : STA !posScreeny     ;special correction related to downwards transitions
    BRA OUT
OUT:
	STZ !posScreenSubx : STZ !posScreenSuby							;get rid of subpixel coords
    PLX
	RTS
}

org $8FEA00													
{ ; Samus Position fix based on transition, put this as door asm pointer.
	LDA !transitionType : AND #$0003 : ASL : TAX : JMP (JUMPFIXPOS,x)
    
JUMPFIXPOS:
    DW FIXPOSRIGHT
    DW FIXPOSLEFT
    DW FIXPOSDOWN
    DW FIXPOSUP
    
FIXPOSRIGHT:
	LDA !posSamusx : CLC : ADC !corrSamusPosRight : STA !posSamusx : RTS
FIXPOSLEFT:
	LDA !posSamusx : SEC : SBC !corrSamusPosLeft : STA !posSamusx : RTS
FIXPOSDOWN:
    LDA !posSamusy : CLC : ADC !corrSamusPosDown : STA !posSamusy : RTS
FIXPOSUP:
    LDA !posSamusy : SEC : SBC !corrSamusPosUp : STA !posSamusy : RTS
}




	
	
	
	
	
	
	
	
	
	
	
	