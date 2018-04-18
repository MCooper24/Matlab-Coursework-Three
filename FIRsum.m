%% TASK 1

function Y = FIRsum(x,h)

% Calculates the FIR filter.

m = length(x);
n = length(h);
X = [x,zeros(1,n)];
H = [h,zeros(1,m)];

for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end;
    end;
end;