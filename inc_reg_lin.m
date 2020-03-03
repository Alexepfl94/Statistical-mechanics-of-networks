function[coeff]=inc_reg_lin(filePath)

output=load(filePath)
x=output(1:1:end,1);
y=output(1:1:end,2)
xmoy=0.0;

p=polyfit(x,y,1);
a=p(1);
b=p(2);

for m=1:length(x)
xmoy=xmoy+x(m);
end
xmoy=xmoy/length(x);
 
numa=0;
denuma=0; 
for m=1:length(x);
numa=numa+(y(m)-a*x(m)-b)*(y(m)-a*x(m)-b);
denuma=denuma+(x(m)-xmoy)*(x(m)-xmoy);

end

deltaa=sqrt(numa/(denuma*(length(x)-2)))
deltab=sqrt( 1/length(x)+(xmoy^2/denuma)*(numa/(length(x)-2)) )


end
