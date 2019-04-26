.class public sample
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; i,j,k,n,m,o:integer

.field private static i I
.field private static j I
.field private static k I
.field private static n I
.field private static m I
.field private static o I

; alpha,beta5x:real

.field private static alpha F
.field private static beta5x F

.method public <init>()V

	aload_0
	invokenonvirtual    java/lang/Object/<init>()V
	return

.limit locals 1
.limit stack 1
.end method

.method public static main([Ljava/lang/String;)V

	new RunTimer
	dup
	invokenonvirtual RunTimer/<init>()V
	putstatic        sample/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        sample/_standardIn LPascalTextIn;
	ldc	32
	putstatic	sample/i I
	getstatic	sample/i I
	putstatic	sample/j I
	ldc	2
	ineg
	ldc	3
	getstatic	sample/j I
	imul
	iadd
	putstatic	sample/i I
	ldc	9.3
	putstatic	sample/alpha F
	getstatic	sample/alpha F
	putstatic	sample/beta5x F
	getstatic	sample/alpha F
	ldc	3.7
	fdiv
	getstatic	sample/alpha F
	ldc	2.88
	fmul
	fsub
	putstatic	sample/beta5x F
	ldc	8.45
	getstatic	sample/alpha F
	ldc	9.12
	fadd
	fmul
	putstatic	sample/beta5x F
	ldc	2
	putstatic	sample/m I
	ldc	3
	getstatic	sample/m I
	ldc	1
	iadd
	putstatic	sample/m I
	getstatic	sample/n I
	ldc	2
	ldc	7
	putstatic	sample/o I

	getstatic     sample/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
