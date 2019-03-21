DELETE VARIABLES  fOSDI_A, fcOSDI_A.
EXECUTE.

DO IF (Sysmys(oc_os_sv)).
COMPUTE fOSDI_A=0.
COMPUTE fcOSDI_A=0.
ELSE.
COMPUTE fOSDI_A=oc_os_sv.
COMPUTE fcOSDI_A=1.
END IF.
DO IF (Sysmys(oc_os_pes)).
COMPUTE fOSDI_A=fOSDI_A.
COMPUTE fcOSDI_A=fcOSDI_A.
ELSE.
COMPUTE fOSDI_A= fOSDI_A+ oc_os_pes.
COMPUTE fcOSDI_A=fcOSDI_A+1.
END IF.
DO IF (Sysmys(oc_os_bol)).
COMPUTE fOSDI_A=fOSDI_A.
COMPUTE fcOSDI_A=fcOSDI_A.
ELSE.
COMPUTE fOSDI_A= fOSDI_A+ oc_os_bol.
COMPUTE fcOSDI_A=fcOSDI_A+1.
END IF.
DO IF (Sysmys(vid_zam)).
COMPUTE fOSDI_A=fOSDI_A.
COMPUTE fcOSDI_A=fcOSDI_A.
ELSE.
COMPUTE fOSDI_A= fOSDI_A+ vid_zam.
COMPUTE fcOSDI_A=fcOSDI_A+1.
END IF.
DO IF (Sysmys(vid_slab)).
COMPUTE fOSDI_A=fOSDI_A.
COMPUTE fcOSDI_A=fcOSDI_A.
ELSE.
COMPUTE fOSDI_A= fOSDI_A+ vid_slab.
COMPUTE fcOSDI_A=fcOSDI_A+1.
END IF.
EXECUTE.

DELETE VARIABLES  fOSDI_B, fcOSDI_B.
EXECUTE.

DO IF (Sysmys(sm_cit)).
COMPUTE fOSDI_B=0.
COMPUTE fcOSDI_B=0.
ELSE.
COMPUTE fOSDI_B=sm_cit.
COMPUTE fcOSDI_B=1.
END IF.
DO IF (Sysmys(sm_voz_n)).
COMPUTE fOSDI_B=fOSDI_B.
COMPUTE fcOSDI_B=fcOSDI_B.
ELSE.
COMPUTE fOSDI_B= fOSDI_B+ sm_voz_n.
COMPUTE fcOSDI_B=fcOSDI_B+1.
END IF.
DO IF (Sysmys(sm_rad_r)).
COMPUTE fOSDI_B=fOSDI_B.
COMPUTE fcOSDI_B=fcOSDI_B.
ELSE.
COMPUTE fOSDI_B= fOSDI_B+ sm_rad_r.
COMPUTE fcOSDI_B=fcOSDI_B+1.
END IF.
DO IF (Sysmys(sm_gl_tv)).
COMPUTE fOSDI_B=fOSDI_B.
COMPUTE fcOSDI_B=fcOSDI_B.
ELSE.
COMPUTE fOSDI_B= fOSDI_B+ sm_gl_tv.
COMPUTE fcOSDI_B=fcOSDI_B+1.
END IF.
EXECUTE .

DELETE VARIABLES  fOSDI_C, fcOSDI_C.
EXECUTE.

DO IF (Sysmys(nep_vet)).
COMPUTE fOSDI_C=0.
COMPUTE fcOSDI_C=0.
ELSE.
COMPUTE fOSDI_C=nep_vet.
COMPUTE fcOSDI_C=1.
END IF.
DO IF (Sysmys(nep_suv)).
COMPUTE fOSDI_C=fOSDI_C.
COMPUTE fcOSDI_C=fcOSDI_C.
ELSE.
COMPUTE fOSDI_C= fOSDI_C+ nep_suv.
COMPUTE fcOSDI_C=fcOSDI_C+1.
END IF.
DO IF (Sysmys(nep_klim)).
COMPUTE fOSDI_C=fOSDI_C.
COMPUTE fcOSDI_C=fcOSDI_C.
ELSE.
COMPUTE fOSDI_C= fOSDI_C+ nep_klim.
COMPUTE fcOSDI_C=fcOSDI_C+1.
END IF.
EXECUTE.
