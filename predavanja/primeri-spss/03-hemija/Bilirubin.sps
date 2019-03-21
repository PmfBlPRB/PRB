COMPUTE nivo=TRUNC(bilirubin-4, 2)  . 
EXECUTE. 
COMPUTE nivo2=TRUNC(bilirubin-4, 2)/2  . 
EXECUTE.  
* Chart Builder. 
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=nivo2 MISSING=LISTWISE REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: nivo2=col(source(s), name("nivo2")) 
  GUIDE: axis(dim(1), label("nivo2")) 
  GUIDE: axis(dim(2), label("Frequency")) 
  ELEMENT: interval(position(summary.count(bin.rect(nivo2))), shape.interior(shape.square)) 
END GPL.
