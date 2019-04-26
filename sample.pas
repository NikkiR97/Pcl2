PROGRAM sample;

VAR
    i, j, k, n, m, o : integer;
    alpha, beta5x : real;
    
BEGIN
    i := 32;
    j := i;
    i := -2 + 3*j;

    alpha := 9.3;
    beta5x := alpha;
    beta5x := alpha/3.7 - alpha*2.88;
    beta5x := 8.45*(alpha + 9.12);

    m := 2;    

	LOOP(3) 
	BEGIN
	m := m + 1;
	END;

	IF(n==2)
	BEGIN
	o := 7;
	END;	
    
END.
