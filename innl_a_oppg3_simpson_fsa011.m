%3a)
g = @(x) 1./(1+x.^2);
clear feil

for n = 1:20
    %n = 3;
    iv = [0,3]; %intervall
    areal = simpson(g,iv,n);
    feil(n) = abs(atan(3)-areal);
end
display(areal)



%3b)
syms x
a = 0;
b = 3;
g = @(x) 1./(1+x.^2);
f4 = diff(g,x,4);
f4prime = matlabFunction(f4);
fplot(f4prime)
ylim([-11,25])

f5 = diff(f4,x,1);
f5prime = matlabFunction(f5);
roots = solve(f5 == 0, x);
roots = [roots;a;b]; %Ønsker bare punkter i [a,b]

m4 = 0;
for i = 1:length(roots)
    if roots(i)>=a || roots(i)<=b
        temp = abs(f4prime(roots(i)));
        if m4 < temp
            m4 = temp; %Finner M4
        end
    end
end
display(m4)


e(x) = (m4.*3^5)./(180*x.^4);
n_value = solve(e(x) == 0.0001, x);
display(n_value)

%3c) Faktisk feil 
estimated_error = round(double(e(23.9)),4); %32400^(1/4) ? 23.9
display(estimated_error)
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
