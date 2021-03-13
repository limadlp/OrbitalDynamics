      SUBROUTINE QUEDA(T,N,X,DVF)
      IMPLICIT NONE
      
	
	INTEGER N,NV
	
      DOUBLE PRECISION T,X(N),MI,PI,DT,RE,POS,VEL,DVF,P
	

	
      MI   = 3.9860320D+14
      PI   = 4.D+0*DATAN(1.D+0)

 
	DT   = 1.0D+00			  !PASSO DE INTEGRACAO
	RE   = 6378165.0D+00	  !RAIO DA TERRA EM METROS




	
	OPEN(1, FILE='ORBITA.DAT')
	print*,x(5)
	pause
C************************************************************************************
C     ORBITA INICIAL
C************************************************************************************

C	CONDICOES INICIAIS PARA UMA ORBITA CIRCULAR A 770 KM

      X(1)=  X(1)            ! POSICAO INICIAL X EM M
	X(2)=  X(2)                      ! POSICAO INICIAL Y EM M
	X(3)=  X(3)                      ! POSICAO INICIAL Z EM M
	X(4)=  X(4)                     ! VELOCIDADE INICIAL X EM M/SEG
	
      IF (X(5)>0) THEN
	   if (dvF>0) x(5) = X(5)-DVF
	
	   if (dvF<0) x(5) = X(5)+DVF
	ENDIF
	
      IF (X(5)<0) THEN
        if (dvF>0) x(5) = X(5)+DVF
	
	  if (dvF<0)x(5) = X(5)-DVF
	ENDIF
	X(6)=  X(6)                     ! VELOCIDADE INICIAL Z EM M/SEG
	          
	
    
  

C************************************************************************************
	PRINT *, 'AGUARDE, ESTOU CALCULANDO ...'
	WRITE(*,*)
	WRITE(*,*)
C************************************************************************************

      POS=DSQRT(X(1)**2+X(2)**2+X(3)**2)
	
      NV=30 
	P = 2.*PI*DSQRT(POS**3/MI) 

      DO T=T,T+P*NV
 	   
	   CALL RK4(N,T,DT,X)

         POS=(DSQRT(X(1)**2+X(2)**2+X(3)**2)-RE)/1000
         VEL=(DSQRT(X(4)**2+X(5)**2+X(6)**2))/1000
	   
        IF (POS<0.) THEN
	    		
		PAUSE "O CORPO CAIU"
	    
	    STOP
	 END IF
          
	    
	   

	   
	    

	        WRITE (1,10) X(1),X(2),X(3),T,POS,VEL
	END DO

      

	
	 

	
10	FORMAT(F20.8, 2X, F20.8, 2X, F20.8, 2X, F20.8, 2X, F20.8, 2X, 
     &       F20.8)



     
     
   
	
     
     
      RETURN
	END
	 