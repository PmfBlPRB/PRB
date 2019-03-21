DELETE VARIABLES  Schrimer_scale, SchirmerOD_scale, SchirmerOS_scale.
EXECUTE.

RECODE SchirmerOD (0 thru 10=1) (10 thru 1500=0)INTO SchirmerOD_scale. 
EXECUTE.

RECODE SchirmerOS (0 thru 10=1) (10 thru 1500=0)INTO SchirmerOS_scale. 
EXECUTE. 

DO IF (SchirmerOS_scale >  SchirmerOD_scale ).
COMPUTE Schrimer_scale=SchirmerOS_scale.
ELSE.
COMPUTE Schrimer_scale=SchirmerOD_scale.
END IF.
EXECUTE.

DELETE VARIABLES  BUT_scale, BUTOD_scale, BUTOS_scale.
EXECUTE.

RECODE BUTOD (0 thru 10=1) (10 thru 1500=0)INTO BUTOD_scale. 
EXECUTE.

RECODE BUTOS (0 thru 10=1) (10 thru 1500=0)INTO BUTOS_scale. 
EXECUTE. 

DO IF (BUTOS_scale >  BUTOD_scale ).
COMPUTE BUT_scale=BUTOS_scale.
ELSE.
COMPUTE BUT_scale=BUTOD_scale.
END IF.
EXECUTE.

DELETE VARIABLES  RoseBengal_scale, RoseBengalOD_scale, RoseBengalOS_scale.
EXECUTE.

RECODE RoseBengalOD (0 thru 0=0)  (1 thru 5=1) (6 thru 9=2)INTO RoseBengalOD_scale. 
EXECUTE.

RECODE RoseBengalOS (0 thru 0=0)  (1 thru 5=1) (6 thru 9=2)INTO RoseBengalOS_scale. 
EXECUTE. 

DO IF (RoseBengalOS_scale >  RoseBengalOD_scale ).
COMPUTE RoseBengal_scale=RoseBengalOS_scale.
ELSE.
COMPUTE RoseBengal_scale=RoseBengalOD_scale.
END IF.
EXECUTE.

