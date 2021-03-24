%Problem 1
x = [1930, 1940, 1950, 1960, 1970, 1980];
fx = [123203, 131669, 150697, 179323, 203212, 226505];

function value = uix(x,vector)
  value = 1;
  m = size(vector,2);
  for j = 1 : m
      if (vector(j) != x) 
        value = value .* ( x - vector(j));
      endif
  endfor
endfunction

function value = Ai(x,vector)
  value = 1 / uix(x,vector);
endfunction

function value = liniarInterpolation(x, vectorOfX, vectorOfFX)
  m = size(vectorOfX,2);
  sumNumi = 0;
  sumNuma = 0;
  for index = 1 : m
      sumNumi = sumNumi + Ai(vectorOfX(index),vectorOfX) .* vectorOfFX(index)/(x-vectorOfX(index));
      sumNuma = sumNuma + Ai(vectorOfX(index),vectorOfX) / (x-vectorOfX(index));
  endfor
  value = sumNumi / sumNuma;
endfunction

liniarInterpolation(1955,x,fx)
liniarInterpolation(1995,x,fx)


%Problem 2

x = [81, 100, 121, 144];
fx= [9, 10, 11, 12];
liniarInterpolation(115,x,fx)

function value = uix(x,vector)
  value = 1;
  m = size(vector,2);
  for j = 1 : m
      if (vector(j) != x ) 
        value = value .* ( x - vector(j));
      endif
  endfor
endfunction

function value = Ai(x,vector)
  value = 1 / uix(x,vector);
endfunction

function value = liniarInterpolation(x, vectorOfX, vectorOfFX)
  m = size(vectorOfX,2);
  sumNumi = 0;
  sumNuma = 0;
  for index = 1 : m
      sumNumi = sumNumi + Ai(vectorOfX(index),vectorOfX) .* vectorOfFX(index) / ( x - vectorOfX(index));
      sumNuma = sumNuma + Ai(vectorOfX(index),vectorOfX) / (x-vectorOfX(index));
  endfor
  value = sumNumi/sumNuma;
endfunction

%Problem 3

x = 0 : (10/20) : 10;
f = @(x)(1 + cos( pi .* x )) / ( 1 + x);
xf = 0 : 0.1 : 10;
fx = ( 1 + cos( pi .* xf )) ./ ( 1 + xf);
plotty =  0 : (10/20) : 10;
fvecty = 0 : (10/20) : 10;
for index = 1 : 21
    plotty(index) = liniarInterpolation(x(index),xf,fx);
endfor

hold on
plot(xf,fx)
plot(x, plotty, 'r')


function value = uix(x,vector)
  value = 1;
  m = size(vector,2);
  for j = 1 : m
      if (vector(j) != x) 
        value = value .* (x - vector(j));
      endif
  endfor
endfunction

function value = Ai(x,vector)
  value = 1 / uix(x,vect);
endfunction

function value = liniarInterpolation(x, vectorOfX, vectorOfFX)
  m = size(vectorOfX,2);
  sumNumi = 0;
  sumNuma = 0;
  for index = 1 : m
      if (x - vectorOfX(index) == 0) 
        sumNumi = sumNumi + Ai(vectorOfX(index),vectorOfX) .* vectorOfFX(index) / (x);
        sumNuma = sumNuma + Ai(vectorOfX(index),vectorOfX) / (x);
      else
        sumNumi = sumNumi + Ai(vectorOfX(index),vectorOfX) .* vectorOfFX(index) / (x-vectorOfX(index));
        sumNuma = sumNuma + Ai(vectorOfX(index),vectorOfX) / (x - vectorOfX(index));
      endif
  endfor
  value = sumNumi/sumNuma;
endfunction
