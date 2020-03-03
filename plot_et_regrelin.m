function faraday(filePath)

output=load(filePath);
x=output(1:1:end,1);
y=output(1:1:end,2);
clear output;


errX=zeros(1,length(x));
errY=zeros(1,length(y));
for m=1:1:length(angle)
	errX(m)=
	errY(m)=
end


polynome=polyfit(x,y,1);


figure

p=plot(x,y,'ro');
hold on
set(p,'markersize',15,'linewidth',2);
p2=plot(x,polynome(1)*x+polynome(2));
coeffa=num2str(polynome(1));
coeffb=num2str(polynome(2));
s=strcat('y=(',coeffa,')*x+(',coeffb,')');
ylabel('quantite y[unite]','Fontsize',30)
xlabel('quantite x[unite]','Fontsize',30)
set(gca,'FontSize',28)
hleg = legend(s)

h=errorbar(x,y,errX);%erreur verticale sur l'ordonnÃ©e
set(h,'linestyle','none','color','red');
he=herrorbar(x,y,errY);%erreur horizontale sur l'abscisse
set(he,'color','red');


