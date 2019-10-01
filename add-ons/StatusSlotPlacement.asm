lorom

;This asm helps you changing the position of the item slots in the status screen
;no 100% guarantee it'll move everything properly, there might be a few things that still need to be moved in a hex editor
;more info can be found here: https://jathys.zophar.net/supermetroid/kejardon/EquipmentDisassembly.txt

!PTR_cursorPositions = $82C196
!PTR_tilemapPositions = $82C06C

org !PTR_cursorPositions	{
    ;  ___X___  ___Y___
    ;  |     |  |     |
    ;[Reserve]      cursor positions
    DW  $001B,   $0054 ;[auto]/[manual]
    DW  $001B,   $005C ;reserve tank
    ;	[BEAMS]	==> C19E
    DW  $0030,   $0084 ;charge
    DW  $0030,   $008C ;ice
    DW  $0030,   $0094 ;spazer
    DW  $0030,   $009C ;spazer
    DW  $0030,   $00A4 ;plasma
    	; [SUITS] ==> C1B2
    DW  $00CC,   $004C ;varia
    DW  $00CC,   $0054 ;gravity
    	; [MISC.] ==> C1CA
    DW  $00CC,   $006C ;morph ball
    DW  $00CC,   $0074 ;bombs
    DW  $00CC,   $007C ;spring ball
    DW  $00CC,   $0084 ;screw attack
    	; [BOOTS]
    DW  $00CC,   $009C ;high-jump
    DW  $00CC,   $00A4 ;Space jump
    DW  $00CC,   $00AC ;speed booster
}
org !PTR_tilemapPositions     ;Positions of tilemaps for enabled items
    ;[Beams]
    ;   C       W      I      S      P
    DW $3C08, $3C48, $3C88, $3CC8, $3D08
    ;[SUITS]
    ;   VS      GS
    DW $3A6A, $3AAA
    ;[MISC.]
    ;   MB    BMB    SB      SA
    DW $3B6A, $3BAA, $3BEA, $3C2A
    ;[BOOTS]
    ;   HJ     sJ     SB
    DW $3CEA, $3D2A, $3D6A








