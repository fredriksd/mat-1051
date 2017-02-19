g = @(x) 1./(1+x.^2);
clear feil

for n = 1:20
%n = 3;
iv = [0,3]; %intervall
areal = simpson(g,iv,n);
feil(n) = abs(atan(3)-areal);
end
display(areal)

semilogy(feil), grid on

function ret = simpson(f,iv,n)
    dx = (iv(2)-iv(1))/(2*n);
    x = iv(1):dx:iv(2);
    ret = 0;
    for i = 2:2:(2*n)
       ret = ret + (f(x(i-1)) + 4.*f(x(i)) + f(x(i+1)));
    end
    ret = ret*dx/3;
end%function
