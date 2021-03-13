	SUBROUTINE O(T,N,X,XP) 
C 
C**************************************************************************************************
C     THIS SUBROTINA DEVIDO A FORCA CENTRAL.
C************************************************************************************************** 
C     
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)

      Double precision X(N),XP(N),PO,MI,RE, RHO, A, M, CD, R0,H,VR


	R0=1.225D+00
	CD=1.5D+00
	
	A=10
 
      M=1200.0D+00

      H = 7800.0D+00
      MI = 3.9860320D+14
	RE = 6378165.0D+00	                 !RAIO DA TERRA  (M)

	PO = DSQRT(X(1)**2+X(2)**2+X(3)**2)	 !POSICAO RELATIVA DO VEICULO
	
	RHO=R0*DEXP(-(PO-RE)/H)
	VR=SQRT((X(4)+WT*X(2))**2+(X(5)-WT*X(1))**2+X(6)**2)

C     ********************************************************************************

	ADX =-0.5*rho*A*CD*VR*(X(4)+WT*X(2))/M
	ADY	=-0.5*rho*A*CD*VR*(X(5)-WT*X(1))/M
	ADZ =-0.5*rho*A*CD*VR*X(6)/M


      XP(1) =  X(4)		 			      !VELOC.  ORBITAL NA DIRECAO X
      XP(2) =  X(5)					      !VELOC.  ORBITAL NA DIRECAO Y
      XP(3) =  X(6)                         !VELOC.  ORBITAL NA DIRECAO Z

	XP(4) = -MI*X(1)/(PO**3)+adx              !ACELER. ORBITAL NA DIRECAO X
      XP(5) = -MI*X(2)/(PO**3)+ady              !ACELER. ORBITAL NA DIRECAO Y
      XP(6) = -MI*X(3)/(PO**3)+adz              !ACELER. ORBITAL NA DIRECAO Z

C     ********************************************************************************	   
	
      RETURN
      END	


