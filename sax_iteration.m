arraystep=[3,5,6,10];
str=[];
load data
c=cell(10,1);
c{1,1}=a;
c{2,1}=ap;
c{3,1}=can;
c{4,1}=ex;
c{5,1}=f;
c{6,1}=frc;
c{7,1}=g;
c{8,1}=gdp;
c{9,1}=ipi;
c{10,1}=soi;
counter=1;
for k=1:10
    data=c{k};
    
    figure
for i=1:numel(arraystep(:))
    for alphabetsize=3:5
       
    nseg=arraystep(i)
    subplot(4,3,counter)
    X=sax_demo(data,nseg,alphabetsize)
    str=[str,X];
    counter=counter+1;
    end
end
counter=1;
end