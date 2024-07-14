
'================================================
' 로키20090909
'================================================

'================================================
' 변수 선언문
DIM A AS BYTE
DIM i AS BYTE
DIM MODE AS BYTE
DIM 모션_mode AS BYTE

'================================================
'동시제어 설정
PTP SETON 				'단위그룹별 점대점동작 설정
PTP ALLON				'전체모터 점대점 동작 설정

'================================================
' 각 그룹별 모터 방향 선택

DIR G6A,1,0,0,1,0,0		'왼쪽발
DIR G6D,0,1,1,0,1,0		'오른쪽발
'==================
DIR G6B,1,1,1,1,1,1		'왼쪽팔
DIR G6C,0,0,0,0,0,0		'오른쪽팔

DELAY 500				'초기시간지연
'================================================
' 초기위치 피드백 (1:피드백받음, 0:받지않음 )
GETMOTORSET G6A,1,1,1,1,1,0
GETMOTORSET G6B,1,1,1,0,0,0
GETMOTORSET G6C,1,1,1,0,0,0
GETMOTORSET G6D,1,1,1,1,1,0
'================================================

모션_mode = 0
'================================================
'속도 1 ~ 15, "hihghspeed seton" 선언후 * 3배
SPEED 5
'================================================
'사운드 "도레미"
TEMPO 230
MUSIC "cde"
'================================================
'서보모터사용선언
MOTOR G24
'================================================
GOSUB 기본자세

'메인루틴으로 가기
GOTO INIT_CONECT
''**********************************************
' 초기 START 버튼을 누르면 메인루틴으로
INIT_CONECT:

    ERX 115200, A, INIT_CONECT

    IF A <> 16  THEN GOTO INIT_CONECT

    MUSIC "cegceg"

    'GOSUB 팔떨기 'START 버튼이면 인사를 한번

    GOTO MAIN


MAIN:

    ERX 115200, A, MAIN

    ON A GOTO MAIN,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40

    GOTO MAIN
    '*******************************************
    '		MAIN_RF 라벨로 가기
    '*******************************************
KEY1: '▲
    IF MODE =0 THEN
        GOSUB  전진하기
    ENDIF

    GOTO MAIN
KEY2: '▶

    IF MODE =0 THEN
        GOSUB 오른쪽턴
    ENDIF	
    GOTO MAIN
KEY3: '▼
    IF MODE =0 THEN
        GOSUB 뒤로후진
    ENDIF
    GOTO MAIN
KEY4: '◀
    IF MODE =0 THEN
        GOSUB 왼쪽턴
    ENDIF
    GOTO MAIN
KEY5: '△
    ' HIGHSPEED SETON
    SPEED 15

    MOVE G6A,  99,  84, 141,  83, 100,
    MOVE G6D,  99,  84, 141,  83, 100,
    MOVE G6C,  12, 105,  99,  ,  ,
    WAIT

    MOVE G6A,  99,  84, 141,  83, 100,
    MOVE G6D,  99,  84, 141,  83, 100,
    MOVE G6C,  14, 188,  96,  ,  ,
    WAIT
    MOVE G6A,  99,  84, 141,  83, 100,
    MOVE G6D,  99,  84, 141,  83, 100,
    MOVE G6C,  12, 105,  99,  ,  ,
    WAIT

    GOSUB 기본자세
    ' HIGHSPEED SETOFF


    GOTO MAIN
KEY6: '○
    IF MODE = 0 THEN
        GOSUB 오른옆으로
    ENDIF


    GOTO MAIN


KEY7:
SPEED 15
MOVE G6A,  99,  94, 111, 113, 100,  
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 106,  92,  39,  ,45  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT





    GOTO MAIN
KEY8: '□
    IF MODE = 0 THEN
        GOSUB 왼쪽옆으로
    ENDIF


    GOTO MAIN
KEY9: 'L2
MOVE G6A,  99,  94, 111, 113, 100,  
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 106,  92,  39,  ,45  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT
MOVE G6A,  99, 123,  69, 129, 101,  
MOVE G6D, 100, 121,  71, 125,  99,  
MOVE G6B, 107,  44,  98,  ,  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT 
MOVE G6B, 107,  44,  98,  ,145  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT
MOVE G6A,  99,  94, 111, 113, 100,  
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 106, 119,  12,  ,  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT
MOVE G6A,  99,  94, 111, 113, 100,  
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 107, 152,  12,  ,  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT
MOVE G6A,  99,  94, 111, 113, 100,  
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 102, 101, 100,  ,  ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT
MOVE G6A,  99,  94, 111, 113, 100,  
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 102, 101, 100,  , 45 ,  
MOVE G6C, 101,  32,  81,  ,  , 100
WAIT

    GOSUB 기본자세






    GOTO MAIN
KEY10: 'R2
    '아래에 있는 불록
        SPEED 12
    MOVE G6D,  89,  94, 111, 113, 110,
    MOVE G6A,  89,  94, 111, 113, 110,
    MOVE G6C, 100,  40,  80,  ,  ,
    'MOVE G6B,180,  12, 55
    WAIT
MOVE G6A,  70,  99, 102, 118, 109,  
MOVE G6D, 108, 135,  49, 133, 115,  
MOVE G6B, 102,  46,  88,  ,  ,  
MOVE G6C, 100,  40,  80,  ,  , 100
WAIT

    WAIT
    SPEED 15
    MOVE G6D, 108, 135,  49, 128, 115,
    MOVE G6A,  70,  99, 102, 113, 109,
    MOVE G6C, 100,  65,  90,  ,  ,
    'MOVE G6B,180,  12, 55
    WAIT
    MOVE G6D, 108, 135,  49, 128, 115,
    MOVE G6A,  70,  99, 102, 113, 109,
    MOVE G6C, 100,  40,  80,  ,  ,
    'MOVE G6B,180,  12, 55
    WAIT
    SPEED 12
    MOVE G6A,  89,  94, 111, 113, 110,
    MOVE G6D,  89,  94, 111, 113, 110,
    'MOVE G6B,180,  12, 55
    MOVE G6C, 100,  40,  80,  ,  ,
    WAIT





GOSUB 기본자세 


    GOTO MAIN
KEY11: 'L1
    '미세 오른쪽
    'SPEED 12
    '    MOVE G6A,  99,  95, 111, 110, 100,
    '    MOVE G6D,  99,  94, 111, 113, 100,
    '    MOVE G6B, 108,  98,  43,  ,,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '    MOVE G6A, 100, 112,  81, 123, 103,
    '    MOVE G6D, 100, 110,  80, 125, 100,
    '    MOVE G6B, 103,  60,  82,  ,  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '
    '    DELAY 500
    '    MOVE G6A, 100, 112,  81, 123, 103,
    '    MOVE G6D, 100, 110,  80, 125, 100,
    '    MOVE G6B, 103,  60,  82,  ,130  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '    SPEED 9
    '    MOVE G6A,  99,  95, 111, 110, 100,
    '    MOVE G6D,  99,  94, 111, 113, 100,
    '    MOVE G6B, 108, 148,  12,  ,  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '    SPEED 12
    '    MOVE G6A,  99,  95, 111, 110, 100,
    '    MOVE G6D,  99,  94, 111, 113, 100,
    '    MOVE G6B, 104, 102, 100,  ,  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '    MOVE G6A,  99,  95, 111, 110, 100,
    '    MOVE G6D,  99,  94, 111, 113, 100,
    '    MOVE G6B, 188, 102, 100,  ,  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '
    '
    '    MOVE G6A,  99,  95, 111, 110, 100,
    '    MOVE G6D,  99,  94, 111, 113, 100,
    '    MOVE G6B, 152,  12, 101,  ,  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '    MOVE G6A,  99,  95, 111, 110, 100,
    '    MOVE G6D,  99,  94, 111, 113, 100,
    '    MOVE G6B, 152,  12, 101,  ,50  ,
    '    MOVE G6C, 100,  30,  80,  ,  , 100
    '    WAIT
    '
    '    GOSUB 기본자세


    SPEED 10
    MOVE G6A,  80, 133,  50, 154, 118,
    MOVE G6D,  80, 133,  50, 154, 118,
    'MOVE G6B, 150,  12,  60,  ,  ,
    MOVE G6C, 100,  35,  80,  ,  ,
    WAIT


    SPEED 15
    'MOVE G6B, 150,  12,  60,  ,  ,
    MOVE G6C,  12,  40, 100,  ,  ,
    WAIT
    'MOVE G6B, 150,  12,  60,  ,  ,
    MOVE G6C,  12, 140, 100,  ,  ,
    WAIT

    'MOVE G6B, 150,  12,  60,  ,  ,
    MOVE G6C,  12,  40, 100,  ,  ,
    WAIT
    GOSUB 기본자세





    GOTO MAIN

KEY12: 'R1
    '위에 있는 블록
    SPEED 10
    MOVE G6D, 90,  90, 120, 105, 110, 100	
    MOVE G6A,100,  76, 146,  93, 107, 100	
    MOVE G6C,100,  40, 85
    'MOVE G6B,100,  40
    WAIT

    SPEED 15
    MOVE G6D, 102,  76, 147, 93, 100, 100
    MOVE G6A,83,  78, 140,  96, 115, 100
    MOVE G6C,100,  60, 80
    'MOVE G6B,100,  40
    WAIT

    SPEED 12
    MOVE G6D,98,  76, 146,  93, 100, 100
    MOVE G6A,98,  76, 146,  93, 100, 100
    MOVE G6C,100,  30, 80
    'MOVE G6B,100,  40
    WAIT

    SPEED 15	

    GOSUB 기본자세

    GOTO MAIN
KEY13: 'SELECT
    IF MODE =0 THEN
        MOVE G6A,  99,  94, 111, 113, 100,
        MOVE G6D,  99,  94, 111, 113, 100,
        WAIT
    ENDIF
    GOTO MAIN
KEY14: 'L-PUSH

    '자빠졌을때
    SPEED 12
    MOVE G6A, 101, 161,  32,  18,  99,
    MOVE G6D, 101, 160,  30,  18,  99,
    MOVE G6B,  99,  98, 101,  ,  ,
    MOVE G6C, 101,  97,  99,  ,  ,
    WAIT
    MOVE G6B,  12,  98, 101,  ,  ,
    MOVE G6C,  14,  97,  99,  ,  ,
    WAIT
    MOVE G6A, 105, 166,  29,  39,  99,
    MOVE G6D,  99, 162,  29,  40,  99,
    MOVE G6B,  20, 144,  10,  ,  ,
    MOVE G6C,  14,  97,  12,  ,  , 100
    WAIT
    MOVE G6A, 101, 166,  31,  58, 100,
    MOVE G6D, 103, 162,  30,  61,  95,
    MOVE G6B,  23,  77,  23,  ,  ,
    MOVE G6C,  15,  12,  97,  ,  , 100
    WAIT
    MOVE G6A, 102, 166,  29,  69, 100,
    MOVE G6D,  99, 162,  29,  70,  98,
    MOVE G6B,  53,  77,  24,  ,  ,
    MOVE G6C,  56,  14,  98,  ,  , 100
    WAIT
    MOVE G6A,  99, 166,  28, 121, 100,
    MOVE G6D,  99, 162,  28, 123, 100,
    MOVE G6B,  93,  40,  92,  ,  ,
    MOVE G6C,  94,  20,  93,  ,  , 100
    WAIT

    GOSUB 기본자세

    GOTO MAIN
KEY15: 'R-PUSH
    '엎었을때
    SPEED 15
    MOVE G6A, 102, 166,  30, 160, 100,
    MOVE G6D, 100, 162,  32, 158,  98,
    MOVE G6B, 104,  98, 100,  ,  ,
    MOVE G6C, 106, 100, 103,  ,  , 100
    WAIT
    MOVE G6A, 102, 166, 100, 157, 100,
    MOVE G6D, 100, 162, 102, 155,  98,
    MOVE G6B, 188, 102, 102,  ,  ,
    MOVE G6C, 188, 100, 102,  ,  , 100
    WAIT
    MOVE G6A,  97, 147,  94, 157,  99,
    MOVE G6D, 104, 148,  94, 155,  98,
    MOVE G6B, 188,  97,  50,  ,  ,
    MOVE G6C, 188, 100,  12,  ,  , 100
    WAIT
    MOVE G6A,  95, 131,  94, 158,  99,
    MOVE G6D, 103, 134,  86, 157, 110,
    MOVE G6B, 188,  45,  50,  ,  ,
    MOVE G6C, 188,  37,  57,  ,  , 100
    WAIT
    MOVE G6A, 101, 166,  35, 160, 100,
    MOVE G6D, 101, 162,  38, 158,  98,
    MOVE G6B, 188,  13,  97,  ,  ,
    MOVE G6C, 174,  11,  97,  ,  , 100
    WAIT
    MOVE G6A, 101, 164,  29, 143,  98,
    MOVE G6D, 103, 162,  29, 140,  97,
    MOVE G6B, 148,  13,  98,  ,  ,
    MOVE G6C, 149,  11,  98,  ,  , 100
    WAIT
    MOVE G6A, 100, 166,  28, 120, 100,
    MOVE G6D, 101, 162,  28, 122,  98,
    MOVE G6B, 133,  13,  98,  ,  ,
    MOVE G6C, 134,  11,  98,  ,  , 100
    WAIT


    GOSUB 기본자세















    SPEED 12

    GOSUB 기본자세

    GOTO MAIN
KEY16: 'START

    GOTO MAIN
KEY17: '▲ + △
    IF MODE =0 THEN
        GOSUB 정면펀치
    ENDIF	
    GOTO MAIN
KEY18: '▲ + ○

    GOTO MAIN
KEY19: '▲ + X

    GOTO MAIN
KEY20: '▲ + □

    GOTO MAIN
KEY21: '▶ + △

    GOTO MAIN
KEY22: '▶ + ○
    IF MODE = 0 THEN
        GOSUB 우측공격
    ENDIF	
    GOTO MAIN
KEY23: '▶ + X

    GOTO MAIN
KEY24: '▶ + □
    IF MODE = 0 THEN
        GOSUB 앞으로일어나기
    ENDIF	

    GOTO MAIN
KEY25: '▼ + △

    GOTO MAIN
KEY26: '▼ + ○

    GOTO MAIN
KEY27: '▼ + X
    IF MODE =0 THEN
        '     GOSUB 양팔날개짓
    ENDIF	
    GOTO MAIN
KEY28: '▼ + □

    GOTO MAIN
KEY29: '◀ + △

    GOTO MAIN
KEY30: '◀ + ○

    IF MODE = 0 THEN
        GOSUB 뒤로일어나기
    ENDIF	

    GOTO MAIN
KEY31: '◀ + X

    GOTO MAIN
KEY32: '◀ + □
    IF MODE = 0 THEN
        GOSUB 좌측공격
    ENDIF	
    GOTO MAIN
KEY33: 'L2 + L2


    GOTO MAIN
KEY34: 'L1 + L1

    GOTO MAIN
KEY35: 'L1 + L2
    IF MODE = 0 THEN
        GOSUB 왼쪽편향펀치
    ENDIF	
    GOTO MAIN

KEY36: 'R1 + R2

    GOSUB 오른쪽편향펀치

    GOTO MAIN
KEY37: 'L2 + R1

    GOTO MAIN
KEY38: 'L1 + R2

    GOTO MAIN
KEY39: 'L1 + L2 + R1 + R2

    GOTO MAIN
KEY40: 'L-PUSH + R-PUSH

    GOTO MAIN


    '**************************************************
기본자세:
    SPEED 8
    MOVE G6A,  99,  95, 111, 110, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    MOVE G6B,  99, 188, 163,  ,55,
    MOVE G6C, 100,  30,  80,  ,  , 100
    WAIT



    mode = 0
    RETURN
    '**************************************************
굽힌자세:

    MOVE G6A, 99, 108,  88, 121, 100
    MOVE G6D, 99, 108,  88, 121, 100
    MOVE G6B, 100,  30, 90
    MOVE G6C, 100,  30, 90,120
    WAIT
    mode = 0
    SPEED 10
    RETURN
    '**************************************************
앉은자세:

    SPEED 10
    MOVE G6A,100, 151,  23, 140, 101, 100,
    MOVE G6D,100, 151,  22, 140, 101,
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80, 120,
    WAIT
    mode = 1
    RETURN
    '**************************************************
인사:
    SPEED 8
    MOVE G6A, 100,  58, 135, 150, 100, 100
    MOVE G6D, 100,  58, 135, 150, 100, 100
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76, 120 ,  ,
    WAIT
    DELAY 1000

    SPEED 10
    GOSUB 기본자세

    RETURN
    '************************************************


뒤로일어나기:


    SPEED 15
    MOVE G6A,100, 150, 170,  40, 100
    MOVE G6D,100, 150, 170,  40, 100
    MOVE G6B, 150, 150,  45
    MOVE G6C, 150, 150,  45
    WAIT

    SPEED 15
    MOVE G6A,  100, 155,  110, 120, 100
    MOVE G6D,  100, 155,  110, 120, 100
    MOVE G6B, 190, 80,  15
    MOVE G6C, 190, 80,  15
    WAIT


    SPEED 15	
    MOVE G6A,  100, 165,  25, 162, 100
    MOVE G6D,  100, 165,  25, 162, 100
    MOVE G6B,  155, 15, 90
    MOVE G6C,  155, 15, 90
    WAIT

    DELAY 50
    SPEED 12	
    MOVE G6A,  100, 150,  25, 162, 100
    MOVE G6D,  100, 150,  25, 162, 100
    MOVE G6B,  140, 15, 90
    MOVE G6C,  140, 15, 90
    WAIT


    SPEED 8
    MOVE G6A,  100, 138,  25, 155, 100
    MOVE G6D,  100, 138,  25, 155, 100
    MOVE G6B, 113,  30, 80
    MOVE G6C, 113,  30, 80
    WAIT

    DELAY 100
    SPEED 10
    GOSUB 기본자세

    RETURN
    '************************************************
앞으로눕기:

    SPEED 10
    MOVE G6A,100, 155,  25, 140, 100,
    MOVE G6D,100, 155,  25, 140, 100,
    MOVE G6B,130,  50,  85
    MOVE G6C,130,  50,  85
    WAIT

    SPEED 10
    MOVE G6A, 60, 165,  30, 165, 155,
    MOVE G6D, 60, 165,  30, 165, 155,
    MOVE G6B,170,  10, 100
    MOVE G6C,170,  10, 100
    WAIT

    SPEED 3
    MOVE G6A, 75, 165,  55, 165, 155,
    MOVE G6D, 75, 165,  55, 165, 155,
    MOVE G6B,185,  10, 100
    MOVE G6C,185,  10, 100
    WAIT

    SPEED 10
    MOVE G6A,100, 130, 120,  80, 110,
    MOVE G6D,100, 130, 120,  80, 110,
    MOVE G6B,125, 160,  10
    MOVE G6C,125, 160,  10
    WAIT	

    SPEED 12
    GOSUB 기본자세

    RETURN
    '**********************************************
앞으로일어나기:


    SPEED 15
    MOVE G6A,100, 15,  70, 140, 100,
    MOVE G6D,100, 15,  70, 140, 100,
    MOVE G6B,20,  140,  15
    MOVE G6C,20,  140,  15
    WAIT

    SPEED 12
    MOVE G6A,100, 136,  35, 80, 100,
    MOVE G6D,100, 136,  35, 80, 100,
    MOVE G6B,20,  30,  80
    MOVE G6C,20,  30,  80
    WAIT

    SPEED 12
    MOVE G6A,100, 165,  70, 30, 100,
    MOVE G6D,100, 165,  70, 30, 100,
    MOVE G6B,30,  20,  95
    MOVE G6C,30,  20,  95
    WAIT

    SPEED 10
    MOVE G6A,100, 165,  45, 90, 100,
    MOVE G6D,100, 165,  45, 90, 100,
    MOVE G6B,130,  50,  60
    MOVE G6C,130,  50,  60
    WAIT

    SPEED 10
    GOSUB 기본자세


    RETURN
    '******************************************
뒤로눕기:

    SPEED 10
    MOVE G6A,100, 165,  40, 100, 100,
    MOVE G6D,100, 165,  40, 100, 100,
    MOVE G6B,110,  70,  50
    MOVE G6C,110,  70,  50
    WAIT

    SPEED 10
    MOVE G6A,100, 165,  70, 15, 100,
    MOVE G6D,100, 165,  70, 15, 100,
    MOVE G6B,30,  20,  95
    MOVE G6C,30,  20,  95
    WAIT

    SPEED 15
    MOVE G6A,100, 126,  60, 50, 100,
    MOVE G6D,100, 126,  60, 50, 100,
    MOVE G6B,20,  30,  90
    MOVE G6C,20,  30,  90
    WAIT

    SPEED 10
    MOVE G6A,100, 10,  83, 140, 100,
    MOVE G6D,100, 10,  83, 140, 100,
    MOVE G6B,20,  130,  15
    MOVE G6C,20,  130,  15
    WAIT

    SPEED 10
    MOVE G6A,100, 10,  100, 115, 100,
    MOVE G6D,100, 10,  100, 115, 100,
    MOVE G6B,100,  130,  15
    MOVE G6C,100,  130,  15
    WAIT

    SPEED 10
    GOSUB 기본자세

    RETURN

    '******************************************************
앞으로덤블링:

    SPEED 15
    MOVE G6A,100, 155,  23, 140, 100, 100
    MOVE G6D,100, 155,  23, 140, 100, 100
    MOVE G6B,130,  30,  85
    MOVE G6C,130,  30,  85
    WAIT

    SPEED 10	
    MOVE G6A, 100, 165,  55, 165, 100, 100
    MOVE G6D, 100, 165,  55, 165, 100, 100
    MOVE G6B,185,  10, 100
    MOVE G6C,185,  10, 100
    WAIT

    SPEED 15
    MOVE G6A,100, 160, 110, 140, 100, 100
    MOVE G6D,100, 160, 110, 140, 100, 100
    MOVE G6B,140,  70,  20
    MOVE G6C,140,  70,  20
    WAIT

    SPEED 15
    MOVE G6A,100,  56, 110,  26, 100, 100
    MOVE G6D,100,  71, 177, 162, 100, 100
    MOVE G6B,170,  40,  70
    MOVE G6C,170,  40,  70
    WAIT

    SPEED 15
    MOVE G6A,100,  60, 110,  15, 100, 100
    MOVE G6D,100,  70, 120, 30, 100, 100
    MOVE G6B,170,  40,  70
    MOVE G6C,170,  40,  70
    WAIT

    SPEED 15
    MOVE G6A,100,  60, 110,  15, 100, 100
    MOVE G6D,100,  60, 110,  15, 100, 100
    MOVE G6B,190,  40,  70
    MOVE G6C,190,  40,  70
    WAIT
    DELAY 50

    SPEED 15
    MOVE G6A,100, 110, 100,  15, 100, 100
    MOVE G6D,100, 110, 100,  15, 100, 100
    MOVE G6B,190, 160, 115
    MOVE G6C,190, 160, 115
    WAIT

    MOVE G6A,100, 170,  70,  15, 100, 100
    MOVE G6D,100, 170,  70,  15, 100, 100
    MOVE G6B,190, 170, 120
    MOVE G6C,190, 170, 120
    WAIT

    HIGHSPEED SETON

    SPEED 5
    MOVE G6A,100, 170,  30,  110, 100, 100
    MOVE G6D,100, 170,  30,  110, 100, 100
    MOVE G6B,190,  40,  60
    MOVE G6C,190,  40,  60
    WAIT

    GOSUB 앉은자세

    HIGHSPEED SETOFF


    SPEED 10
    GOSUB 기본자세

    RETURN

    '**********************************************
뒤로덤블링:

    SPEED 15
    MOVE G6A,100, 170,  71,  23, 100, 100
    MOVE G6D,100, 170,  71,  23, 100, 100
    MOVE G6B, 80,  50,  70
    MOVE G6C, 80,  50,  70
    WAIT	

    MOVE G6A,100, 133,  49,  23, 100, 100
    MOVE G6D,100, 133,  49,  23, 100, 100
    MOVE G6B, 45, 116,  15
    MOVE G6C, 45, 116,  15
    WAIT

    SPEED 15
    MOVE G6A,100, 133,  49,  23, 100, 100
    MOVE G6D,100,  70, 180, 160, 100, 100
    MOVE G6B, 45,  50,  70
    MOVE G6C, 45,  50,  70
    WAIT


    SPEED 15
    MOVE G6A,100, 133, 180, 160, 100, 100
    MOVE G6D,100,  133, 180, 160, 100, 100
    MOVE G6B, 10,  50,  70
    MOVE G6C, 10,  50,  70
    WAIT

    HIGHSPEED SETON

    MOVE G6A,100, 95, 180, 160, 100, 100
    MOVE G6D,100, 95, 180, 160, 100, 100
    MOVE G6B,160,  50,  70
    MOVE G6C,160,  50,  70
    WAIT

    HIGHSPEED SETOFF

    MOVE G6A,100, 130, 120,  80, 110, 100
    MOVE G6D, 100, 130, 120,  80, 110, 100
    MOVE G6B,130, 160,  10
    MOVE G6C,130, 160,  10
    WAIT

    SPEED 6
    HIGHSPEED SETON

    MOVE G6A,100, 130, 120,  80, 110, 100
    MOVE G6D,100, 130, 120,  80, 110, 100
    MOVE G6B,150, 160,  10
    MOVE G6C,150, 160,  10
    WAIT

    MOVE G6A, 80, 155,  85, 150, 150, 100
    MOVE G6D, 80, 155,  85, 150, 150, 100
    MOVE G6B,185,  40, 60
    MOVE G6C,185,  40, 60
    WAIT

    MOVE G6A, 75, 165,  55, 165, 155, 100
    MOVE G6D, 75, 165,  55, 165, 155, 100
    MOVE G6B,185,  10, 100
    MOVE G6C,185,  10, 100
    WAIT	

    MOVE G6A, 60, 165,  30, 165, 155, 100
    MOVE G6D, 60, 165,  30, 165, 155, 100
    MOVE G6B,170,  10, 100
    MOVE G6C,170,  10, 100
    WAIT	

    MOVE G6A, 60, 165,  25, 160, 145, 100
    MOVE G6D, 60, 165,  25, 160, 145, 100
    MOVE G6B,150,  60,  90
    MOVE G6C,150,  60,  90
    WAIT	

    MOVE G6A,100, 155,  25, 140, 100, 100
    MOVE G6D,100, 155,  25, 140, 100, 100
    MOVE G6B,130,  50,  85
    MOVE G6C,130,  50,  85
    WAIT	

    HIGHSPEED SETOFF


    SPEED 10
    GOSUB 기본자세
    RETURN
    '*************************************************

왼쪽옆으로3:
    SPEED 12
    'HIGHSPEED SETON
    MOVE G6A,  81, 113,  84, 114, 111,
    MOVE G6D,  98, 106, 104, 108, 125,
    WAIT

    MOVE G6A,  90, 107,  99, 111, 103,
    MOVE G6D, 105, 107,  99, 111, 107,
    WAIT

    'HIGHSPEED SETOFF
    ERX 4800, A, 왼쪽옆으로3

    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    WAIT

    RETURN

    '================================================

    '================================================
왼쪽옆으로:
    SPEED 12

    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    WAIT
    WAIT
왼쪽쪽옆으로4:
    SPEED 12
    'HIGHSPEED SETON


    ' 팔20양쪽움직이고 왼쪽발목 90도로움직임

    MOVE G6D,  91,  91, 123, 104, 116, 100
    MOVE G6A,  89, 104, 103, 112, 117,
    WAIT
    MOVE G6D, 100,  95, 102, 124, 105,  100
    MOVE G6A, 100,  91, 108, 121, 101,
    WAIT
    ' HIGHSPEED SETOFF
    ERX 115200, A, 왼쪽쪽옆으로4


    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    WAIT

    RETURN

오른옆으로:
오른쪽옆으로4:

sss:
    SPEED 12
    'HIGHSPEED SETON
    MOVE G6A,  91,  94, 123, 101, 116,
    MOVE G6D,  89, 104, 103, 109, 117,
    WAIT



    MOVE G6A, 100,  91, 102, 124, 105,
    MOVE G6D, 100,  91, 108, 121, 101,
    WAIT



    ERX 115200, a, sss

    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,

    RETURN





오른쪽옆으로3:
    SPEED 12
    'HIGHSPEED SETON

    MOVE G6A,  98,  99, 104, 108, 129,
    MOVE G6D,  84, 113,  84, 114, 111,
    WAIT


    MOVE G6A, 105, 107,  99, 111, 103, 100
    MOVE G6D,  94, 107,  99, 111, 103,
    WAIT

    'HIGHSPEED SETOFF
    ERX 4800, A, 오른쪽옆으로3

    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    WAIT

    RETURN
    '================================================




다리벌리기:
    SPEED 15
    MOVE G6A,  55,  77, 123, 117, 184,
    MOVE G6D,  52,  84, 139,  92, 187,
    MOVE G6B, 101, 126, 107,  ,  ,
    MOVE G6C, 101, 106, 114,  ,  ,
    WAIT
    MOVE G6A,  53, 130,  24, 159, 184,
    MOVE G6D,  53, 132,  20, 153, 187,
    MOVE G6B, 101, 126, 107,  ,  ,
    MOVE G6C, 101, 106, 114,  ,  ,
    WAIT
    SPEED 12
    MOVE G6A,  53, 131,  23, 158, 146,
    MOVE G6D,  52, 135,  20, 160, 147,
    MOVE G6B, 101, 126, 107,  ,  ,
    MOVE G6C, 101, 106, 114,  ,  ,
    WAIT
    MOVE G6A,  94, 131,  23, 158,  97,
    MOVE G6D,  94, 131,  23, 158,  97,
    MOVE G6B, 101, 126, 107,  ,  ,
    MOVE G6C, 101, 106, 114,  ,  ,
    WAIT


    MOVE G6A, 100,  76, 145,  93, 100,
    MOVE G6D, 100,  76, 145,  93, 100,
    MOVE G6B, 103, 104,  80,  ,  ,
    MOVE G6C, 102,  97,  80,  ,  ,
    WAIT


    SPEED 12
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT
    RETURN
    '**********************************************
오른쪽턴:

    SPEED 15
    MOVE G6A,  89,  66, 110, 135, 111, 100
    MOVE G6D,  93, 121, 107,  89, 103,
    WAIT
    MOVE G6A,  86,  66, 110, 135, 111, 100
    MOVE G6D,  90, 121, 107,  89, 103,
    WAIT
    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    RETURN
    '**********************************************

왼쪽턴2:

    SPEED 15

    MOVE G6A, 100, 157,  87,  71, 105,
    MOVE G6D,  97,  52,  98, 163,  98,

    WAIT

    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100

    WAIT
    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    RETURN

    '**********************************************

왼쪽턴:


    SPEED 15
    'MOVE G6A,  96, 120, 110,  88, 104, 100
    '    MOVE G6D,  91,  68, 106, 138, 109,
    '    MOVE G6B,100,  35,  80,
    '    MOVE G6C,100,  35,  80,
    '    WAIT
    MOVE G6A,  96, 120, 110,  88, 104,
    MOVE G6D,  92,  77, 106, 131, 107,
    WAIT

    MOVE G6A,  93, 120, 110,  88, 104, 100
    MOVE G6A,  93, 120, 110,  88, 104, 100
    MOVE G6D,  88,  68, 106, 138, 109,
    WAIT
    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    RETURN
    '**********************************************
오른쪽턴2:

    SPEED 15

    MOVE G6D, 100, 157,  87,  71, 105,
    MOVE G6A,  97,  52,  98, 163,  98,
    WAIT

    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    WAIT
    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,
    RETURN

    '**********************************************

전진하기3:

    SPEED 12
    MOVE G6A,  98,  93, 111, 117, 102, 100
    MOVE G6D,  97,  93, 111, 117, 102,

    SPEED 12
    'HIGHSPEED SETON




fast_run_1:

    MOVE G6A,  99,  85, 108, 133, 102, 100
    MOVE G6D,  99,  95, 109, 111, 101,
    'MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    MOVE G6A,  99,  95, 109, 111, 101, 100
    MOVE G6D,  99,  85, 108, 133, 102,
    'MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT



    ERX 4800, A, fast_run_1
    SPEED 12
    MOVE G6A,  99,  95, 109, 111, 101,  100
    MOVE G6D,  99,  71, 117, 127, 100,
    'MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    GOSUB 기본자세

    WAIT



    RETURN


    '======================================================
전진하기:

    SPEED 12

    MOVE G6A, 100,  93, 111, 110, 102, 100
    MOVE G6D, 100,  88, 107, 136, 101,
    'MOVE G6B, 100,  30, 74,  ,  ,
    'MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    MOVE G6A, 100,  88, 107, 135, 101, 100
    MOVE G6D, 100,  93,  111, 110, 102,
    'MOVE G6B, 100,  30, 74,  ,  ,
    'MOVE G6C, 100,  30, 76,  ,  ,
    WAIT

    SPEED 10
    GOSUB 기본자세
    RETURN



    '======================================================

뒤로후진:
    SPEED 12
    MOVE G6A, 100,  94, 111, 110, 102,
    MOVE G6D, 101, 108, 106,  90, 100,

    WAIT
    MOVE G6A, 101, 108, 106,  90, 100,
    MOVE G6D, 100,  94, 111, 110, 102,

    WAIT
    MOVE G6A, 100,  94, 111, 110, 102,
    MOVE G6D, 101, 108, 106,  90, 100,

    WAIT
    MOVE G6A, 101, 108, 106,  90, 100,
    MOVE G6D, 100,  94, 111, 110, 102,
    WAIT

    MOVE G6A,  99,  94, 111, 113, 100,
    MOVE G6D,  99,  94, 111, 113, 100,

    RETURN
    '================================================
뒤로걷기:

    SPEED 15
    MOVE G6A, 103,  94, 111, 115, 102, 100
    MOVE G6D,  92,  94, 111, 115, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
뒤로걷기1:
    MOVE G6A, 104,  91, 116, 112, 101, 100
    MOVE G6D,  93, 110, 109,  94, 103,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT
    MOVE G6A, 101,  86, 115, 108, 101, 100
    MOVE G6D, 100, 107, 125,  82, 101,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT
    MOVE G6A,  93, 110, 109,  94, 103, 100
    MOVE G6D, 104,  91, 116, 112, 101,
    MOVE G6B, 100, 30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT
    MOVE G6A, 100, 107, 125,  82, 101, 100
    MOVE G6D, 101,  86, 115, 108, 101,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT


    ERX 4800, A, 뒤로걷기1
    SPEED 12
    MOVE G6A,  98,  94, 111, 115, 102, 100
    MOVE G6D,  97,  94, 111, 115, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    RETURN
    '================================================





오른쪽펀치:
    SPEED 15

    HIGHSPEED SETON
    MOVE G6A,  98,  94, 111, 115, 102, 100
    MOVE G6D,  97,  94, 111, 115, 102,
    MOVE G6B,  56, 131, 189,  ,  ,
    MOVE G6C, 188,  29,  13,  ,  ,
    WAIT
    MOVE G6A,  95,  93, 111, 111, 120, 100
    MOVE G6D,  96,  99, 103, 120, 104,
    MOVE G6B,  120,  60, 74,  ,  ,
    MOVE G6C, 188,  138,  153,  ,  ,
    WAIT
    DELAY 200
    MOVE G6A,  72, 103, 118,  97, 136, 100
    MOVE G6D,  94, 107,  83, 126,  99,
    MOVE G6B,  140,  80, 100,  ,  ,
    MOVE G6C, 188,  18,  23,  ,  ,
    WAIT


    DELAY 200
    MOVE G6A,  99,  94, 111, 113, 102, 100
    MOVE G6D,  98,  94, 111, 113, 102,
    MOVE G6B,  56, 131, 189,  ,  ,
    MOVE G6C, 188,  29,  13,  ,  ,
    WAIT
    HIGHSPEED SETOFF
    WAIT

    RETURN
    '**************************************************
    '======================================================




오른쪽편향펀치:

    SPEED 15
    HIGHSPEED SETON
    MOVE G6A,  98,  94, 111, 115, 102, 100
    MOVE G6D,  97,  94, 111, 115, 102,
    MOVE G6B,  100,  30, 79,  ,  ,
    MOVE G6C,  100,  30, 79,  ,  ,
    WAIT
    MOVE G6A,  90,  94, 111, 115, 102,
    MOVE G6D,  77,  94, 111, 115, 132,
    MOVE G6B, 100,  30,  79,  ,  ,
    MOVE G6C, 102, 111, 102,  ,  ,
    WAIT

    DELAY 300


    MOVE G6A,  97,  94, 111, 115, 102,
    MOVE G6D,  97,  94, 111, 115, 102,
    MOVE G6B, 100,  30,  79,  ,  ,
    MOVE G6C, 100,  30,  79,  ,  ,
    WAIT

    DELAY 300

    MOVE G6A,  99,  94, 111, 113, 102, 100
    MOVE G6D,  98,  94, 111, 113, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,



    WAIT
    HIGHSPEED SETOFF
    WAIT
    RETURN
    '**************************************************
왼쪽펀치:
    SPEED 15

    HIGHSPEED SETON
    MOVE G6D,  98,  94, 111, 115, 102,
    MOVE G6A,  97,  94, 111, 115, 102, 100
    MOVE G6C,  92,  30, 79,  ,  ,
    MOVE G6B,  92,  30, 79,  ,  ,
    WAIT
    MOVE G6D,  95,  93, 111, 111, 120,
    MOVE G6A,  96,  99, 103, 120, 104, 100
    MOVE G6C,  68,  42, 140,  ,  ,
    MOVE G6B,  76,  92, 124,  ,  ,
    WAIT
    MOVE G6D,  72, 103, 118,  97, 136,
    MOVE G6A,  94, 107,  83, 126,  99,  100
    MOVE G6C,  68,  42, 140,  ,  ,
    MOVE G6B,  15, 103,  180,  ,  ,

    WAIT


    DELAY 200
    MOVE G6A,  99,  94, 111, 113, 102, 100
    MOVE G6D,  98,  94, 111, 113, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,



    WAIT

    HIGHSPEED SETOFF
    WAIT
    RETURN

    '**************************************************
    '======================================================

왼쪽편향펀치:
    SPEED 15
    HIGHSPEED SETON
    MOVE G6D,  98,  94, 111, 115, 102,
    MOVE G6A,  97,  94, 111, 115, 102, 100
    MOVE G6C,  92,  30, 79,  ,  ,
    MOVE G6B,  92,  30, 79,  ,  ,
    WAIT
    MOVE G6A,  98, 115,  65, 135, 102, 100
    MOVE G6D,  69, 109,  96, 113, 130,
    MOVE G6B,  100,  92, 124,  ,  ,
    MOVE G6C,  68,  35, 140,  ,  ,


    WAIT
    MOVE G6A,  98, 115,  65, 135, 102, 149
    MOVE G6D,  69, 109,  96, 113, 130,
    MOVE G6B, 105,  100,  90,  ,  ,
    MOVE G6C,  68,  35, 140,  ,  ,


    WAIT


    DELAY 300
    MOVE G6A,  99,  94, 111, 113, 102, 100
    MOVE G6D,  98,  94, 111, 113, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,



    WAIT
    HIGHSPEED SETOFF
    WAIT
    RETURN

    '**************************************************
    '================================================
좌측공격:
    SPEED 15
    MOVE G6A,  93,  90, 109, 115, 102, 100
    MOVE G6D, 103,  91, 111, 115, 105,
    MOVE G6C, 107,  55, 156,  ,  ,
    MOVE G6B,  188,  95, 97,  ,  ,

    WAIT
    HIGHSPEED SETON
    SPEED  15
    MOVE G6D,  64,  93, 114, 115, 143,
    MOVE G6A,  99, 113,  73, 135,  95, 100
    MOVE G6C, 107,  55, 156,  ,  ,
    MOVE G6B,  188,  95,  10,  ,  ,

    WAIT
    MOVE G6C, 107,  55, 156,  ,  ,
    MOVE G6B,  188,  95, 97,  ,  ,

    WAIT
    MOVE G6C, 107,  55, 156,  ,  ,
    MOVE G6B,  188,  95,  10,  ,  ,

    WAIT
    DELAY 400
    SPEED 10

    GOSUB 기본자세
    HIGHSPEED SETOFF
    WAIT


    RETURN

    '================================================
    '================================================
우측공격:
    SPEED 15
    MOVE G6A, 103,  91, 111, 115, 105, 100
    MOVE G6D,  93,  90, 109, 115, 102,
    MOVE G6B, 107,  55, 156,  ,  ,
    MOVE G6C,  182,  95, 100,  ,  ,


    WAIT
    HIGHSPEED SETON
    SPEED  15
    MOVE G6A,  64,  93, 114, 115, 143, 100
    MOVE G6D,  99, 113,  73, 135,  95,
    MOVE G6B, 107,  55, 156,  ,  ,
    MOVE G6C,  188,  95,  10,  ,  ,


    WAIT

    MOVE G6B, 107,  55, 156,  ,  ,
    MOVE G6C,  182,  95, 100,  ,  ,


    WAIT

    MOVE G6B, 107,  55, 156,  ,  ,
    MOVE G6C,  188,  95,  10,  ,  ,


    WAIT

    DELAY 400
    SPEED 10

    GOSUB 기본자세
    HIGHSPEED SETOFF
    WAIT



    RETURN

    '================================================



앞오른쪽대각선펀치:
    HIGHSPEED SETON
    SPEED 10

    MOVE G6A, 104,  76, 145,  93, 100,
    MOVE G6D,  97,  76, 145,  93, 100,
    MOVE G6B, 100,  30,  80,  ,  ,
    MOVE G6C, 184,  11,  41,  ,  ,

    WAIT
    MOVE G6A,  82, 118, 116,  82, 112,
    MOVE G6D,  89,  82,  89, 149, 116,
    MOVE G6B, 100,  43, 100,  ,  ,
    MOVE G6C, 184,  88, 101,  ,  ,


    WAIT
    DELAY 300
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT

    HIGHSPEED SETOFF



    RETURN
    '**************************************************
앞왼쪽대각선펀치:


    HIGHSPEED SETON
    SPEED 10

    MOVE G6D, 104,  76, 145,  93, 100,
    MOVE G6A,  97,  76, 145,  93, 100,
    MOVE G6C, 100,  30,  80,  ,  ,
    MOVE G6B, 184,  11,  41,  ,  ,

    WAIT

    MOVE G6A,  89,  82,  89, 143, 116,
    MOVE G6D,  81, 118, 116,  82, 112,
    MOVE G6B, 188,  77, 101,  ,  ,
    MOVE G6C, 100,  43, 100,  ,  ,

    WAIT
    DELAY 300
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    WAIT

    HIGHSPEED SETOFF

    RETURN

    '****************************************************

좌우넘어뜨리기기술:
    SPEED 15
    MOVE G6A,  81, 122,  62, 139, 116,
    MOVE G6D,  81, 122,  62, 137, 111,
    MOVE G6B, 100,  49,  69,  ,  ,
    MOVE G6C, 100,  52,  63,  ,  ,
    WAIT
    HIGHSPEED SETON
    SPEED 15
    MOVE G6A,  81, 122,  62, 139, 116,
    MOVE G6D,  81, 122,  62, 137, 111,
    MOVE G6B, 188,  43,  69,  ,  ,
    MOVE G6C, 144,  54,  64,  ,  ,
    WAIT
    MOVE G6A,  81, 122,  62, 139, 116,
    MOVE G6D,  81, 122,  62, 137, 111,
    MOVE G6B, 188,  13,  52,  ,  ,
    MOVE G6C, 144,  17,  65,  ,  ,
    WAIT
    MOVE G6A,  81, 122,  62, 139, 116,
    MOVE G6D,  81, 122,  62, 137, 111,
    MOVE G6B, 186, 103,  98,  ,  ,
    MOVE G6C, 180,  94, 105,  ,  ,
    WAIT


    HIGHSPEED SETOFF
    SPEED 10
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT

    RETURN

    '****************************************************

방어일어나기:
    SPEED 15

    MOVE G6A,  87, 122,  62, 133, 111, 100
    MOVE G6D,  87, 122,  62, 133, 111,
    MOVE G6B, 145,  30, 78,  ,  ,
    MOVE G6C, 145,  30, 78,  ,  ,

    WAIT
    SPEED 10
    HIGHSPEED SETON
    MOVE G6A,  86, 122,  62, 133, 111, 100
    MOVE G6D,  87, 122,  62, 133, 111,
    MOVE G6B, 190,  30,  32,  ,  ,
    MOVE G6C, 190,  30,  32,  ,  ,

    WAIT
    HIGHSPEED SETOFF
    SPEED 14
    GOSUB 기본자세

    WAIT

    RETURN

    '**************************************************
방어자세:

    HIGHSPEED SETON
    SPEED  6
    MOVE G6A,  93, 140,  23, 156, 107, 100
    MOVE G6D,  85, 166,  22, 137, 115,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT

    ' HIGHSPEED SETOFF
    ' ERX 4800, a, 방어자세
    'SPEED 15
    'GOSUB 기본자세
    ' WAIT
    RETURN
    '**************************************************

오른쪽펀치2:
    HIGHSPEED SETON
    SPEED 7
    MOVE G6A,  86, 122,  62, 139, 116,
    MOVE G6D,  85, 122,  62, 137, 111,
    MOVE G6B, 101,  46,  80,  ,  ,
    MOVE G6C, 108, 145, 101,  ,  ,

    WAIT
    MOVE G6A,  86, 122,  62, 139, 116,
    MOVE G6D,  85, 122,  62, 137, 111,
    MOVE G6B, 101,  46,  80,  ,  ,
    MOVE G6C, 101,  46,  78,  ,  ,
    WAIT
    HIGHSPEED SETOFF

    RETURN

    '**************************************************
양팔날개짓:
    HIGHSPEED SETON
    DIM aa AS BYTE
    FOR aa = 0 TO 3
        SPEED 15
        MOVE G6A,  85, 122,  62, 137, 111, 100
        MOVE G6D,  86, 122,  62, 139, 116,
        MOVE G6B, 107, 40,  80,  ,  ,
        MOVE G6C, 107, 40,  80,  ,  ,

        WAIT

        MOVE G6A,  85, 122,  62, 137, 111, 100
        MOVE G6D,  86, 122,  62, 139, 116,
        MOVE G6B, 107,  101,  100,  ,  ,
        MOVE G6C, 107,  101,  100,  ,  ,

        WAIT

    NEXT aa
    HIGHSPEED SETOFF

    RETURN

    '**************************************************
엎드려서왼쪽으로돌리기:
    SPEED 15

    MOVE G6A,  98, 165,  28, 114, 103,
    MOVE G6D, 100, 165,  28, 114,  96,
    MOVE G6B, 100,  30,  80,  ,  ,
    MOVE G6C, 100,  30,  80,  ,  ,
    WAIT
    MOVE G6A,  99, 165,  43, 159, 103,
    MOVE G6D, 101, 165,  42, 162,  96,
    MOVE G6B, 182,  28,  79,  ,  ,
    MOVE G6C, 182,  28,  79,  ,  ,
    WAIT
    MOVE G6A, 100, 165,  42, 119, 103,
    MOVE G6D, 102, 165,  41, 121,  96,
    MOVE G6B, 188,  93,  92,  ,  ,
    MOVE G6C, 188,  86, 102,  ,  ,
    WAIT
    MOVE G6A, 116, 164,  41, 112, 189,
    MOVE G6D, 116, 163,  41, 114, 184,
    MOVE G6B, 188,  98,  92,  ,  ,
    MOVE G6C, 188,  92,  94,  ,  ,
    WAIT
    MOVE G6A, 110,  93, 132,  89, 187,
    MOVE G6D, 111,  99, 139,  81, 181,
    MOVE G6B, 188,  98,  92,  ,  ,
    MOVE G6C, 188,  92,  94,  ,  ,
    WAIT
    MOVE G6A, 114, 165, 137,  97, 187,
    MOVE G6D, 114, 162, 142,  94, 181,
    MOVE G6B, 188, 100,  74,  ,  ,
    MOVE G6C, 188, 108,  68,  ,  ,
    WAIT
    MOVE G6A, 107, 145, 135, 119, 184,
    MOVE G6D, 104, 138, 139, 124, 183,
    MOVE G6B, 188,  77,  74,  ,  ,
    MOVE G6C, 188,  75,  69,  ,  ,
    WAIT
    MOVE G6A, 107, 145, 135, 119, 184,
    MOVE G6D, 104, 138, 139, 124, 183,
    MOVE G6B, 190,  97,  10,  ,  ,
    MOVE G6C, 188,  97,  10,  ,  ,
    WAIT

    DELAY 500

    MOVE G6A, 110, 150, 135, 149, 182,
    MOVE G6D, 106, 165,  57, 159, 166,
    MOVE G6B, 188,  11,  96,  ,  ,
    MOVE G6C, 188,  10,  51,  ,  ,
    WAIT



    MOVE G6A, 108, 145, 135, 103, 183,
    MOVE G6D, 106, 165,  57, 159, 166,
    MOVE G6B, 188,  11,  96,  ,  ,
    MOVE G6C, 188,  10,  51,  ,  ,

    WAIT

    MOVE G6A, 108,  74, 124,  10, 180,
    MOVE G6D, 117, 165,  65, 162, 127,
    MOVE G6B, 188,  11,  96,  ,  ,
    MOVE G6C, 188,  10,  40,  ,  ,
    WAIT
    MOVE G6A, 108,  74, 124,  10, 180,
    MOVE G6D, 116, 162,  64, 148, 119,
    MOVE G6B, 188,  11,  96,  ,  ,
    MOVE G6C, 177,  36, 108,  ,  ,
    WAIT

    MOVE G6A, 108,  74, 124,  10, 180,
    MOVE G6D, 117, 165,  65, 162, 127,
    MOVE G6B, 188, 159, 154,  ,  ,
    MOVE G6C, 188,  27,  70,  ,  ,
    WAIT

    '뒤로팔다리각잡기
    MOVE G6A, 101,  62,  81,  77, 159,
    MOVE G6D, 101,  60,  77,  82, 156,
    MOVE G6B, 187, 113, 171,  ,  ,
    MOVE G6C, 188, 105, 183,  ,  ,
    WAIT








    MOVE G6A,  78,  74, 135,  12, 187,
    MOVE G6D,  85,  76, 118,  25, 184,
    MOVE G6B, 187, 113, 171,  ,  ,
    MOVE G6C, 188, 105, 183,  ,  ,
    WAIT
    MOVE G6A,  86,  70, 153,  56, 184,
    MOVE G6D,  78,  73, 158,  62, 189,
    MOVE G6B, 187, 113, 171,  ,  ,
    MOVE G6C, 188, 105, 183,  ,  ,
    WAIT
    MOVE G6A, 101,  76, 157, 111, 103,
    MOVE G6D, 101,  76, 157, 111, 103,
    MOVE G6B, 187, 113, 171,  ,  ,
    MOVE G6C, 188, 105, 183,  ,  ,
    WAIT
    DELAY 1000
    MOVE G6A, 101,  76, 157, 111, 103,
    MOVE G6D, 101,  76, 157, 111, 103,
    MOVE G6B, 175, 106, 183,  ,  ,
    MOVE G6C, 175, 106, 183,  ,  ,

    WAIT
    MOVE G6A, 101,  76, 157, 111, 103,
    MOVE G6D, 101,  76, 157, 111, 103,
    MOVE G6B, 188,  32,  83,  ,  ,
    MOVE G6C, 188,  32,  83,  ,  ,
    WAIT
    RETURN
    '==============================================================
    '==============================================================
정면펀치:

    'HIGHSPEED SETON
    SPEED 15

    MOVE G6B, 100,  37, 140,  ,  ,
    MOVE G6C, 100,  37, 140,  ,  ,
    WAIT




    'HIGHSPEED SETOFF

    ' GOSUB 기본자세


    RETURN


정면:

    SPEED 15
    '왼쪽펀치뻗기
    MOVE G6A,  89,  94,  63, 156, 111,  53
    MOVE G6D,  92, 159,  65,  93, 107,
    MOVE G6B, 115, 103,  16,  ,  ,
    MOVE G6C,  62,  41, 124,  ,  ,


    WAIT
    DELAY 300
    MOVE G6A,  89,  94,  63, 156, 111, 143
    MOVE G6D,  92, 159,  65,  93, 107,
    MOVE G6B,  87,  52, 149,  ,  ,
    MOVE G6C, 105,  96, 150,  ,  ,
    WAIT

    MOVE G6A,  89,  94,  63, 156, 111, 143
    MOVE G6D,  92, 159,  65,  93, 107,
    MOVE G6B,  87,  52, 149,  ,  ,
    MOVE G6C, 105,  96,  31,  ,  ,



    WAIT
    DELAY 300
    MOVE G6A,  89,  94,  63, 156, 111, 103
    MOVE G6D,  92, 159,  65,  93, 107,
    MOVE G6C, 111,  12, 150,  ,  ,
    MOVE G6B,  63,  14, 136,  ,  ,

    WAIT


    HIGHSPEED SETOFF
    SPEED 12



    WAIT
    GOSUB 기본자세

    RETURN




    '==============================================================
왼쪽측면펀치:
    SPEED 15
    MOVE G6A,  90, 122, 109,  85, 110, 135
    MOVE G6D,  99,  95,  96, 127, 100,
    MOVE G6B, 112,  19, 172,  ,  ,
    MOVE G6C, 164,  13, 132,  ,  ,
    WAIT
    MOVE G6A,  90, 122, 109,  85, 110, 135
    MOVE G6D,  99,  91,  94, 130,  99,
    MOVE G6B, 109,  23, 174,  ,  ,
    MOVE G6C, 120,  99,  25,  ,  ,
    WAIT


    MOVE G6A,  90, 122, 109,  85, 110,  65
    MOVE G6D,  99,  91,  94, 130,  99,
    MOVE G6B, 109,  23, 174,  ,  ,
    MOVE G6C, 120,  99,  25,  ,  ,
    WAIT


    GOSUB 기본자세


    RETURN

    '==============================================================

모터풀기:
    MUSIC "cccc"

모터풀기1:
    MOTOROFF G24

    ERX 4800, A, 모터풀기1
    TEMPO 230
    MUSIC "cdef"
    SPEED 5
    MOTOR G24


    GOSUB 기본자세

    RETURN

    '==============================================================
뒤로펀치:

    HIGHSPEED SETON
    SPEED 15

    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  95,  33,  83,  ,  ,
    MOVE G6C,  95,  33,  83,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  59,  24,  54,  ,  ,
    MOVE G6C,  59,  24,  54,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  16,  28,  30,  ,  ,
    MOVE G6C,  16,  28,  30,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  15,  13,  98,  ,  ,
    MOVE G6C,  15,  13,  98,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  95,  33,  83,  ,  ,
    MOVE G6C,  95,  33,  83,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  59,  24,  54,  ,  ,
    MOVE G6C,  59,  24,  54,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  16,  28,  30,  ,  ,
    MOVE G6C,  16,  28,  30,  ,  ,
    WAIT
    MOVE G6A,  94,  94, 111, 113, 105,
    MOVE G6D,  94,  94, 111, 113, 105,
    MOVE G6B,  15,  13,  98,  ,  ,
    MOVE G6C,  15,  13,  98,  ,  ,
    WAIT



    HIGHSPEED SETOFF

    GOSUB 기본자세

    RETURN
