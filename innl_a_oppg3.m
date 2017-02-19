%3a)
syms x
g = @(x) 1./(1+x.^2);
%n = 10;
%area = middlepoint(g,[0,3],n); Se funksjonen nederst.
%disp(area)

%3b)
f2 = diff(g,x,2);
g_prime2 = matlabFunction(f2);
f3 = diff(g,x,3); %tredjederivert av g

g_prime3 = matlabFunction(f3); %lambdafunksjon
fplot(g_prime2), grid on

%Finner høyeste verdi av f''(x)
roots = solve(f3 == 0, x);

temp = 0;
for i = 1:length(roots)
    g_prime2(roots(i))
    temp = g_prime2(roots(i));
    if temp < g_prime2(roots(end-(end-i)))
       temp = g_prime2(roots(end-(end-i)));
    end
end
display(temp)

%{
%3
new_area = middlepoint(g,[0,3],43);
disp(new_area)

function area = middlepoint(f,x,n)
    area = 0;
    u = zeros(1,n+1);
    u(1) = x(1);
    dx = (x(1)+x(2))/n;
    z = zeros(1,n);
    
    for i = 1:n
        u(i+1) = u(i) + dx;
    end%for
    
    for i = 1:n
        z(i) = (u(i) + u(i+1))/2;
        area = area + f(z(i))*dx;
    end%for
    fplot(f), hold on
    bar(z,f(z),'FaceAlpha',1), hold off
end
%}

