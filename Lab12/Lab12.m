format long

function [iteration, result] = Newton(f, df, x0, eps, N)
  iteration = 0;
  while (iteration <= N)
    x1 = x0 - f(x0) ./ df(x0);
    if ( abs(x0 - x1) < eps)
      result = x1;
      break;
    endif
    iteration = iteration +1;
    x0 = x1;
  endwhile
endfunction

function result = NewtonWithCounter(f, df, x0, N)
  for i = 1:N
    x1 = x0 - f(x0) ./ df(x0);
    x0 = x1;
  endfor
  result = x1;
endfunction

% Problem 1

f = @(x)(cos(x) - x);
df = @(x)(-1 .* sin(x) - 1);
eps = 10^(-4);
x0 = pi/4;
N = 100;

[iterationsNewton1, result1]=Newton(f,df,x0,eps,N)

% Problem 2

f = @(x)(x - 0.8 .* sin(x) - pi ./ 5);
df = @(x)(1 - 0.8 .* cos(x));
x0 = 1;

resultNewton6 = NewtonWithCounter(f, df, x0, 6)

% Problem 3

function [iteration, result] = Secant(f, x0, x1, eps, N)
  iteration = 0;
  while (iteration <= N)
    x2 = x1 - f(x1) .* (x1 -x0) ./ (f(x1) - f(x0));
    if( abs(f(x2)) < eps)
      result = x2;
      break;
    endif
    iteration = iteration +1;
    x0 = x1;
    x1 = x2;
  endwhile
endfunction

x0 = 1;
x1 = 2;
f = @(x)(x .^ 3 - x .^ 2 - 1);
eps = 10^(-4);
N = 100;

[iterationsSecant1, resultSecant] = Secant(f, x0, x1, eps, N)

% Problem 4

function [iterations, result] = Bisection(f, a, b, eps, N)
  for i = 1 : N
    c = (a + b) ./ 2;
    if( f(a) .* f(c) < 0)
      b = c;
    else
      a = c;
    endif
    if( abs(f(c)) < eps)
      result = c;
      iterations = i;
      break;
    endif
  endfor
endfunction

function [iterations, result] = FalsePosition(f, a, b, eps, N)
  for i = 1 : N
    c = (f(b) .* a - f(a) .* b) ./ (f(b) - f(a));
    if(f(a) .* f(c) < 0)
      b = c;
    else
      a = c;
    endif
    if( abs(f(c)) < eps)
      result = c;
      iterations = i;
      break;
    endif
  endfor
endfunction

a = 1;
b = 2;
f = @(x)(x - 2) .^ 2 - log(x);
eps = 10^(-4);
N = 100;
[iterationsBisection, resultBisection] = Bisection(f, a, b, eps, N)
[iterationFalseBisection, resultFalseBisection] = FalsePosition(f, a, b, eps, N)
