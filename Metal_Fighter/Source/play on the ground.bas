SPEED 13                                    'play on the ground
    MOVE G6A,  83, 115,  88, 112, 114,
    MOVE G6D,  86, 117,  82, 116, 115,
    MOVE G6B, 100, 167, 175,  ,  ,
    MOVE G6C, 100, 169, 178,  ,  ,
    WAIT
    FOR x= 1 TO 3
        MOVE G6A,  75, 102,  99, 117, 118,
        MOVE G6D,  99, 119,  67, 128, 105,
        MOVE G6B, 135, 167, 175,  ,  ,
        MOVE G6C,  75, 169, 178,  ,  ,
        WAIT
        MOVE G6A,  99, 119,  67, 128, 105,
        MOVE G6D,  75, 102,  99, 117, 118,
        MOVE G6B,  75, 167, 175,  ,  ,
        MOVE G6C, 135, 169, 178,  ,  ,
        WAIT
    NEXT x
    MOVE G6A,  89, 109,  96, 111, 109,
    MOVE G6D,  91, 109,  94, 115, 109,
    MOVE G6B, 103, 100, 101,  ,  ,
    MOVE G6C, 104, 104, 101,  ,  ,
    WAIT
    MOVE G6A,  89, 109,  96, 111, 109,
    MOVE G6D,  91, 109,  94, 115, 109,
    MOVE G6B, 188, 101, 102,  ,  ,
    MOVE G6C, 188, 103, 101,  ,  ,
    WAIT
    FOR x= 1 TO 2
        MOVE G6A,  78, 116,  83, 115, 109,
        MOVE G6D, 100, 135,  53, 123, 111,
        MOVE G6B, 152,  16,  29,  ,  ,
        MOVE G6C, 188,  11,  30,  ,  ,
        WAIT
        MOVE G6A,  89, 109,  96, 111, 109,
        MOVE G6D,  91, 109,  94, 115, 109,
        MOVE G6B, 188, 101, 102,  ,  ,
        MOVE G6C, 188, 103, 101,  ,  ,
        WAIT
        MOVE G6A, 100, 135,  53, 123, 111,
        MOVE G6D,  78, 116,  83, 115, 109,
        MOVE G6B, 188,  11,  30,  ,  ,
        MOVE G6C, 156,  16,  29,  ,  ,
        WAIT
        MOVE G6A,  89, 109,  96, 111, 109,
        MOVE G6D,  91, 109,  94, 115, 109,
        MOVE G6B, 188, 101, 102,  ,  ,
        MOVE G6C, 188, 103, 101,  ,  ,
        WAIT
    NEXT x
    MOVE G6A, 101, 103, 110, 102,  99,
    MOVE G6D, 100, 102, 108, 104,  99,
    MOVE G6B, 100,  31,  80,  ,  ,
    MOVE G6C, 101,  31,  81,  ,  ,
    WAIT
