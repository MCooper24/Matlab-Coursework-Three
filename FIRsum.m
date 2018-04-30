% TASK 1 - FIR Filtering Function

function y = FIRsum(x,h)

% Custom FIR filtering sum.

N = length(x)
M = length(h)

for n= 1:N
    y(n) = 0;
    for k = 1:M
        if (n+1-k) > 0
            y(n) = y(n)+(h(k) * x((n+1)-k))
        end
    end
end
end