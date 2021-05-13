% Problem 1
x = [1 2 3 4 5 6 7];
f = [13 15 20 14 15 13 10];
m = 7;

function result = f1(m,x,f)
  up = m*sum(x.*f)-sum(x)*sum(f);
  down = m*sum(x.^2)-sum(x)^2;
  result = up/down;
endfunction

function result = f2(m,x,f)
  up = sum(x.^2)*sum(f)-sum(x.*f)*sum(x);
  down = m*sum(x.^2)-sum(x)^2;
  result = up/down;
endfunction

function result = minValue(x, f, a, b)
  result = sum((f-(a.*x+b)).^2);
endfunction

a = f1(m,x,f)
b = f2(m,x,f)
p = [a b]
polyval(p,8);
minValue(x,f,a,b)
figure(1);
plot(x,f,'mo');
hold on;
plot(x,polyval(p,x));
hold off;

% Problem 2
x = [0 10 20 30 40 60 80 100];
f = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133]
p1 = polyfit(x, f, 2);
p2 = polyfit(x, f, 3);
v1 = polyval(p1, 45);
v2 = polyval(p2, 45);
p45 = 0.095848
e1 = abs(p45-v1)
e2 = abs(p45-v2)
figure(2);
plot(x, f, 'ro');
hold on;
plot(x, polyval(p1,x), 'mx');
plot(x, polyval(p2,x), 'g*');
u = 1:0.01:100;
plot(u, polyval(p1,u));
plot(u, polyval(p2,u));
hold off;

% Problem 3
figure(3);
[x, y] = ginput(10);
p = polyfit(x,y,2);
plot(x,y,'mx');
hold on;
plot(u, polyval(p,u));
hold off;