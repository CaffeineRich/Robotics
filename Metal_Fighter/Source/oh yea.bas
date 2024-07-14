  SPEED 9                                   'oh yea
    MOVE G6A, 101, 101,  98, 119, 101,
    MOVE G6D, 101,  97, 102, 119,  97,
    MOVE G6B, 100, 102,  99,  ,  ,
    MOVE G6C,  98, 104, 102,  ,  ,
    WAIT
    HIGHSPEED SETON
    SPEED 14
    MOVE G6A,  95,  95, 109, 116, 105,
    MOVE G6D, 106,  94, 111, 115,  91,
    MOVE G6B,  99, 146,  12,  ,  ,
    MOVE G6C, 101,  44, 188,  ,  ,
    WAIT
    HIGHSPEED SETOFF
    SPEED 9
    MOVE G6A, 101, 101,  98, 119, 101,
    MOVE G6D, 101,  97, 102, 119,  97,
    MOVE G6B, 100, 102,  99,  ,  ,
    MOVE G6C,  98, 104, 102,  ,  ,
    WAIT
    HIGHSPEED SETON
    SPEED 14
    MOVE G6A, 107,  93, 111, 115,  90,
    MOVE G6D,  95,  94, 105, 120, 108,
    MOVE G6B, 101,  44, 188,  ,  ,
    MOVE G6C,  99, 146,  12,  ,  ,
    WAIT
    HIGHSPEED SETOFF
    SPEED 9
    MOVE G6A, 101, 101,  98, 119, 101,
    MOVE G6D, 101,  97, 102, 119,  97,
    MOVE G6B, 100, 102,  99,  ,  ,
    MOVE G6C,  98, 104, 102,  ,  ,
    WAIT
    SPEED 14
    FOR x=1 TO 2
        MOVE G6A, 100, 171,  26, 117,  98,
        MOVE G6D, 101, 134,  26, 149,  99,
        MOVE G6B, 104, 154,  12,  ,  ,
        MOVE G6C, 106,  51, 188,  ,  ,
        WAIT
        MOVE G6A, 101, 134,  26, 149, 100,
        MOVE G6D, 100, 171,  26, 117,  99,
        MOVE G6B, 106,  51, 188,  ,  ,
        MOVE G6C, 104, 154,  12,  ,  ,
        WAIT
    NEXT x
    MOVE G6A, 101, 101,  98, 119, 101,
    MOVE G6D, 101,  97, 102, 119,  97,
    MOVE G6B, 104, 100,  99,  ,  ,
    MOVE G6C, 105, 100,  99,  ,  ,
    WAIT

    SPEED 14
    FOR x=1 TO 3
        MOVE G6A, 100, 119,  77, 119,  99,
        MOVE G6D, 102, 117,  76, 121,  98,
        MOVE G6B, 105, 128,  41,  ,  ,
        MOVE G6C, 105, 128,  41,  ,  ,
        WAIT
        MOVE G6A, 101, 101,  98, 119, 101,
        MOVE G6D, 101,  97, 102, 119,  97,
        MOVE G6B, 104, 154,  12,  ,  ,
        MOVE G6C, 105, 152,  13,  ,  ,
        WAIT
    NEXT x
    MOVE G6A, 101, 101,  98, 119, 101,
    MOVE G6D, 101,  97, 102, 119,  97,
    MOVE G6B, 105,  32,  73,  ,  ,
    MOVE G6C, 104,  27,  79,  ,  ,
    WAIT
