%Problem 1 --> a

x = [0 pi/2 pi (3*pi/2) 2*pi];
y = sin(x);

printf("sin(%f) = %f\n", pi/4, sin(pi/4));
printf("splineSin(%f) = %f\n", pi/4, spline(x, y, pi/4));
printf("clampedSin(%f) = %f\n", pi/4, spline(x, [1 y 1], pi/4));

%Problem 1 --> b

xx = 0 : 0.01 : 2*pi;
yy = sin(xx);

figure(1);

plot(xx,yy);
plot(x, y, 'mo');
hold on;
plot(xx, spline(x, y, xx));
plot(xx, spline(x, [1 y 1], xx));

%Problem 2

[x, y] = ginput(5);
[x, idx] = sort(x);
y = y(idx);

figure(2);

plot(x, y, 'mo');
hold on;

m = size(x)(1);
first = x(1);
last = x(m);

xx = first : 0.01 : last;
yy = spline(x, y, xx);
plot(xx, yy);
hold on;

%Problem 3

function result = f(x)
  result = cos(x);
endfunction

function result = LinearDpine(x, x0, x1)
  result = f(x0) + ((f(x1) - f(x0)) ./ (x1 - x0)) .* (x - x0);
endfunction

x = [0 pi/4 2*pi];
y = f(x);

figure(3);

plot(x, y, 'mo');
hold on;

xx = 0 : 0.01 : 2*pi;
yy = f(xx);

plot(xx,yy);
m = size(x)(2);
for i = 1 : m-1
  xx = x(i) : 0.01 : x(i+1);
  yy = LinearSpline(xx, x(i), x(i+1));
  plot(xx,yy);  
endfor