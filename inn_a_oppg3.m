%3a)
g = @(x) 1./(1+x.^2);
%fplot(g)
%n = 10;
iv = [0,3]; %intervall

%area = trapez(g,iv,n);
%display(area)

%3b)

syms x 
g_der = diff(g,x,2);
g_prime = matlabFunction(g_der);
g_der2 = diff(g,x,3); %Tredjederivert
roots_3 = solve(g_der2 == 0, x); %Finner røtter til tredjederivert

answers = zeros(1,length(roots_3));
m2 = 0;
for i = 1:length(roots_3)
   answers(i) = g_prime(roots_3(i)); 
   m2 = answers(i);
   if m2 < answers(end-(end-i))
      m2 = answers(end-(end-i)); 
   end
end
display(answers)
display(m2)
e(x) = m2*(iv(2)-iv(1))^3/(12*x^2);
solve (e(x) == 0.0001, x)
%Finner ut at n >= 75*2^(1/2) = 106 dersom E_n <= 0.0001

%3c)
%feilverdi ved integrasjonen
estimated_error = e(106);
disp(['Estimert feilverdi = ',num2str((double(estimated_error)))])

function ret = trapez(f,iv,n)
    dx = (iv(2) - iv(1))/n;
    x = zeros(1,n+1);
    x(1) = iv(1);
    ret = f(x(1));
    for i = 2:n+1
        x(i) = iv(1) + (i-1)*dx;
    end
    for i = 2:n
       ret = ret + 2.*f(x(i)); 
    end
    ret = (ret + f(x(end)))*dx/2;
    
    fplot(f), hold on, grid on
    ylim([0,1.2])   
    area(x,f(x),'FaceAlpha',0.3), hold off
    legend(['f(x) = ', func2str(f)],'Trapesintegral')
end




