      SUBROUTINE DELTAS(DV1,DVF,RI,RF)
      IMPLICIT NONE
      	
      DOUBLE PRECISION DV1,MI,PI,DT,RE, RI, RF, VC1,XUM,
	&RAZAO,DVF,RA

	
      MI   = 3.9860320D+14
      PI   = 4.D+0*DATAN(1.D+0)

 
	DT   = 1.0D+00			  !PASSO DE INTEGRACAO
	RE   = 6378165.0D+00	  !RAIO DA TERRA EM METROS
	
	
	!PRINT*,"DIGITE A ORBITA FINAL EM KM"
	!READ*,RA
	
	RF=350000+RE	!raio final

      RI=500000+RE	!raio inicial
	
	VC1=DSQRT(MI/RI)
	
      
	DV1=VC1*DSQRT((2*RF/RI)/(1+(RF/RI)))-VC1
	
     
     
      RAZAO=(RF/RI)
	!INTERNO= (MI*2./700000)  - (MI*1./700000)
      DVF=VC1*DSQRT(1./RAZAO)-VC1*DSQRT(2./(RAZAO*(1.+RAZAO)))




	
	

	
     
   
	
     
     
      RETURN
	END
	 