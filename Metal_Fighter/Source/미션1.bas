
'================================================
' ��Ű20090909
'================================================

'================================================
' ���� ����
DIM A AS BYTE
DIM MODE AS BYTE
DIM ���_mode AS BYTE

'================================================
'�������� ����
PTP SETON 				'�����׷캰 ���������� ����
PTP ALLON				'��ü���� ������ ���� ����

'================================================
' �� �׷캰 ���� ���� ����

DIR G6A,1,0,0,1,0,0		'���ʹ�
DIR G6D,0,1,1,0,1,0		'�����ʹ�
'==================
DIR G6B,1,1,1,1,1,1		'������
DIR G6C,0,0,0,0,0,0		'��������

DELAY 500				'�ʱ�ð�����
'================================================
' �ʱ���ġ �ǵ�� (1:�ǵ�����, 0:�������� )
GETMOTORSET G6A,1,1,1,1,1,0
GETMOTORSET G6B,1,1,1,0,0,0
GETMOTORSET G6C,1,1,1,0,0,0
GETMOTORSET G6D,1,1,1,1,1,0
'================================================

���_mode = 0
'================================================
'�ӵ� 1 ~ 15, "hihghspeed seton" ������ * 3��
SPEED 5
'================================================
'���� "������"
TEMPO 230
MUSIC "cde"
'================================================
'�������ͻ�뼱��
MOTOR G24
'================================================
GOSUB �⺻�ڼ�

'���η�ƾ���� ����
GOTO INIT_CONECT
''**********************************************
' �ʱ� START ��ư�� ������ ���η�ƾ����
INIT_CONECT:

    ERX 4800, A, INIT_CONECT

    IF A <> 16  THEN GOTO INIT_CONECT

     'START ��ư�̸� �λ縦 �ѹ�

    GOTO MAIN


MAIN:

    ERX 4800, A, MAIN

    ON A GOTO MAIN,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16,key17,key18,key19,key20,key21,key22,key23,key24,key25,key26,key27,key28,key29,key30,key31,key32,key33,key34,key35,key36,key37,key38,key39,key40

    GOTO MAIN
    '*******************************************
    '		MAIN_RF �󺧷� ����
    '*******************************************
KEY1: '��
    IF MODE =0 THEN
        GOSUB  �����ϱ�3
    ENDIF

    GOTO MAIN
KEY2: '��
    IF MODE = 0 THEN
        GOSUB ���������ε���
    ENDIF

    GOTO MAIN
KEY3: '��
    IF MODE =0 THEN
        GOSUB �ڷ�����
    ENDIF
    GOTO MAIN
KEY4: '��
    IF MODE = 0 THEN
        GOSUB ���ʿ����ε���
    ENDIF
    GOTO MAIN
KEY5: '��
    IF MODE =0 THEN
    
        GOSUB ���
    ENDIF

    GOTO MAIN
KEY6: '��
    IF MODE =0 THEN
        GOSUB ��������
    ENDIF	

    GOTO MAIN
KEY7: 'X
    IF MODE =0 THEN
        GOSUB �ɱ�
        ELSE 
        GOSUB �⺻�ڼ�
    ENDIF

    GOTO MAIN
KEY8: '��
    IF MODE =0 THEN
        GOSUB ������
    ENDIF

    GOTO MAIN
KEY9: 'L2
    IF mode = 0 THEN
        SPEED 10
        GOSUB �����㸮�⺻
    ELSE
        SPEED 10
        GOSUB �⺻�ڼ�
    ENDIF

    GOTO MAIN
KEY10: 'R2
    IF MODE =0 THEN
        GOSUB �������㸮�⺻
    ENDIF

    GOTO MAIN
KEY11: 'L1
    IF MODE =0 THEN
        GOSUB �����㸮������
    ENDIF


    GOTO MAIN
KEY12: 'R1
    IF MODE =0 THEN
        GOSUB �������㸮������
    ENDIF



    GOTO MAIN
KEY13: 'SELECT
    IF MODE =0 THEN
        GOSUB ����Ǯ��
    ENDIF
    GOTO MAIN
KEY14: 'L-PUSH

    GOTO MAIN
KEY15: 'R-PUSH

    GOTO MAIN
KEY16: 'START

    GOTO MAIN
KEY17: '�� + ��
    IF MODE =0 THEN
        GOSUB ��� 
    ENDIF	
    GOTO MAIN
KEY18: '�� + ��

    GOTO MAIN
KEY19: '�� + X

    GOTO MAIN
KEY20: '�� + ��

    GOTO MAIN
KEY21: '�� + ��

    GOTO MAIN
KEY22: '�� + ��
    IF MODE = 0 THEN
        GOSUB ��������
    ENDIF	
    GOTO MAIN
KEY23: '�� + X

    GOTO MAIN
KEY24: '�� + ��
    IF MODE = 0 THEN
        GOSUB �������Ͼ��
    ENDIF	

    GOTO MAIN
KEY25: '�� + ��

    GOTO MAIN
KEY26: '�� + ��

    GOTO MAIN
KEY27: '�� + X
    IF MODE =0 THEN
        GOSUB ���ȳ�����
    ENDIF	
    GOTO MAIN
KEY28: '�� + ��

    GOTO MAIN
KEY29: '�� + ��

    GOTO MAIN
KEY30: '�� + ��

    IF MODE = 0 THEN
        GOSUB �ڷ��Ͼ��
    ENDIF	

    GOTO MAIN
KEY31: '�� + X

    GOTO MAIN
KEY32: '�� + ��
    IF MODE = 0 THEN
        GOSUB ��������
    ENDIF	
    GOTO MAIN
KEY33: 'L2 + L2


    GOTO MAIN
KEY34: 'L1 + L1

    GOTO MAIN
KEY35: 'L1 + L2
    IF MODE = 0 THEN
        GOSUB �����ʿ�����4
    ENDIF	
    GOTO MAIN

KEY36: 'R1 + R2

    GOSUB �����ʿ�����4

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
�⺻�ڼ�:
    SPEED 8
    MOVE G6A,  99,  94, 111, 113, 100, 100
    MOVE G6D,  99,  94, 111, 113, 100,
    MOVE G6B, 100,  15, 75,  ,  ,
    MOVE G6C, 100,  15, 75, 120 ,  ,

    WAIT
    mode = 0
    RETURN
    '**************************************************
�����ڼ�:

    MOVE G6A, 99, 108,  88, 121, 100
    MOVE G6D, 99, 108,  88, 121, 100
    MOVE G6B, 100,  20, 90
    MOVE G6C, 100,  20, 90,120
    WAIT
    mode = 0
    SPEED 10
    RETURN
    '**************************************************
�����ڼ�:

    SPEED 10
    MOVE G6A,100, 151,  23, 140, 101, 100,
    MOVE G6D,100, 151,  22, 140, 101, 
    MOVE G6B,100,  30,  80, 
    MOVE G6C,100,  30,  80, 120, 
    WAIT
    mode = 1
    RETURN
    '**************************************************
�λ�:
    SPEED 8
    MOVE G6A, 100,  58, 135, 150, 100, 100
    MOVE G6D, 100,  58, 135, 150, 100, 100
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76, 120 ,  ,
    WAIT
    DELAY 1000

    SPEED 10
    GOSUB �⺻�ڼ�

    RETURN
    '************************************************
  

�ڷ��Ͼ��:

    SPEED 15
    MOVE G6A,100, 130, 120,  80, 110,
    MOVE G6D,100, 130, 120,  80, 110,
    MOVE G6B,150, 160,  10
    MOVE G6C,150, 160,  10
    WAIT

    SPEED 10
    MOVE G6A, 80, 155,  85, 150, 150,
    MOVE G6D, 80, 155,  85, 150, 150,
    MOVE G6B,185,  40, 60
    MOVE G6C,185,  40, 60
    WAIT

    SPEED 15
    MOVE G6A,  75, 165,  55, 165, 155, 100
    MOVE G6D,  75, 165,  55, 165, 155,
    MOVE G6B, 169,  30,  39,  ,  ,
    MOVE G6C, 169,  30,  39,  ,  ,

    WAIT

    SPEED 12



    MOVE G6A,  60, 165,  30, 165, 155, 100
    MOVE G6D,  60, 165,  30, 165, 155,
    MOVE G6B, 142,  70,  80,  ,  ,
    MOVE G6C, 142,  70,  80,  ,  ,
    WAIT
    
    SPEED 10
    MOVE G6A,  60, 165,  25, 160, 145, 100
    MOVE G6D,  60, 165,  25, 160, 145,
    MOVE G6B, 142,  40, 103,  ,  ,
    MOVE G6C, 142,  40, 103,  ,  ,

    WAIT
    MOVE G6A,  71, 160,  25, 133, 132, 100
    MOVE G6D,  76, 164,  24, 133, 120,
    MOVE G6B, 102,  30, 76,  ,  ,
    MOVE G6C, 104,  30, 72,  ,  ,
    WAIT

    SPEED 8
    MOVE G6A, 100, 155,  25, 140, 100, 100
    MOVE G6D, 100, 155,  25, 140, 100,
    MOVE G6B, 103,  30, 73,  ,  ,
    MOVE G6C, 103,  30, 73,  ,  ,

    WAIT


    GOSUB �⺻�ڼ�

    RETURN
    '************************************************
�����δ���:

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
    GOSUB �⺻�ڼ�

    RETURN
    '**********************************************
�������Ͼ��:



    SPEED 15
    MOVE G6A,100, 10,  83, 140, 100, 100
    MOVE G6D,100, 10,  83, 140, 100,
    MOVE G6B, 188, 185,  82,  ,  ,
    MOVE G6C, 188, 187,  95,  ,  ,

    WAIT

    SPEED 15
    MOVE G6A, 100, 126,  60,  50, 100, 100
    MOVE G6D, 100, 126,  60,  50, 100,
    MOVE G6B, 188, 185,  82,  ,  ,
    MOVE G6C, 188, 187,  95,  ,  ,


    WAIT

    SPEED 12
    MOVE G6A, 100, 165,  70,  16, 100, 100
    MOVE G6D, 100, 165,  69,  21, 100,
    MOVE G6B, 188, 190,  10,  ,  ,
    MOVE G6C, 188, 190,  10,  ,  ,

    WAIT

    MOVE G6A, 100, 165,  70,  16, 100, 100
    MOVE G6D, 100, 165,  69,  21, 100,
    MOVE G6B, 112,  30,  60,  ,  ,
    MOVE G6C, 112,  30,  60,  ,  ,
    WAIT
    SPEED 10
    MOVE G6A, 100, 165,  45,  90, 100, 100
    MOVE G6D, 100, 165,  45,  90, 100,
    MOVE G6B, 112,  30,  60,  ,  ,
    MOVE G6C, 112,  30,  60,  ,  ,
    WAIT

    SPEED 10
    GOSUB �⺻�ڼ�

    RETURN
    '******************************************
�ڷδ���:

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
    GOSUB �⺻�ڼ�

    RETURN

    '******************************************************
�����δ���:


  
    GOSUB �⺻�ڼ�

    RETURN

    '**********************************************
�ڷδ���:

   
    GOSUB �⺻�ڼ�
    RETURN
    '*************************************************

���ʿ�����3:
    SPEED 6
    HIGHSPEED SETON
    MOVE G6A,  81, 113,  84, 114, 111,
    MOVE G6D,  98, 106, 104, 108, 125,
    MOVE G6B, 101,  29,  87,  ,  ,
    MOVE G6C, 101,  46,  87,  ,  ,
    WAIT

    MOVE G6A,  90, 107,  99, 111, 103,
    MOVE G6D, 105, 107,  99, 111, 107,
    MOVE G6B, 101,  24,  87,  ,  ,
    MOVE G6C, 101,  24,  87,  ,  ,
    WAIT

    HIGHSPEED SETOFF
    ERX 4800, A, ���ʿ�����3

    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT

    RETURN

    '================================================

    '================================================
���ʿ����ε���:
    SPEED 12
    GOSUB �⺻�ڼ�
    WAIT
�����ʿ�����4:
    SPEED 12
    'HIGHSPEED SETON


    ' ��20���ʿ����̰� ���ʹ߸� 90���ο�����

    WAIT
    MOVE G6A,  78, 106,  94, 116, 125, 100
    MOVE G6D,  87,  93, 107, 115, 109,
    MOVE G6B, 100,  30, 84,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT
    MOVE G6A, 100,  98, 110, 112, 101, 100
    MOVE G6D, 100,  98, 110, 112,  98,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    ' HIGHSPEED SETOFF
    ERX 4800, A, �����ʿ�����4

    GOSUB �⺻�ڼ�

    RETURN

���������ε���:
�����ʿ�����4:

    SPEED 12
    GOSUB �⺻�ڼ�
    WAIT
sss:
    SPEED 12
    'HIGHSPEED SETON
    MOVE G6A,  91,  91, 123, 104, 116, 100
    MOVE G6D,  89, 104, 103, 112, 117,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    MOVE G6A, 100,  95, 102, 124, 105,  100
    MOVE G6D, 100,  91, 108, 121, 101,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT


    ERX 4800, a, sss

    GOSUB �⺻�ڼ�

    RETURN





�����ʿ�����3:
    SPEED 15
    'HIGHSPEED SETON

    MOVE G6A,  98, 106, 104, 108, 129, 100
    MOVE G6D,  84, 113,  84, 114, 111,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT

    MOVE G6A, 105, 107,  99, 111, 103, 100
    MOVE G6D,  94, 107,  99, 111, 103,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT

    ' HIGHSPEED SETOFF
    ERX 4800, A, �����ʿ�����3

    GOSUB �⺻�ڼ�
    WAIT

    RETURN
    '================================================


�ٸ�������:
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
��������:

    SPEED 15
    MOVE G6A,  89,  66, 110, 135, 111, 100
    MOVE G6D,  93, 121, 107,  89, 103,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    MOVE G6A,  86,  66, 110, 135, 111, 100
    MOVE G6D,  90, 121, 107,  89, 103,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    GOSUB �⺻�ڼ�
    RETURN
    '**********************************************

������2:

    SPEED 15

    MOVE G6A, 100, 157,  87,  71, 105,
    MOVE G6D,  97,  52,  98, 163,  98,
    MOVE G6B, 100,  30,  80,  ,  ,
    MOVE G6C, 100,  30,  80,  ,  ,
    WAIT

    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT

    RETURN

    '**********************************************

������:


    SPEED 15
    MOVE G6A,  96, 120, 110,  88, 104, 100
    MOVE G6D,  91,  68, 106, 138, 109,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    MOVE G6A,  93, 120, 110,  88, 104, 100
    MOVE G6A,  93, 120, 110,  88, 104, 100
    MOVE G6D,  88,  68, 106, 138, 109,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT
    GOSUB �⺻�ڼ�
    RETURN
    '**********************************************
��������2:

    SPEED 15

    MOVE G6D, 100, 157,  87,  71, 105,
    MOVE G6A,  97,  52,  98, 163,  98,
    MOVE G6B, 100,  30,  80,  ,  ,
    MOVE G6C, 100,  30,  80,  ,  ,
    WAIT

    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80, 100, 100, 100
    MOVE G6C,100,  30,  80, 100, 100, 100
    WAIT

    RETURN

    '**********************************************

�����ϱ�3:

    SPEED 8
    MOVE G6A,  98,  93, 111, 117, 102, 100
    MOVE G6D,  97,  93, 111, 117, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    SPEED 8
    'HIGHSPEED SETON




fast_run_1:

    MOVE G6A,  99,  85, 108, 133, 102, 100
    MOVE G6D,  99,  95, 109, 111, 101,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    MOVE G6A,  99,  95, 109, 111, 101, 100
    MOVE G6D,  99,  85, 108, 133, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT



    ERX 4800, A, fast_run_1
    SPEED 6
    MOVE G6A,  99,  95, 109, 111, 101,  100
    MOVE G6D,  99,  71, 117, 127, 100,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    GOSUB �⺻�ڼ�

    WAIT



    RETURN


    '======================================================
�����ϱ�:

    SPEED 6

    MOVE G6A, 100,  94, 111, 110, 102, 100
    MOVE G6D, 100,  88, 107, 136, 101,
    MOVE G6B, 105,  30, 74,  ,  ,
    MOVE G6C,  95,  30, 76,  ,  ,

    WAIT
    MOVE G6A, 100,  88, 107, 135, 101, 100
    MOVE G6D, 100,  94, 111, 110, 102,
    MOVE G6B,  95,  30, 76,  ,  ,
    MOVE G6C, 105,  30, 74,  ,  ,
    WAIT

    ERX 4800, a, �����ϱ�
    MOVE G6A, 100,  79, 107, 128, 101, 100
    MOVE G6D, 100,  99, 106, 113, 100,
    MOVE G6B,  95,  30, 76,  ,  ,
    MOVE G6C, 105,  30, 74,  ,  ,
    WAIT


    MOVE G6A,  98,  94, 111, 115, 102, 100
    MOVE G6D,  97,  94, 111, 115, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    RETURN


    '======================================================

�ڷ�����:

    MOVE G6A,  91,  91, 111, 113, 106
    MOVE G6D,  92,  91, 111, 113, 106
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
ssw:
    SPEED 12
    'HIGHSPEED SETON

    MOVE G6A,  92,  82, 104, 132, 106, 100
    MOVE G6D,  95, 112,  99, 106, 103,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,


    WAIT
    MOVE G6A,  95, 112,  99, 106, 103, 100
    MOVE G6D,  92,  82, 104, 132, 106,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,

    WAIT

    ERX 4800, a, ssw

    GOSUB �⺻�ڼ�
    WAIT


    RETURN
    '================================================
�ڷΰȱ�:

    SPEED 15
    MOVE G6A, 103,  94, 111, 115, 102, 100
    MOVE G6D,  92,  94, 111, 115, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
�ڷΰȱ�1:
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


    ERX 4800, A, �ڷΰȱ�1
    SPEED 12
    MOVE G6A,  98,  94, 111, 115, 102, 100
    MOVE G6D,  97,  94, 111, 115, 102,
    MOVE G6B, 100,  30, 74,  ,  ,
    MOVE G6C, 100,  30, 76,  ,  ,
    WAIT
    RETURN
    '================================================





�������㸮������:
    SPEED 15
MOVE G6A,  99,  94, 111, 113, 100, 60
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 100,  15,  75,  ,  ,  
MOVE G6C, 100,  15,  75,  ,  ,  

   WAIT
  
    WAIT

    RETURN
    '**************************************************
    '======================================================




�������㸮�⺻:
 SPEED 8
    MOVE G6A,  99,  94, 111, 113, 100, 100
    MOVE G6D,  99,  94, 111, 113, 100,
    MOVE G6B, 100,  15, 75,  ,  ,
    MOVE G6C, 100,  15, 75, 120 ,  ,

    WAIT
    RETURN
    '**************************************************
�����㸮������:
MOVE G6A,  99,  94, 111, 113, 100, 145
MOVE G6D,  99,  94, 111, 113, 100,  
MOVE G6B, 100,  15,  75,  ,  ,  
MOVE G6C, 100,  15,  75,  ,  ,  

   WAIT
    RETURN

    '**************************************************
    '======================================================

�����㸮�⺻:
     SPEED 8
    MOVE G6A,  99,  94, 111, 113, 100, 100
    MOVE G6D,  99,  94, 111, 113, 100,
    MOVE G6B, 100,  15, 75,  ,  ,
    MOVE G6C, 100,  15, 75, 120 ,  ,

    WAIT
    RETURN

    '**************************************************
    '================================================
��������:
    SPEED 15
    MOVE G6A,  93,  90, 109, 115, 102, 100
    MOVE G6D, 103,  91, 111, 115, 105,
    MOVE G6C, 107,  55, 156,  ,  ,
    MOVE G6B,  12,  95, 127,  ,  ,

    WAIT
    HIGHSPEED SETON
    SPEED  15
    MOVE G6D,  64,  93, 114, 115, 143,
    MOVE G6A,  99, 113,  73, 135,  95, 100
    MOVE G6C, 107,  55, 156,  ,  ,
    MOVE G6B,  12,  95,  10,  ,  ,

    WAIT


    DELAY 400
    SPEED 10

    GOSUB �⺻�ڼ�
    HIGHSPEED SETOFF
    WAIT


    RETURN

    '================================================
    '================================================
��������:
    SPEED 15
    MOVE G6A, 103,  91, 111, 115, 105, 100
    MOVE G6D,  93,  90, 109, 115, 102,
    MOVE G6B, 107,  55, 156,  ,  ,
    MOVE G6C,  12,  95, 127,  ,  ,


    WAIT
    HIGHSPEED SETON
    SPEED  15
    MOVE G6A,  64,  93, 114, 115, 143, 100
    MOVE G6D,  99, 113,  73, 135,  95,
    MOVE G6B, 107,  55, 156,  ,  ,
    MOVE G6C,  12,  95,  10,  ,  ,


    WAIT


    DELAY 400
    SPEED 10

    GOSUB �⺻�ڼ�
    HIGHSPEED SETOFF
    WAIT



    RETURN

    '================================================



�տ����ʴ밢����ġ:
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
�տ��ʴ밢����ġ:


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

�¿�Ѿ�߸�����:
    
    RETURN

    '****************************************************

����Ͼ��:
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
    GOSUB �⺻�ڼ�

    WAIT

    RETURN

    '**************************************************
�ɱ�:

    HIGHSPEED SETON
    SPEED  6
   MOVE G6A,  93, 140,  23, 151, 107, 100
MOVE G6D,  85, 156,  22, 132, 115,  
MOVE G6B, 100,  30,  74,  ,  ,  
MOVE G6C, 100,  30,  76,  ,  ,  
WAIT

    ' HIGHSPEED SETOFF
    ' ERX 4800, a, ����ڼ�
    'SPEED 15
    'GOSUB �⺻�ڼ�
    ' WAIT
    RETURN
    '**************************************************

��������ġ2:
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
���ȳ�����:
    HIGHSPEED SETON
    SPEED 10
    MOVE G6A,  85, 122,  62, 137, 111, 100
    MOVE G6D,  86, 122,  62, 139, 116,
    MOVE G6B, 107, 150,  10,  ,  ,
    MOVE G6C, 107, 150,  10,  ,  ,

    WAIT

    MOVE G6A,  85, 122,  62, 137, 111, 100
    MOVE G6D,  86, 122,  62, 139, 116,
    MOVE G6B, 107,  61,  10,  ,  ,
    MOVE G6C, 107,  61,  10,  ,  ,

    WAIT
    HIGHSPEED SETOFF
    RETURN

    '**************************************************
��������������ε�����:
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

    '�ڷ��ȴٸ������
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
���:
MOVE G6A,  97, 140,  36, 146,  99,  99
MOVE G6D, 100, 138,  33, 147, 100,  
MOVE G6B, 100,  15,  75,  ,  ,  
MOVE G6C, 100,  15,  75,  ,  ,  



����:

    
    GOSUB �⺻�ڼ�

    RETURN




    '==============================================================
����������ġ:
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


    GOSUB �⺻�ڼ�


    RETURN

    '==============================================================

����Ǯ��:
    MUSIC "cccc"

����Ǯ��1:
    MOTOROFF G24

    ERX 4800, A, ����Ǯ��1
    TEMPO 230
    MUSIC "cdef"
    SPEED 5
    MOTOR G24


    GOSUB �⺻�ڼ�

    RETURN

    '==============================================================
