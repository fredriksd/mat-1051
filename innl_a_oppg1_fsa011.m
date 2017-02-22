%1a)

v = 20.8;
m = 1300;
K = @(v,m) 1/2 .*m.*v^2;
disp(['Kinetisk energi med v = ', num2str(v), ' og m = ', num2str(m), ': K = ',num2str(K(v,m))])


%1b)

distance = @(t,a) 1/2.*a.*t.^2;
t = 12;
a = 2.2;
disp(['Bil B har kjørt ', num2str(distance(t,a)),'m på 12 sekunder.'])


%1c)
v_a = 20.8;
v_b = 26.4;
t_0 = 12;
a_b = 2.2;
t = (t_0*(1/2*a_b*t_0 - v_b))/(v_a-v_b);
rounded = round(t,0);
disp(['Tida det tar for B å ta igjen A: ', num2str(rounded), 's'])


