'*********** 사용자 접근 변수 ***************

'이동 속도 설정
CONST WALKING_SPEED = 10
'기울기 센서를 사용할 것인지 결정함
CONST TILT_SENSOR_ON = 0       '1이면 사용 0이면 미사용
'장애물 감지 후 뒷걸음질 횟수
CONST BACK_FOOT  = 1
'장애물 감지 후 옆걸음질 횟수
CONST SIDE_FOOT = 3

' 전방 센서들의  기준값(보다 작아지면 거리 가까워짐)
CONST C_SENSOR1_VAL = 120
CONST C_SENSOR2_VAL = 120
CONST C_SENSOR3_VAL = 120
CONST C_SENSOR4_VAL = 120


' 발아래 센서들의 기준값(보다 커지면 거리 멀어짐)
CONST B_SENSOR1_VAL = 220
CONST B_SENSOR2_VAL = 220

'기울기 센서들의 기준값
CONST TILT_SENSOR1_VAL_RIGHT = 180
CONST TILT_SENSOR1_VAL_LEFT  = 112
CONST TILT_SENSOR2_VAL_FORWARD = 130
CONST TILT_SENSOR2_VAL_REAR    = 176

'***********************************************

DIM i AS BYTE
DIM A AS BYTE
DIM B AS BYTE
DIM BUFFER AS BYTE
DIM COUNT AS INTEGER
DIM SIDE_REG AS BYTE
DIM START_REG AS BYTE
DIM R AS BYTE
DIM R_BUFF AS BYTE


DIM C_SENSOR1 AS INTEGER
DIM C_SENSOR2 AS INTEGER
DIM C_SENSOR3 AS INTEGER
DIM C_SENSOR4 AS INTEGER

DIM B_SENSOR1 AS INTEGER
DIM B_SENSOR2 AS INTEGER

DIM TILT_SENSOR1 AS INTEGER
DIM TILT_SENSOR2 AS INTEGER

DIM SENSOR_STATUS AS BYTE
DIM TILT_SENSOR_STATUS AS BYTE

DIM MOTION_STATUS AS BYTE
DIM EX_MOTION_STATUS AS BYTE

DIM INI_MOTION AS BYTE

DIM GOGO_STEP AS BYTE
DIM BACK_STEP AS BYTE

DIM POLLING_DIR  AS BYTE

MOTOR G6A
MOTOR G6B
MOTOR G6C
MOTOR G6D
'
'ZERO G6A,100, 112,  74, 107, 100, 100
'ZERO G6B,100, 100, 100, 100, 100, 100
'ZERO G6C,100, 100, 100, 100, 100, 100
'ZERO G6D, 98, 114,  76, 104, 100, 100
'
''



SENSOR_STATUS = 0
TILT_SENSOR_STATUS = 0
MOTION_STATUS = 0
EX_MOTION_STATUS = 0
INI_MOTION = 0
GOGO_STEP = 0
BACK_STEP = 0
POLLING_DIR = 0
SIDE_REG = 0
START_REG = 0



'=================================================================
'=============== 여기부터 다리건너기까지 프로그래밍 ==============
''명령어 예제
'right333    => 오른쪽 옆걸음 (약 30cm 정도 움직임)
'right222    => 오른쪽 옆걸음 (약 30cm 정도 움직임)
'left333    => 왼쪽 옆걸음 (약 30cm 정도 움직임)
'left222    => 왼쪽 옆걸음 (약 20cm 정도 움직임)
'right30  => 우회전 30도
'left30   => 좌회전 30도
'right15  => 우회전 15도
'left15   => 좌회전 15도
'go  => 전진 한보


GOSUB 기본자세
DELAY 4000
GOSUB back1
GOSUB back1
GOSUB back1
GOSUB back1
GOSUB back1
DELAY 500
GOSUB right222
GOSUB right222
DELAY 500
GOSUB right30
GOSUB right30
GOSUB right30
DELAY 500
GOSUB right333
GOSUB right333
GOSUB right222
DELAY 500
GOSUB left30
GOSUB left30
GOSUB left30
DELAY 500
GOSUB right222
DELAY 500
GOSUB left30
DELAY 500
GOSUB right222
DELAY 500
GOSUB left30
GOSUB left30
DELAY 500
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333
GOSUB right333






'============== 프로그램 끝 이후 센서를 통해 움직임 ===============

'*********** Main Routine ************


















MAIN:


    COUNT = COUNT + 1

    GOSUB SENSOR_CHECK

    IF TILT_SENSOR_ON=1  THEN
        GOSUB TILT_SENSOR_CHECK
    ENDIF

    IF START_REG = 0 THEN

        DELAY 1000
        START_REG = 1
        SENSOR_STATUS = 0
        TILT_SENSOR_STATUS = 0

    ENDIF

    B = TILT_SENSOR_STATUS.0

    IF B = 1 THEN
        MOTION_STATUS = 5
        GOTO MOVE_STEP
    ENDIF

    B = TILT_SENSOR_STATUS.1

    IF B = 1 THEN
        MOTION_STATUS = 6
        GOTO MOVE_STEP
    ENDIF


    B = SENSOR_STATUS.4

    IF B = 1 THEN
        MOTION_STATUS = 2
        GOTO MOVE_STEP
    ENDIF

    B = SENSOR_STATUS.5

    IF B = 1 THEN
        MOTION_STATUS = 2
        GOTO MOVE_STEP
    ENDIF


    IF SENSOR_STATUS = 0 THEN
        MOTION_STATUS = 1

    ELSEIF SENSOR_STATUS = 1 THEN
        MOTION_STATUS = 3

    ELSEIF SENSOR_STATUS = 2 THEN
        MOTION_STATUS = 4

    ELSEIF SENSOR_STATUS = 3 THEN
        MOTION_STATUS = 2

    ELSEIF SENSOR_STATUS = 4 THEN
        MOTION_STATUS = 3

    ELSEIF SENSOR_STATUS = 5 THEN
        MOTION_STATUS = 3

    ELSEIF SENSOR_STATUS = 7 THEN
        MOTION_STATUS = 2 '+ 4

    ELSEIF SENSOR_STATUS = 8 THEN
        MOTION_STATUS = 4

    ELSEIF SENSOR_STATUS = 10 THEN
        MOTION_STATUS = 4

    ELSEIF SENSOR_STATUS = 11 THEN
        MOTION_STATUS = 2 '+ 3

    ELSEIF SENSOR_STATUS = 12 THEN
        MOTION_STATUS = 1

    ELSE
        MOTION_STATUS = 1

    ENDIF

    IF SIDE_REG = 1 THEN

        IF MOTION_STATUS = 1 OR MOTION_STATUS = 2 THEN
            MOTION_STATUS = POLLING_DIR
        ENDIF

        IF COUNT > SIDE_FOOT THEN
            COUNT = 0
            SIDE_REG = 0

        ENDIF

    ENDIF


MOVE_STEP:

    IF EX_MOTION_STATUS <> MOTION_STATUS THEN
        INI_MOTION = 1
        EX_MOTION_STATUS = MOTION_STATUS
    ELSE
        INI_MOTION = 0
    ENDIF


    IF MOTION_STATUS = 1 THEN
        GOSUB MF_GOGO

    ELSEIF MOTION_STATUS = 2 THEN
        GOSUB MF_BACK

    ELSEIF MOTION_STATUS = 3 THEN
        GOSUB LEFT_GOGO

    ELSEIF MOTION_STATUS = 4 THEN
        GOSUB RIGHT_GOGO

    ELSEIF MOTION_STATUS = 5 THEN
        GOSUB STAND2_1
        SENSOR_STATUS = 0

    ELSEIF MOTION_STATUS = 6 THEN
        GOSUB STAND2_2
        SENSOR_STATUS = 0

    ENDIF

    GOTO MAIN


    '*************************************

MF_GOGO:

    IF INI_MOTION = 1 THEN
        GOSUB INITIAL_POS
    ENDIF

    IF GOGO_STEP >=2 OR INI_MOTION = 1 THEN
        GOGO_STEP = 0
    ENDIF

    IF GOGO_STEP = 0 THEN
        GOSUB GOGO1
    ELSEIF GOGO_STEP = 1 THEN
        GOSUB GOGO2
    ENDIF

    GOGO_STEP = GOGO_STEP + 1

    INI_MOTION = 0

    RETURN


MF_BACK:

    IF INI_MOTION = 1 THEN
        GOSUB INITIAL_POS
    ENDIF

    FOR A = 1  TO BACK_FOOT

        '        IF BACK_STEP >=2 OR INI_MOTION = 1 THEN
        '           BACK_STEP = 0
        '        ENDIF

        '        IF BACK_STEP = 0 THEN
        GOSUB BACK1
        '        ELSEIF BACK_STEP = 1 THEN
        '            GOSUB BACK2
        '        ENDIF

        '        BACK_STEP = BACK_STEP + 1

    NEXT A

    INI_MOTION = 0

    SIDE_REG = 1
    COUNT = 0
    SENSOR_STATUS = 0

    GOSUB POLLING_DIRECTION

    RETURN


MF_LEFT:


    RETURN

MF_RIGHT:

    RETURN



MF_LEFT_TURN:

    RETURN

MF_RIGHT_TURN:

    RETURN


POLLING_DIRECTION:

    R = RND
    R_BUFF = R MOD 2

    IF R_BUFF = 0 THEN
        POLLING_DIR = 3
    ELSE
        POLLING_DIR = 4
    ENDIF

    RETURN



TILT_SENSOR_CHECK:

    '평균 필터
    FOR B = 0 TO 9

        FOR A = 6 TO 7

            BUFFER = AD(A)

            IF A=6 THEN
                TILT_SENSOR1 = TILT_SENSOR1 + BUFFER

            ELSEIF A=7 THEN
                TILT_SENSOR2 = TILT_SENSOR2 + BUFFER

            ENDIF

        NEXT A

    NEXT  B

    TILT_SENSOR1 = TILT_SENSOR1 / 10
    TILT_SENSOR2 = TILT_SENSOR2 / 10



    IF TILT_SENSOR2 <= TILT_SENSOR2_VAL_FORWARD THEN
        MUSIC "O332cccC"
        TILT_SENSOR_STATUS.0 = 1
    ELSE
        TILT_SENSOR_STATUS.0 = 0
    ENDIF

    IF TILT_SENSOR2 >= TILT_SENSOR2_VAL_REAR THEN
        MUSIC "O332dddD"
        TILT_SENSOR_STATUS.1 = 1
    ELSE
        TILT_SENSOR_STATUS.1 = 0
    ENDIF

    RETURN

SENSOR_CHECK:

    '평균 필터
    FOR B = 0 TO 9

        FOR A = 0 TO 5

            BUFFER = AD(A)

            IF A=0 THEN
                C_SENSOR1 = C_SENSOR1 + BUFFER

            ELSEIF A=1 THEN
                C_SENSOR2 = C_SENSOR2 + BUFFER

            ELSEIF A=2 THEN
                C_SENSOR3 = C_SENSOR3 + BUFFER

            ELSEIF A=3 THEN
                C_SENSOR4 = C_SENSOR4 + BUFFER

            ELSEIF A=4 THEN
                B_SENSOR1 = B_SENSOR1 + BUFFER

            ELSEIF A=5 THEN
                B_SENSOR2 = B_SENSOR2 + BUFFER

            ENDIF

        NEXT A

    NEXT  B

    C_SENSOR1 = C_SENSOR1 / 10
    C_SENSOR2 = C_SENSOR2 / 10
    C_SENSOR3 = C_SENSOR3 / 10
    C_SENSOR4 = C_SENSOR4 / 10
    B_SENSOR1 = B_SENSOR1 / 10
    B_SENSOR2 = B_SENSOR2 / 10

    IF C_SENSOR1 >= C_SENSOR1_VAL THEN
        MUSIC "O332G"
        SENSOR_STATUS.0 = 1
    ELSE
        SENSOR_STATUS.0 = 0
    ENDIF

    IF C_SENSOR2 >= C_SENSOR2_VAL THEN
        SENSOR_STATUS.1 = 1
        MUSIC "O332G"
    ELSE
        SENSOR_STATUS.1 = 0
    ENDIF

    IF C_SENSOR3 >= C_SENSOR3_VAL THEN
        MUSIC "O332E"
        SENSOR_STATUS.2 = 1
    ELSE
        SENSOR_STATUS.2 = 0
    ENDIF

    IF C_SENSOR4 >= C_SENSOR4_VAL THEN
        MUSIC "O332G"
        SENSOR_STATUS.3 = 1
    ELSE
        SENSOR_STATUS.3 = 0
    ENDIF

    IF B_SENSOR1 >= B_SENSOR1_VAL THEN
        MUSIC "O332G"
        SENSOR_STATUS.4 = 1
    ELSE
        SENSOR_STATUS.4 = 0
    ENDIF

    IF B_SENSOR2 >= B_SENSOR2_VAL THEN
        MUSIC "O332G"
        SENSOR_STATUS.5 = 1
    ELSE
        SENSOR_STATUS.5 = 0
    ENDIF

    RETURN


    '*************모션 모음*******************

INITIAL_POS:

    SPEED 7
    MOVE G6A, 102,  79, 121,  93,  ,
    MOVE G6D, 102,  79, 122,  98,  ,
    MOVE G6B,  ,  ,  ,  ,  ,
    MOVE G6C,  ,  ,  ,  ,  ,
    WAIT


    DELAY 500

    RETURN
    '================================================
기본자세:
    MOVE G6A, 102,  79, 124,  93,  ,
    MOVE G6D, 102,  79, 126,  98,  ,
    WAIT
    'DELAY 500
    RETURN
    '================================================

    '--전진 보행--
GOGO1:

    SPEED 7
    '왼발들기
    MOVE G6A, 118,  61, 105,  98, 100,
    MOVE G6D,  92,  76, 120,  96, 100,
    WAIT




    '왼발뻣어착지
    SPEED 7
    MOVE G6A, 117,  43,  91, 109, 100,
    MOVE G6D,  89,  90, 137,  86, 100,
    WAIT

    MOVE G6A, 109,  53,  97, 107, 100,
    MOVE G6D,  97, 103, 147,  85, 100,
    WAIT


    '왼발중심이동
    SPEED 4
    MOVE G6A,  96,  51,  89,  95,  ,
    MOVE G6D, 110,  89, 128,  95,  ,
    WAIT




    RETURN

GOGO2:

    '오른발들기10
    SPEED 7
    MOVE G6A,  92,  76, 120,  96,  ,
    MOVE G6D, 111,  61, 109,  96,  ,
    WAIT



    '오른발뻣어착지
    SPEED 7
    MOVE G6A,  90,  90, 137,  86, 100,
    MOVE G6D, 115,  43,  91, 108, 100,
    WAIT


    MOVE G6A,  99, 104, 149,  80, 100,
    MOVE G6D, 108,  49,  97, 111, 100,
    WAIT




    '오른발중심이동
    SPEED 4
    MOVE G6A, 112,  82, 121,  92,  ,
    MOVE G6D,  98,  51,  89,  99,  ,
    WAIT



    RETURN

    '---후진 보행----

BACK1:
    SPEED 7
    '왼발들기
    MOVE G6A, 118,  61, 105,  98,  ,
    MOVE G6D,  90,  76, 120,  96,  ,
    WAIT
    '오른발중심이동
    SPEED 4
    MOVE G6A, 111,  82, 121,  91,  ,
    MOVE G6D,  97,  51,  89,  99,  ,
    WAIT

    MOVE G6A,  97, 102, 144,  83, 100,
    MOVE G6D, 108,  56, 100, 108, 100,
    WAIT



    '오른발뻣어착지
    SPEED 7
    MOVE G6A,  89,  90, 137,  86,  ,
    MOVE G6D, 115,  43,  91, 106,  ,
    WAIT

    '오른발들기10
    SPEED 7
    MOVE G6A,  92,  76, 120,  96,  ,
    MOVE G6D, 111,  61, 109,  96,  ,
    WAIT
    '왼발중심이동
    SPEED 4
    MOVE G6A,  96,  51,  89,  95,  ,
    MOVE G6D, 110,  89, 128,  95,  ,
    WAIT
    '왼발뻣어착지
    SPEED 7
    MOVE G6A, 117,  43,  91, 106,  ,
    MOVE G6D,  89,  90, 137,  86,  ,
    WAIT
    '
    '
    '    '왼발들기
    '    SPEED 7
    '    MOVE G6A, 90, 100, 105, 110, 114
    '    MOVE G6D,112,  76, 147,  93,  94
    '    MOVE G6B, 90
    '    MOVE G6C,110
    '    WAIT
    '
    '    '오른발중심이동
    '    SPEED 7
    '    MOVE G6D,110,  76, 144, 100,  93
    '    MOVE G6A, 90, 93, 155,  71, 112
    '    WAIT
    '
    '    '오른발뻣어착지
    '    SPEED 4
    '    MOVE G6D,90,  46, 163, 110, 114
    '    MOVE G6A,110,  77, 147,  90,  94
    '    MOVE G6B, 90
    '    MOVE G6C,110,35
    '    WAIT
    '
    '    '오른발들기10
    '    SPEED 7
    '    MOVE G6A,112,  77, 147,  93, 94
    '    MOVE G6D,90, 100, 105, 110, 114
    '    MOVE G6B,110
    '    MOVE G6C,90
    '    WAIT
    '
    '    '왼발중심이동
    '    SPEED 7
    '    MOVE G6A,110,  76, 144, 100,  93
    '    MOVE G6D,90, 93, 155,  71, 112
    '    WAIT
    '
    '    '왼발뻣어착지
    '    SPEED 4
    '    MOVE G6A, 90,  46, 163, 110, 114
    '    MOVE G6D,110,  77, 147,  90,  94
    '    MOVE G6B,110,35
    '    MOVE G6C,90
    '    WAIT

    RETURN

    '------ 오른쪽 옆걸음

LEFT_GOGO:

    SPEED 3
    MOVE G6D, 97,  78, 124, 105,  ,
    MOVE G6A, 110,  78, 124, 107,  ,
    WAIT
    GOSUB 기본자세

    RETURN

    '------ 왼쪽 옆걸음

RIGHT_GOGO:

    SPEED 3
    MOVE G6A, 101,  78, 122, 105,  ,
    MOVE G6D, 110,  78, 124, 107,  ,
    WAIT
    GOSUB 기본자세


    RETURN

STAND2_1: '엎어졌을 때 일어나기

    DELAY 500

    GOSUB INITIAL_POS

    HIGHSPEED SETOFF
    PTP SETON 				
    PTP ALLON				
    SPEED 3
    '뒤로 일어나기
    MOVE G6A, 101, 151,  86,  94,  ,
    MOVE G6D, 102, 153,  88,  98,  ,
    WAIT
    MOVE G6A, 101, 151,  86,  94,  ,
    MOVE G6D,  82, 148,  98, 183,  ,
    WAIT

    SPEED 10
    MOVE G6A, 106, 151, 128,  91,  ,
    MOVE G6D, 123, 138,  98, 185,  ,
    WAIT



    DELAY 10000

    MOVE G6A, 101, 106,  36,  97,  ,
    MOVE G6D,  99, 109,  41, 104,  ,
    WAIT
    MOVE G6A, 100, 122,  35,  97,  ,
    MOVE G6D,  98, 123,  38, 103,  ,
    WAIT
    MOVE G6A,  90, 115,  53, 139,  ,
    MOVE G6D,  87, 122,  60, 134,  ,
    WAIT
    DELAY 500
    MOVE G6A, 103, 102,  60, 134,  ,
    MOVE G6D, 105, 101,  59, 148,  ,
    WAIT
    MOVE G6A, 120,  93,  82, 114,  ,
    MOVE G6D, 125,  86,  73, 144,  ,
    WAIT
    GOSUB 기본자세

    GOSUB INITIAL_POS
    SENSOR_STATUS = 0

    DELAY 500

    RETURN


STAND2_2: '자빠졌을 때 일어나기

    '앞으로 일어나기
    SPEED 5

    MOVE G6A, 102,  18, 171,  93,  ,
    MOVE G6D, 102,  16, 173,  98,  ,
    WAIT
    MOVE G6A,  97,  18, 171, 138,  ,
    MOVE G6D,  97,  16, 173, 138,  ,
    WAIT
    MOVE G6A,  99,  32, 175, 134,  ,
    MOVE G6D,  99,  32, 175, 134,  ,
    WAIT

    MOVE G6A, 127,  39, 128, 134,  ,
    MOVE G6D, 132,  39, 128, 134,  ,
    MOVE G6B,  ,  ,  ,  ,  ,
    MOVE G6C,  ,  ,  ,  ,  ,
    WAIT

    GOSUB 기본자세

    GOSUB INITIAL_POS
    SENSOR_STATUS = 0

    DELAY 500
    RETURN

    '============================================
go:
    SPEED 7
    '왼발들기
    MOVE G6A, 118,  61, 105,  94,  ,
    MOVE G6D,  90,  76, 120,  94,  ,
    WAIT

    '왼발뻣어착지
    SPEED 7
    MOVE G6A, 117,  43,  91, 109,  ,
    MOVE G6D,  86,  90, 137,  80,  ,
    WAIT

    '왼발중심이동
    SPEED 4
    MOVE G6A,  93,  51,  89,  89,  ,
    MOVE G6D, 109,  93, 135,  99,  ,
    WAIT

    '오른발들기10
    SPEED 7
    MOVE G6A,  90,  76, 120,  94,  ,
    MOVE G6D, 118,  61, 105,  94,  ,
    WAIT

    '오른발뻣어착지
    SPEED 7
    MOVE G6A,  86,  90, 137,  80,  ,
    MOVE G6D, 117,  43,  91, 109,  ,
    WAIT

    '오른발중심이동
    SPEED 4
    MOVE G6A, 107,  95, 134,  94,  ,
    MOVE G6D,  96,  51,  89,  93,  ,
    WAIT


    RETURN





    '============================================





right333:
    SPEED 6
    DIM aa AS BYTE
    FOR aa = 0 TO 6


        SPEED 3
        MOVE G6A, 101,  81, 124, 105,,
        MOVE G6D, 110,  79, 124, 107, ,
        WAIT


        GOSUB 기본자세


    NEXT aa

    RETURN
    '============================================
right222:
    SPEED 6
    DIM ab AS BYTE
    FOR ab = 0 TO 5


        SPEED 3
        MOVE G6A, 101,  80, 124, 105, 100,
        MOVE G6D, 110,  79, 125, 107, 100,
        WAIT


        GOSUB 기본자세


    NEXT ab

    RETURN
    '================================================

left333:
    SPEED 6
    DIM bb AS BYTE
    FOR bb = 0 TO 6


        SPEED 3
        MOVE G6D, 97,  78, 124, 105,  ,
        MOVE G6A, 110,  78, 124, 107,  ,
        WAIT





        GOSUB 기본자세


    NEXT bb

    RETURN
    '================================================

left222:
    SPEED 6
    DIM ba AS BYTE
    FOR ba = 0 TO 5


        SPEED 3
        MOVE G6D, 97,  78, 124, 105,  ,
        MOVE G6A, 110,  78, 124, 107,  ,
        WAIT


        GOSUB 기본자세


    NEXT ba

    RETURN
    '================================================

left30:

    SPEED 8

    MOVE G6A, 112, 127, 174, 101,  ,
    MOVE G6D, 105,  27,  73, 102,  ,
    WAIT

    GOSUB 기본자세



    RETURN

    '================================================
right30:

    SPEED 8

    MOVE G6D, 112, 127, 174, 106,  ,
    MOVE G6A, 105,  27,  73, 102,  ,
    WAIT

    GOSUB 기본자세




    RETURN

    '================================================
    '================================================

left15:

    SPEED 8

    MOVE G6A, 112, 127, 174, 101,  ,
    MOVE G6D, 105,  27,  73, 102,  ,
    WAIT
    GOSUB 기본자세

    RETURN
    '================================================
right15:

    SPEED 8

    MOVE G6D, 112, 127, 174, 106,  ,
    MOVE G6A, 105,  27,  73, 102,  ,
    WAIT
    GOSUB 기본자세
    RETURN

    '================================================