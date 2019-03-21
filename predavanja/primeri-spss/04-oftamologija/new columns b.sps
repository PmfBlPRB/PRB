DELETE VARIABLES  fOSDI_D, fOSDI_E, fOSDI.
EXECUTE.

COMPUTE fOSDI_D=fOSDI_A +  fOSDI_B + fOSDI_C. 
EXECUTE .

COMPUTE fOSDI_E=fcOSDI_A +  fcOSDI_B + fcOSDI_C. 
EXECUTE.

COMPUTE fOSDI=(25 *fOSDI_D)/  fOSDI_E. 
EXECUTE.

DELETE VARIABLES  fOSDI_scale, fmc_mon_scale.
EXECUTE.

RECODE fOSDI (0 thru 12=0) (12.00001 thru 22=1)  (22.00001 thru 32=2) (32.0001 thru 150=3)INTO fOSDI_scale. 
EXECUTE.

RECODE fmc_mon (0 thru 9=0) (21 thru 1000=2) (10 thru 20=1) INTO fmc_mon_scale. 
EXECUTE.