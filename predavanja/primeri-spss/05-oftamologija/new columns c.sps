DO IF  (mRiskEAU = 0 OR mRiskEAU = 1). 
RECODE mRiskEAU  (ELSE=Copy) INTO mRiskEAULowMedium. 
END IF. 
EXECUTE.

DO IF  (mRiskEAU = 0 OR mRiskEAU = 2). 
RECODE mRiskEAU  (ELSE=Copy) INTO mRiskEAULowHigh. 
END IF. 
EXECUTE.

DO IF  (mRiskEAU = 1 OR mRiskEAU = 2). 
RECODE mRiskEAU  (ELSE=Copy) INTO mRiskEAUMediumHigh. 
END IF. 
EXECUTE.

DO IF  (mRiskMed = 0 OR mRiskMed = 1). 
RECODE mRiskMed  (ELSE=Copy) INTO mRiskMedLowMedium. 
END IF. 
EXECUTE.

DO IF  (mRiskMed = 0 OR mRiskMed = 2). 
RECODE mRiskMed  (ELSE=Copy) INTO mRiskMedLowHigh. 
END IF. 
EXECUTE.

DO IF  (mRiskMed = 1 OR mRiskMed = 2). 
RECODE mRiskMed  (ELSE=Copy) INTO mRiskMedMediumHigh. 
END IF. 
EXECUTE.