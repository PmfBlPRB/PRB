DESCRIPTIVES VARIABLES=X2 Y2
  /STATISTICS=MEAN SUM STDDEV MIN MAX KURTOSIS SKEWNESS.

GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=X2 MEAN(Y2)[name="Y2"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: X2=col(source(s), name("X2"))
  DATA: MEAN_Y2=col(source(s), name("Y2"))
  GUIDE: axis(dim(1), label("X2"))
  GUIDE: axis(dim(2), label("Mean Y2"))
  ELEMENT: point(position(X2*MEAN_Y2))
END GPL.

