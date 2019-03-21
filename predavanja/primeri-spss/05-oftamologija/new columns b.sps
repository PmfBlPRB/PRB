COMPUTE cmDiagPcaKont=(1-kontrol)*diagPca + 4 *kontrol.
EXECUTE.

DO IF  (diagPca = 0 OR kontrol = 1). 
RECODE cmDiagPcaKont (ELSE=Copy) INTO cmDiagPca0Kont. 
END IF. 
EXECUTE.

DO IF  (diagPca = 1 OR kontrol = 1). 
RECODE cmDiagPcaKont (ELSE=Copy) INTO cmDiagPca1Kont. 
END IF. 
EXECUTE.

COMPUTE cmTStad=mT1stad + 2* mT2stad + 4 * mT3T4stad.
EXECUTE.

DO IF  (cmTStad = 1 OR cmTStad = 2  OR cmTStad = 3  OR cmTStad = 5  OR cmTStad = 6  OR cmTStad = 7). 
RECODE cmTStad (ELSE=Copy) INTO cmTStadOnly12. 
END IF. 
EXECUTE.

DO IF  (cmTStad = 1 OR cmTStad = 3 OR cmTStad = 4 OR cmTStad = 5  OR cmTStad = 6  OR cmTStad = 7). 
RECODE cmTStad (ELSE=Copy) INTO cmTStadOnly13. 
END IF. 
EXECUTE.

DO IF  (cmTStad = 2 OR cmTStad = 3 OR cmTStad = 4 OR cmTStad = 5  OR cmTStad = 6  OR cmTStad = 7). 
RECODE cmTStad (ELSE=Copy) INTO cmTStadOnly23. 
END IF. 
EXECUTE.

COMPUTE cmPSA=mPSAlt10 + 2* mPSA1020 + 4 * mPSAgt20.
EXECUTE.

DO IF  ( (cmPSA = 1 OR cmPSA = 2) AND diagPCA =1 ). 
RECODE cmPSA  (ELSE=Copy) INTO cmPsaLT10vs10to20FonPCA1. 
END IF. 
EXECUTE.
 
DO IF  ( (cmPSA = 1 OR cmPSA = 4) AND diagPCA =1 ). 
RECODE cmPSA  (ELSE=Copy) INTO cmPsaLT10vsGT20FonPCA1. 
END IF. 
EXECUTE.
 
DO IF  ( (cmPSA = 2 OR cmPSA = 4) AND diagPCA =1 ). 
RECODE cmPSA  (ELSE=Copy) INTO cmPsa10to20vsGT20FonPCA1. 
END IF. 
EXECUTE.

DO IF  ( (cmPSA = 1 OR cmPSA = 2 OR cmPSA = 4) AND diagPCA =1 ). 
RECODE cmPSA  (1=0)(2=0)(4=1)(ELSE=Copy) INTO cmPsaLT20vsGT20onPCA1. 
END IF. 
EXECUTE.
  
COMPUTE cmGG=mGGlt7 + 2*mGGeq7 + 4 *mGGgt7.
EXECUTE.

DO IF  (cmGG = 1 OR cmGG = 4). 
RECODE cmGG  (ELSE=Copy) INTO cmGgLtvsGt7F. 
END IF. 
EXECUTE.

DO IF  (cmGG = 1 OR cmGG = 2). 
RECODE cmGG  (ELSE=Copy) INTO cmGgLt7vsEq7F. 
END IF. 
EXECUTE.

DO IF  (cmGG = 2 OR cmGG = 4). 
RECODE cmGG  (ELSE=Copy) INTO cmGgEq7vsGt7F. 
END IF. 
EXECUTE.

