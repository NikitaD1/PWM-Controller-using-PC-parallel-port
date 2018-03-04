function []=pwm1(pixel,t1)
dio=digitalio('parallel','LPT1');
lines=addline(dio,0:3,'out');
j=1;
phr = 0;
phg = 0;
phb = 0;
n=0;
while(1)
tic;
dcr=(pixel(j,1))/255;
dcg=(pixel(j,2))/255;
dcb=(pixel(j,3))/255;
while(toc<=t1)
s=sort([0 (dcr+ phr)*T (dcg+ phg)*T (dcb+ phb)*T phr*T phg*T phb*T]);
i=2;
while(toc<(s(i)+n*T))
    
        t=toc;
        if( t<phr || t>(phr+ dcr))
        r=0;
        else
        r=1;
        end
        if( t<phg || t>(phg+ dcg))
        g=0;
        else
        g=1;
        end
        if( t<phb || t>(phb+ dcb))
        b=0;
        else
        b=1;
        end
       
putvalue('dio',[r 0 g b]);
m=s(i)- s(i-1);
pause(m);
i=i+1;
end
n=n+1;
end
j=j+1;
if (j==length(pixel))
    j=1;
end
w=input(' ','s')
if isempty(w)
    break;
end
end
        