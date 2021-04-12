% Problem 1

x = [1 1.5 2 3 4];
f = [0 0.17609 0.30103 0.47714 0.60206];
xx = [2.5, 3.25];

i = 10 : 35;
yi = i ./ 10;

function N = NewtonPolynomial(x, f, xx)

  n = length(x) - 1;

  %divided differences table
  m = zeros(n+1);
  m(:,1) = f';

  for i = 2 : length(x)
    for j = 1 : (length(x) - i + 1)
        m(j,i) = (m(j+1, i-1) - m(j, i-1)) / (x(i+j-1) - x(j));
    endfor
  endfor

  lengthX = length(xx);
  p = ones(1, lengthX);
  s = m(1,1) .* ones(1,lengthX);
  for j = 1 : lengthX
    for i = 1 : n
      p(j) = p(j) .* (xx(j) - x(i));
      s(j) = s(j) + p(j) .* m(1,i+1);
    endfor
  endfor

  N=s;

endfunction

resultFunction = NewtonPolynomial(x, f, yi)

error = max(abs(log10(yi) - resultFunction))

% Problem 2

x = [1 2 3 4 5];
f = [22 23 25 30 28];

y1 = [2.5];

n = NewtonPolynomial(x, f, yi)

plot(x,f,'*');

hold on

z = 0 : 0.01 : 6;
A = NewtonPolynomial(x,f,z);

plot(z, A, '')

% Problem 3
x = [0:6/11:6];
f = e.^(sin(x));

m = 12;

for i = 1 : m
    matrix2{i,1} = x(i);
    matrix2{i,2} = f(x == x(i));
 endfor

par = 1;

for j= 3 : (m+1)
  for i = 1 : (m-par)
    matrix2{i, j} = (matrix2{i+1,j-1} - matrix2{i,j-1}) / (x(i+j-2) - x(i));
  endfor
  par  = par + 1;
endfor

function NewtonPoly =NewtonPoly(xval, m ,x,f, matrix2 )
  N = f(x==x(1));
  for i = 2:m
  p = 1;
  for j = 1:(i-1)
    p = p .* (xval- x(j));
  endfor
  
  N = N + p.*matrix2{1,i+1};
endfor
display(N)
NewtonPoly = N;
endfunction

xval = 0:6/11:6;
plot(xval, NewtonPoly(xval, m, x, f, matrix2))

% Problem 4

format long
x= [121, 100, 144];
f = sqrt(x);
eps = 10 .^ (-3);


m = 3;

for i = 1:m
  
    matrix2{i,1} = x(i);
    matrix2{i,2} = f(x == x(i));
  endfor


  for j = 3:(m+1)
    for i = (j-1):m
      a = x(i);
      b = x(j-2);
      
      matrix2{i, j} = (1/(a - b)).*((matrix2{j-2,j-1}.*(a - 115)) - (matrix2{i, j-1}.*(b -115)));
      display(abs(matrix2{i, i} - matrix2{i-1,i-1}))
      if (abs(matrix2{i, i} - matrix2{i-1,i-1}) <= eps)
        break;
      endif
    endfor
  endfor
display(matrix2{i,j})

