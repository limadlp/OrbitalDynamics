
      PROGRAM orbita
C
	IMPLICIT NONE

      INTEGER N,NV
      DIMENSION X(6) 
	DOUBLE PRECISION X,DT,T,MI,RE,POS,PI,P,VEL,DV1,DVF,RI,RF,XUM

	N    = 6			      !NUMERO DE EQUACOES
      MI   = 3.9860320D+14
      PI   = 4.D+0*DATAN(1.D+0)

 	T    = 0.0D+00
	DT   = 1.0D+00			  !PASSO DE INTEGRACAO
	RE   = 6378165.0D+00	  !RAIO DA TERRA EM METROS

	OPEN(1, FILE='ORBITA.DAT')

C************************************************************************************
C     ORBITA INICIAL
C************************************************************************************

C	CONDICOES INICIAIS PARA UMA ORBITA CIRCULAR A 770 KM
	PRINT*,"PROGRAMA DE TRANSFERENCIA DE ORBITAS"
      PRINT*,""
	!PRINT*,"DIGITE A ORBITA INICIAL EM KM"
	!READ*,XUM
	X(1)=  500000+RE            ! POSICAO INICIAL X EM M
	X(2)=           0.0D+00             ! POSICAO INICIAL Y EM M
	X(3)=           0.0D+00             ! POSICAO INICIAL Z EM M
	X(4)=           0.0D+00             ! VELOCIDADE INICIAL X EM M/SEG
	!	7467.43948	
	X(5)=             DSQRT(MI/X(1))        ! VELOCIDADE INICIAL Y EM M/SEG
	X(6)=           0.0D+00             ! VELOCIDADE INICIAL Z EM M/SEG

C************************************************************************************
		
	
      WRITE(*,*)
	WRITE(*,*)
C************************************************************************************

	
	NV=1
	P = 2.*PI*X(1)/DSQRT(MI/X(1))
	
      DO T=T,NV*P
 	   
	   CALL RK4(N,T,DT,X)

         POS=(DSQRT(X(1)**2+X(2)**2+X(3)**2)-RE)/1000
         VEL=(DSQRT(X(4)**2+X(5)**2+X(6)**2))/1000
	   
        IF (POS<0.) THEN
	    		
		PAUSE "O CORPO CAIU"
	    
	    STOP
	 END IF
      
	   
	    

	        WRITE (1,10) X(1),X(2),X(3),T,POS,VEL
	END DO
	
	
C************************************************************************************


	CALL DELTAS(DV1,DVF,RI,RF)
      CALL TRANS(T,N,X,RI,RF,DV1)
	CALL SINAL(T,N,X,DVF)
	CALL DELTA2(DV1,DVF,RI,RF)
      CALL TRANS(T,N,X,RI,RF,DV1)
	CALL SINAL(T,N,X,DVF)
	CALL DELTA3(DV1,DVF,RI,RF)
      CALL TRANS(T,N,X,RI,RF,DV1)
	CALL SINAL(T,N,X,DVF)
	CALL DELTA4(DV1,DVF,RI,RF)
      CALL TRANS(T,N,X,RI,RF,DV1)
	CALL SINAL(T,N,X,DVF)





10	FORMAT(F20.8, 2X, F20.8, 2X, F20.8, 2X, F20.8, 2X, F20.8, 2X, 
     &       F20.8)

	STOP
	END	PROGRAM 

	