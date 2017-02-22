%Oppgave 4a)
n = 10;
a = zeros(1,n);
C = 0.3;
D = 0.7;
a(1) = 1;
a(2) = 2;

for i = 3:n
    a(i) = C.*a(i-1) + D.*a(i-2);
end%for
display(a)

%Oppgave 4b)
syms x 
f = @(x) x.^2 - C.*x - D;

roots = solve(f(x) == 0, x);
system = @(n) A*(-7/10).^n + B;
disp(['Løsning av karakteristisk ligning: ', func2str(system)])

%Oppgave 4c)

equation = [];
for i = 1:2
    %Lar A og B være '1', da de vil ha denne verdien i matrisen
    equation(i,:) = [(-7/10).^i 1 a(i)];
end

display(equation)
reduced = rref(equation);
display(reduced)