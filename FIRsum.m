% UP736129 & UP504815
function Y = FIRsum(x,h)

N = length(x);
    
for k=0:(N-1)
    Y(n) = h(k)*x(n-k);
end;