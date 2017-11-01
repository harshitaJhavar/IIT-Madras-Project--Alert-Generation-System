%data=[2,3,8,9,10,4];%threshold in percentage
load data

for segno=4:4  
data=ap;
[ymin,xmin]=findsegment(segno,data');
normFactor=normFactor(data);

threshold=25;
[Yt]=Ythresholds(threshold,data');

[string,segmentThreshold]=stringGen(xmin,ymin,Yt,normFactor);
textGen(string,xmin,ymin,segmentThreshold)
commandwindow 
end