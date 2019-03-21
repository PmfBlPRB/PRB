DESCRIPTIVES VARIABLES=X4 Y4
  /STATISTICS=MEAN SUM STDDEV MIN MAX KURTOSIS SKEWNESS.

GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=X4 MEAN(Y4)[name="Y4"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: X4=col(source(s), name("X4"))
  DATA: MEAN_Y4=col(source(s), name("Y4"))
  GUIDE: axis(dim(1), label("X4"))
  GUIDE: axis(dim(2), label("Mean Y4"))
  ELEMENT: point(position(X4*MEAN_Y4))
END GPL.

