      SUBROUTINE TRANS(T,N,X,RI,RF,DV1)
      IMPLICIT NONE
      
	
	INTEGER N
	
      DOUBLE PRECISION T,X(N),MI,PI,DT,RE,P,POS,VEL, RI, RF, 
	&PTRANS,DV1

	
      MI   = 3.9860320D+14
      PI   = 4.D+0*DATAN(1.D+0)

 
	DT   = 1.0D+00			  !PASSO DE INTEGRACAO
	RE   = 6378165.0D+00	  !RAIO DA TERRA EM METROS
	


	

	OPEN(1, FILE='ORBITA.DAT')
	
C************************************************************************************
C     ORBITA INICIAL
C************************************************************************************

C	CONDICOES INICIAIS PARA UMA ORBITA CIRCULAR A 770 KM

      !X(1)=  (RE+550000.0D+00)            ! POSICAO INICIAL X EM M
	!X(2)=           0.0D+00             ! POSICAO INICIAL Y EM M
	!X(3)=           0.0D+00             ! POSICAO INICIAL Z EM M
	!X(4)=           0.0D+00             ! VELOCIDADE INICIAL X EM M/SEG
      IF (X(5)>0) THEN
	   if (dv1>0) x(5) = X(5)-DV1
	
	   if (dv1<0) x(5) = X(5)+DV1
	ENDIF
	
      IF (X(5)<0) THEN
        if (dv1>0) x(5) = X(5)+DV1
	
	  if (dv1<0)x(5) = X(5)-DV1
	ENDIF
     
	            ! VELOCIDADE INICIAL Y EM M/SEG
	!X(6)=           0.0D+00             ! VELOCIDADE INICIAL Z EM M/SEG
	          
	
      


C************************************************************************************
	
C************************************************************************************


      POS=DSQRT(X(1)**2+X(2)**2+X(3)**2)
	
       
	P = 2.*PI*DSQRT(POS**3/MI) 

	
       

	 PTRANS=P*(1./2.**(5./2.))*(1.+(RF/RI))**(3./2.)
	
      DO T=T,T+PTRANS
 	   
	 

	  
	 
	   if (x(1)>120000+re) CALL RK4(N,T,DT,X)
        if (x(1)<120000.+re)	CALL RKB(N,T,DT,X)
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
	 