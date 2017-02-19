%2a)

 syms x
 f = @(x) x.^5 - x + 1;
 g = diff(f,x,1);
 f_prime = matlabFunction(g); 
 
 x = zeros(1,10);
 x(1) = -2; 
 for i = 2:10
     x(i) = x(i-1) - f(x(i-1))/f_prime(x(i-1));
 end%for
display(x)
% disp(['Rot ved Newtons metode (y = 0): ', num2str(x(end))])
% 
% 

%2b)

A = [-2 0];
B = [0 2];

xe = [];
for i = 1:2
    
    % a = 0.5;
    % b = 1;
    a = A(i);
    b = B(i);
    fa = f_prime(a);
    fb = f_prime(b);
    
    while b-a > 0.00001
        c = (a+b)/2;
        fc = f_prime(c);
        if (fc*fa) > 0
            a = c;
            fa = fc;
        elseif fc == 0
            display(c)
            break
        else
            b = c;
            fb = fc;
        end%if
    end%while
    c = (a+b)/2;
    display(c)
    xe(i) = c;
end
disp(['Nullpunkter i ', num2str(xe)])

%2c)

figure(1)
fplot(f,[-2,2]), grid on, hold on
plot(x(end),f(x(end)),'o',[-c,c],f([-c,c]),'o'), hold off
legend('f(x) = x^5 - x + 1', 'Nullpunkt', 'Lokale ekstremalpunkter')
figure(2)
fplot(f_prime,[-2,2]), hold on
plot([-2,2],[0,0]), hold off
ylim([-2,80])
