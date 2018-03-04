function []=pwm2(rmin, rmax, gmin, gmax, bmin, bmax, t)
int t;
dio=digitalio('parallel','LPT1');
lines = addline(dio,0:3,'out');
phr = 0;
phg = 0;
phb = 0;
T = 0.151;
n=0;
while(1)
tic;
R=rmin + (rmax-rmin)*rand(1);
G=gmin + (gmax-gmin)*rand(1);
B=bmin + (bmax-bmin)*rand(1);
dcr=R/255;
dcg=G/255;
dcb=B/255;
while(toc<=t)
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
m = s(i)-s(i-1);
pause(m);
i=i+1;
end
n=n+1;
end
w=input(' ','s')
if isempty(w)
    break;
end
end

        