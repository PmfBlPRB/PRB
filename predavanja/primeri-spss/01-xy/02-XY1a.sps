DESCRIPTIVES VARIABLES=X Y
  /STATISTICS=MEAN SUM STDDEV MIN MAX KURTOSIS SKEWNESS.

GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=X MEAN(Y)[name="Y"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: X=col(source(s), name("X"))
  DATA: MEAN_Y=col(source(s), name("Y"))
  GUIDE: axis(dim(1), label("X"))
  GUIDE: axis(dim(2), label("Mean Y"))
  ELEMENT: point(position(X*MEAN_Y))
END GPL.

