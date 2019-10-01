LoRom

; Edit animation definitions for morph

org $92D613 ;00
DB #$00, #$E8, #$AF ; 0xAF:E800 -- Zoa tiles
DW #$0200, #$0200

org $92D62F ;04
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92D61A ;01
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92D636 ;05
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92D621 ;02
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92D63D ;06
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92D628 ;03
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92D644 ;07
DB #$00, #$E8, #$AF
DW #$0200, #$0200

;;

org $92CBEE ;00
DB #$00, #$E8, #$AF
DW #$0200, #$0200

org $92CCD5 ;01
DB #$00, #$E8, #$AF
DW #$0200, #$0200

; Replace Gravity suit palette with Zoa palette
org $9B9800
DW #$3800, #$72FA, #$55B0, #$2845, #$1801, #$6210, #$496B, #$38C6, #$2C63, #$1D79, #$1933, #$150E, #$10C8, #$3BE0, #$2680, #$1580

; Replace spritemaps:
; 1
org $92BAB3
DW #$0001

DW #$C3F8 ; it's a 2x2 sprite
DB #$F8
DW #$2800

;DW #$81F8
;DB #$F8
;DW #$2100

; 2
org $92BAE3
DW #$0001

DW #$C3F8
DB #$F8
DW #$2802

; 3
org $92BABF
DW #$0001

DW #$C3F8
DB #$F8
DW #$2804

; 4
org $92BAFE
DW #$0001

DW #$C3F8
DB #$F8
DW #$2806

; 5
org $92BACB
DW #$0001

DW #$C3F8
DB #$F8
DW #$2800

; 6
org $92BB0A
DW #$0001

DW #$C3F8
DB #$F8
DW #$2802

; 7
org $92BAD7
DW #$0001

DW #$C3F8
DB #$F8
DW #$2804

; 8
org $92BB16
DW #$0001

DW #$C3F8
DB #$F8
DW #$2806

