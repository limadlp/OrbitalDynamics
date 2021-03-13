      SUBROUTINE RKB(N,T,DT,X) 
      
C***************************************************************************
C     ESTA SUBROUTINA INTEGRA UMA �RBITA DE UM SAT�LITE DADAS AS CONDI��ES 
C     INCIAIS UTILIZANDO O RUNGE-KUTTA 4 DE PASSO FIXO.
C     AUTOR: HELIO KUGA
C***************************************************************************

      IMPLICIT NONE

	INTEGER I, N
	DOUBLE PRECISION T,DT
      DOUBLE PRECISION X(n),WK(36),K(36)

!C�LCULO DE K1 
      
      CALL O(T,N,X,K(1))   

!C�LCULO DE K2 
      DO I = 1, N
       WK(I) = X(I) + DT * K(I)/2
      ENDDO
    
      CALL F(T,N,WK(1),K(N+1)) 

!C�LCULO DE K3
      DO I = 1, N
       WK(N + I) = X(I) + DT*K(N+I)/2
  	ENDDO
      
	
      CALL F(T,N,WK(N+1),K(N+N+1))

!C�LCULO DE K4
      DO I = 1, N
       WK(N+N+I) = X(I) + DT*K(N+N+I) 
      ENDDO
   
	
      CALL F(T,N,WK(N+N+1),K(N+N+N+1))
!INTEGRA��O
      DO I  =1, N
       X(I) = X(I) + DT*(K(I)+2*K(N+I)+2*K(N+N+I)+K(N+N+N+I))/6 
      ENDDO
 
      RETURN
      END
