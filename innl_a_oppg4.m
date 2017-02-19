%4a)
syms x
C = 0.3;
D = 0.7;
n = 10;
a = zeros(1,n);
a(1) = 1;
a(2) = 2;

for i = 3:n
    a(i) = C.*a(i-1) + D.*a(i-2);
end%for
display(a)
%4b)

lambda = @(x) x.^2 - C.*x - D;
solve(lambda(x) == 0, x)