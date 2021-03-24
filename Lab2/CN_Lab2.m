% Problem 1
figure(1);

x = 0 : 0.01 : 1;

l1 = x;
l2 = 3/2 * (x.^2) - 1/2;
l3 = 5/2 * (x.^3) - 3/2 * x;
l4 = 35/8 * (x.^4) - 15/4 * (x.^2) + 3/8;

subplot(2,2,1);
plot(x,l1)
subplot(2,2,2)
plot(x,l2)
subplot(2,2,3)
plot(x,l3)
subplot(2,2,4)
plot(x,l4)

% Problem 2.a
figure(2);

t = -1 : 0.01 : 1;

t1 = cos(acos(t));
t2 = cos(2 * acos(t));
t3 = cos(3 * acos(t));

plot (t1, t)
hold on
plot (t2, t)
hold on
plot (t3, t)
hold off

% Problem 2.b
figure(3);

x = -1 : 0.01 : 1;
maxN = input("Please enter a number n:");

T0 = 1;
T1 = x;

plot(T0)
hold on
plot(T1)
hold on

for n = 2 : maxN 
  Tn = 2 .* x .* T1 - T0;
  plot(Tn)
  hold on
  T0 = T1;
  T1 = Tn;
endfor
hold off

% Problem 3
figure(4)

function val = Taylor(x,n);
  val=0;
  for k=0:n;
      val =val+ (x-0)^k/factorial(k); 
  endfor
endfunction
f=exp(0);
n=7;
k=0:n;
hold on
for n=1:6
    for x=-1:0.1:3
        polynome = Taylor(x,n);
        plot(x,Taylor(x,n),'x')
    endfor
endfor
    hold off

% Problem 4
h = 0.25;
table = zeros(7,7);
for i = 1:7;
  x = 1 + ((i-1) .* h);
  table(i,1) = x;
  f = sqrt((5 .* (x .^ 2)) + 1);
  table(i,2) = f;
endfor
fColumn = 2;
ending = 7;
for k = 1:6;
  ending -= 1;
  for i = 1 : ending;
    row = i;
    column = k+1;
    table(row,column) = table(row+1,fColumn)-table(row,fColumn);
  endfor
endfor
table


% Problem 5
table = zeros(4,5);
table(1,1) = 2;   %x0
table(2,1) = 4;   %x1
table(3,1) = 6;   %x2
table(4,1) = 8;   %x3
table(1,2) = 4;   %f(x0)
table(2,2) = 8;   %f(x1)
table(3,2) = 14;  %f(x2)
table(4,2) = 16;  %f(x3)

xColumn = 1;
fColumn = 2;
ending = 4;
for k=1:3;
  ending = ending - 1;
  for r=1:ending;
    row = r;
    column = k + 2;
    table(row,column) = (table(row+1,fColumn) - table(row,fColumn)) / (table(row+k,xColumn)-table(row,xColumn));
  endfor
endfor
table
 


