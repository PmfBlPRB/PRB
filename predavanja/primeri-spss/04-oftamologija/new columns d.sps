DELETE VARIABLES  mm_sc_normal, mm_sc_moderate, mm_sc_severe.
EXECUTE.

RECODE fmc_mon_scale (0=1) (1=0) (2=0)INTO mm_sc_normal. 
EXECUTE.

RECODE fmc_mon_scale (0=0) (1=1) (2=0)INTO mm_sc_moderate. 
EXECUTE.

RECODE fmc_mon_scale (0=0) (1=0) (2=1)INTO mm_sc_severe. 
EXECUTE.

DELETE VARIABLES  osdi_sc_normal, osdi_sc_mild, osdi_sc_moderate, osdi_sc_mildmoderate, osdi_sc_severe.
EXECUTE.

RECODE fOSDI_scale (0=1) (1=0) (2=0)(3=0)INTO osdi_sc_normal. 
EXECUTE.

RECODE fOSDI_scale (0=0) (1=1) (2=0)(3=0)INTO osdi_sc_mild. 
EXECUTE.

RECODE fOSDI_scale (0=0) (1=0) (2=1)(3=0)INTO osdi_sc_moderate. 
EXECUTE.

COMPUTE osdi_sc_mildmoderate=osdi_sc_mild+osdi_sc_moderate.


RECODE fOSDI_scale (0=0) (1=0) (2=0)(3=1)INTO osdi_sc_severe. 
EXECUTE.

DELETE VARIABLES  Schirmer_sc_normal, Schirmer_sc_patol.
EXECUTE.

RECODE Schrimer_scale (0=1) (1=0)INTO Schirmer_sc_normal. 
EXECUTE.

RECODE Schrimer_scale (1=1) (0=0)INTO Schirmer_sc_patol. 
EXECUTE.

DELETE VARIABLES  RoseBengal_sc_normal, RoseBengal_sc_moderate, RoseBengal_sc_severe.
EXECUTE.

RECODE RoseBengal_scale (0=1) (1=0)(2=0)INTO RoseBengal_sc_normal. 
EXECUTE.

RECODE RoseBengal_scale (0=0) (1=1)(2=0)INTO RoseBengal_sc_moderate. 
EXECUTE.

RECODE RoseBengal_scale (0=0) (1=0)(2=1)INTO RoseBengal_sc_severe. 
EXECUTE.
