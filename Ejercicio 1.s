begin {

ld reg1 reg2 
{
	co=010000,
	nwords=1,
	reg1 = reg(25,21),
	reg2 = reg(20,16),
	{
		(MR=0, SELA=10000, SELC=10101, T9=1, LC=1, A0=1, B=1, C=0)
	}
}

ldi reg val 
{
	co=010010,
	nwords=1,
	reg = reg(25,21),
	val = inm(15,0),
	{
		(SIZE=1111, OFFSET=0, T3=1, MR=0, SELC=10101, LC=1, A0=1, B=1, C=0)
	}
}

ld reg1 (reg2)
{
	co=010011,
	nwords=1,
	reg1=reg(25,21),
	reg2=reg(20,16),
	{
		(MR=0, SELA=10000, T9=1, C0=1)
		(TA=1, R=1, BW=11, M1=1, C1=1)
		(MR=0, SELC=10101, T1=1, LC=1, A0=1, B=1, C=0)
	}
}

add_a reg
{
	co=011000,
	nwords=1,
	reg = reg(25,21),
	{
		(SELA=10101, MR=0, MA=0, MB=11, SELCOP=1100, MC=1, T6=1,C4=1),
		(SELB=00100, MR=1, MA=1, MB=00, SELCOP=1010, MC=1, T6=1, SELC=00100, SELP=11, M7=1, C7=1, LC=1, A0=1, B=1, C=0)
	}
}

addi_a val
{
	co=011010,
	nwords=1,
	val=inm(15,0)
	{
		(SIZE=01111, OFFSET=00000, SE=1, T3=1, C5=1)
		(MR=1, SELA=100, MB=01, MC=1, SELCOP=1010, T6=1, SELC=100, LC=1, SELP=11, M7=1, C7=1, A0=1, B=1, C=0)
	}
}

inc reg 
{
	co=011100,
	nwords=1,
	reg = reg(25,21),
	{
		(MR=0, SELA=10101, MA=0, MB=11, MC=1, SELCOP=1010, SELC=10101, SELP=11, M7=1, C7=1, LC=1, T6=1, A0=1, B=1, C=0)
		
	}
}

dec reg
{
	co=011101,
	nwords=1,
	reg=reg(25,21),
	{
		(MR=0, SELA=10101, MA=0, MB=11, MC=1, SELCOP=1011, T6=1, SELC=10101, LC=1, SELP=11, M7=1, C7=1, A0=1, B=1, C=0)
	}
}

jp val 
{
	co=110000,
	nwords=1,
	val = inm(15,0),
	{
		(T2=1, C4=1),
		(SE=1, OFFSET=0, SIZE=10000, T3=1, C5=1),
		(MA=1, MB=1, MC=1, SELCOP=1010, T6=1, C2=1, A0=1, B=1, C=0)
	}
}

jpz val
{
	co=110011,
	nwords=1,
	val=inm(15,0),
	{
			(A0=0, B=1, C=110, MADDR=backfetch)
			(T2=1, C4=1),
			(SE=1, OFFSET=0, SIZE=10000, T3=1, C5=1),
			(MA=1, MB=1, MC=1, SELCOP=1010, T6=1, C2=1, A0=1, B=1, C=0)
		backfetch:
			(A0=1, B=1, C=0)
	}
}

call val 
{
	co=100001,
	nwords=1,
	val = inm(15,0),
	{
		(SELA=11101, MR=1, MA=0, MB=10, MC=1, SELCOP=1011, T6=1, SELC=11101, LC=1, C0=1)
		(T2=1, M1=0, C1=1),		
		(TA=1, BW=11, TD=1, W=1, SIZE=10000,OFFSET=0, T3=1, C2=1, A0=1, B=1, C=0)		
	}
}

ret
{
	co=100010,
	nwords=1,
	{
		(MR=1, SELA=11101, T9=1, C0=1, MA=0, MB=10, SELCOP=1010, MC=1, C6=1)
		(TA=1, R=1, BW=11, M1=1, C1=1, T7=1, MR=1, SELC=11101, LC=1)
		(T1=1, M2=0, C2=1, A0=1, B=1, C=0)
	}
}

halt 
{
	co=100011,
	nwords=1,
	{
    (SELA=1, SELB=1, SELCOP=1011, MR=1, MC=1, T6=1, C2=1, A0=1, B=1, C=0)	
    
	}
}

push reg
{
	co=100100,
	nwords=1,
	reg=reg(25,21),
	{
		(MR=1, SELA=11101, MA=0, MB=10, SELCOP=1011, MC=1, T6=1, SELC=11101, LC=1, C0=1)
		(MR=0, SELA=10101, T9=1, M1=0, C1=1)
		(TA=1, TD=1, W=1, BW=11, A0=1, B=1, C=0)
	}
}

pop reg1 
{
	co=100101,
	nwords=1,
	reg1 = reg(25,21),
	{
		(SELA=11101, MR=1, T9=1, C0=1, MA=0, MB=10, MC=1, SELCOP=1010, C6=1),		
		(TA=1, BW=11, R=1, M1=1, C1=1, SELC=11101, MR=1, T7=1, LC=1),		
		(T1=1, SELC=10101, MR=0, LC=1, A0=1, B=1, C0=1)				
	}
}

registers
{
	0=$zero,
	1=$at,
	2=$v0,
	3=$v1,
	4=$a0,
	5=$a1,
	6=$a2,
	7=$a3,
	8=$t0,
	9=$t1,
	10=$t2,
	11=$t3,
	12=$t4,
	13=$t5,
	14=$t6,
	15=$t7,
	16=$s0,
	17=$s1,
	18=$s2,
	19=$s3,
	20=$s4,
	21=$s5,
	22=$s6,
	23=$s7,
	24=$t8,
	25=$t9,
	26=$k0,
	27=$k1,
	28=$gp,
	29=$sp (stack_pointer),
	30=$fp,
	31=$ra
}