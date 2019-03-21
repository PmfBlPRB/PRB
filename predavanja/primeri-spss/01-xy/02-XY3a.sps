DESCRIPTIVES VARIABLES=X3 Y3
  /STATISTICS=MEAN SUM STDDEV MIN MAX KURTOSIS SKEWNESS.

GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=X3 MEAN(Y3)[name="Y3"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: X3=col(source(s), name("X3"))
  DATA: MEAN_Y3=col(source(s), name("Y3"))
  GUIDE: axis(dim(1), label("X3"))
  GUIDE: axis(dim(2), label("Mean Y3"))
  ELEMENT: point(position(X3*MEAN_Y3))
END GPL.

