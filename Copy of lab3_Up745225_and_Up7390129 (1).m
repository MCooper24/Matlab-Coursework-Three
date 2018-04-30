clear all;
close all;
clc;
%% Question 1 and 2
clear all;
close all;
clc;
x=[1,2,3,4,5,6,7,8,9,10];
h=[0.2,0.3,0.2];

Y = My_FIR ( x, h)

Transfer = tf(x,Y) %cross multipy for difference equation

%% Question 3
clear all;
close all;
clc;
x=[1,2,3,4,5,6,7,8,9,10];
h=[0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1];


Y = My_FIR ( x, h) %The output similar to an exponential curve

%% Question 4
clear all;
close all;
clc;
h1 = [-0.0012,-0.0025,-0.0045,-0.0068,-0.0073,-0.0030,0.0089,0.0297,0.0583,0.0907,0.1208,0.1422,0.1500,0.1422,0.1208,0.0907,0.0583,0.0297,0.0089,-0.0030,-0.0073,-0.0068,-0.0045,-0.0025,-0.0012];

h2 = [0.0004,-0.0017,-0.0064,-0.0076,0.0073,0.0363,0.0458,0.0000,-0.0802,-0.1134,-0.0419,0.0860,0.1500,0.0860,-0.0419,-0.1134,-0.0802,0.0000,0.0458,0.0363,0.0073,-0.0076,-0.0064,-0.0017,0.0004];


[freq_h1, position_h1] = freqz(h1, 8000);


[freq_h2, position_h2] = freqz(h2, 8000);

subplot (2, 2, 1);
 impz(h1, 8000);
title('h1 Impulse Response');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

subplot (2, 2, 2);
impz(h2, 8000);
title('h2 Impulse Response');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

subplot (2,2,3 );
plot (position_h1,  freq_h1);

title('h1 Frequency Response');
ylabel('Frequency(Hz)');
xlabel('Magnitude (dBs)');
grid;

subplot (2,2,4 );
plot ( position_h2, freq_h2);
title('h2 Frequency Response');
ylabel('Frequency(Hz)');
xlabel('Magnitude (dBs)');
grid;


%% Question 5
clear all;
close all;
clc;

h1 = [-0.0012,-0.0025,-0.0045,-0.0068,-0.0073,-0.0030,0.0089,0.0297,0.0583,0.0907,0.1208,0.1422,0.1500,0.1422,0.1208,0.0907,0.0583,0.0297,0.0089,-0.0030,-0.0073,-0.0068,-0.0045,-0.0025,-0.0012];

h2 = [0.0004,-0.0017,-0.0064,-0.0076,0.0073,0.0363,0.0458,0.0000,-0.0802,-0.1134,-0.0419,0.0860,0.1500,0.0860,-0.0419,-0.1134,-0.0802,0.0000,0.0458,0.0363,0.0073,-0.0076,-0.0064,-0.0017,0.0004];

t = 3;

x = 5*cos(2*pi*(500)*t)+5*cos(2*pi*(1200)*t+(0.25*pi))+5*cos(2*pi*(1800)*t+(0.5*pi));

x_h1 = My_FIR (x, h1);

x_h2 = My_FIR (x, h2);

Input = fft(x);

h1_spec = fft(x_h1);

h2_spec = fft(x_h2);

subplot (2, 2, 1);
stem( t, Input);
title('Input Spectra');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

subplot (2, 2, 2);
stem( t, h1_spec);
title('h1 Spectra');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;


subplot (2, 2, 3);
stem( t, h2_spec);
title('h2 Spectra');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

sound(Input)
sound(h1_spec)
sound(h2_spec)

%% Question 6
clear all;
close all;
clc;

Fs = 8000;
file = load('we.dat');

t= (0:length(file)-1)/Fs;

h1 = [-0.0012,-0.0025,-0.0045,-0.0068,-0.0073,-0.0030,0.0089,0.0297,0.0583,0.0907,0.1208,0.1422,0.1500,0.1422,0.1208,0.0907,0.0583,0.0297,0.0089,-0.0030,-0.0073,-0.0068,-0.0045,-0.0025,-0.0012];

h2 = [0.0004,-0.0017,-0.0064,-0.0076,0.0073,0.0363,0.0458,0.0000,-0.0802,-0.1134,-0.0419,0.0860,0.1500,0.0860,-0.0419,-0.1134,-0.0802,0.0000,0.0458,0.0363,0.0073,-0.0076,-0.0064,-0.0017,0.0004];

h1_filt = My_FIR(file, h1);

h2_filt = My_FIR(file, h2);

subplot (2, 2, 1);
stem( t, file);
title('Unfiltered Signal');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

subplot (2, 2, 2);
stem( t, h1_filt);
title('h1 filtered Signal');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

subplot (2, 2, 3);
stem( t, h2_filt);
title('h2 filtered Signal');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;


sound (file)
sound (h1_filt)
sound (h2_filt)
%% Question 7
clear all;
close all;
clc;

%% Question 8
clear all;
close all;
clc;

Fs = 8000;
file = load('ecgbn.dat');
h1 = [-0.0012,-0.0025,-0.0045,-0.0068,-0.0073,-0.0030,0.0089,0.0297,0.0583,0.0907,0.1208,0.1422,0.1500,0.1422,0.1208,0.0907,0.0583,0.0297,0.0089,-0.0030,-0.0073,-0.0068,-0.0045,-0.0025,-0.0012];

t = ( 0:length(file)-1)/Fs;

filtered = My_FIR(file, h1);
subplot (2,2,1)
plot ( t, filtered);
title('Filtered Signal');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

subplot (2,2,2)
plot ( t, file);
title('Original Signal');
xlabel('time(s)');
ylabel('Amplitude(V)');
grid;

%% Question 9
clear all;
close all;
clc;


frequency = [0 0.2 0.225 1];

amplitude = [0 1 0 1];

samples = 19;




filtered = firpm(samples, frequency, amplitude);

[h1, w1] = freqz(filtered, 1, 512);

subplot(2, 2, 1)
P1 = 20*log10(abs(h1));
P2 = w1/pi;
plot(P2, P1)
title('Frequency Response for Low Pass');
ylabel('Magnitude (V)');
xlabel('Radians (dB)');
grid;



subplot(2, 2, 2);
zplane(filtered, 1);
title('Z');
ylabel('Imaginary');
xlabel('Real');
grid;



Quantised = quantile(filtered, 4);

[h2, w2] = freqz(Quantised, 1, 512);

subplot(2, 2, 3)
P3 = 20*log10(abs(h1));
P4 = w1/pi;
plot(P4,P3)
title('Frequency Response for Low Pass Quantised');
ylabel('Magnitude (V)');
xlabel('Radians (dB)');
grid;



subplot(2, 2, 4);
zplane(Quantised, 1);
title('Z Quantised');
ylabel('Imaginary');
xlabel('Real');
grid;
%% Question 10
clear all;
close all;
clc;

r1 = 0.99
r2 = 0.9;
r3 = 0.8

theta = [pi/3];

num1 = [1-r1];
num2 = [1-r2];
num3 = [1-r3];

%denum_1 = [(1-r1)/(1-2*r1*cos(theta)+(r1^2))];
denum_1 = [1-2*r1*cos(theta) r1^2];
denum_2 = [1-2*r2*cos(theta) r2^2];
denum_3 = [1-2*r3*cos(theta) r3^2];

subplot (2,2,1)
[h1 w1] = freqz(denum_1, r1, 512);
plot(w1/pi,20*log10(abs(h1)));
title('r = 0.99');
xlabel('Frequency (Hz)');
ylabel('Amplitude(V)');
grid;

subplot (2,2,2)
[h2 w2] = freqz(denum_2, r2, 512);
plot(w2/pi,20*log10(abs(h2)));
title('r = 0.9');
xlabel('Frequency (Hz)');
ylabel('Amplitude(V)');
grid;

subplot (2,2,3)
[h3 w3] = freqz(denum_3, r3, 512);  %the frequency response is shifted up with increased r, however if r goes too high it appears to shift back down
plot(w3/pi,20*log10(abs(h3)));
title('r = 0.8');
xlabel('Frequency (Hz)');
ylabel('Amplitude(V)');
grid;


%% Question 11
clear all;
close all;
clc;

Val_1 = pi/6 ;
Val_2 = pi/3;
Val_3 = pi/2;
r = 0.9;

num = [1-r];
denum_1 = [1-2*r*cos(Val_1) r^2];
denum_2 = [1-2*r*cos(Val_2) r^2];
denum_3 = [1-2*r*cos(Val_3) r^2];

subplot (2,2,1)
[h1 w1] = freqz(denum_1, num, 512);
plot(w1/pi,20*log10(abs(h1)));
title('pi/6')
xlabel('Frequency (Hz)');
ylabel('Amplitude(V)');

grid;

subplot (2,2,2)
[h2 w2] = freqz(denum_2, num, 512);
plot(w2/pi,20*log10(abs(h2)));
title('pi/3')
xlabel('Frequency (Hz)');
ylabel('Amplitude(V)');

grid;

subplot (2,2,3)
[h3 w3] = freqz(denum_3, num, 512);
plot(w3/pi,20*log10(abs(h3)));
title('pi/2')
xlabel('Frequency (Hz)');
ylabel('Amplitude(V)');
grid;

%% Question 12
clear all;
close all;
clc;

file = load('pcm.mat');

n = length(file);
n2 = 1:n;

transformed = fft(file);
y = zeros(1,n);
x = zeros (1,n);

x(1) = 1;

for count= 3: n
    y(N) = file(count) - 1.5*file(count-1) + data(count - 2)+ 1.6*y(count - 1)- 0.9*y(count-2);
end

res_1 = abs(fft(y));
params = [1 1.5, 0.9];
param2 = 1.6;

res_2 = filter(params, param2, file);

final = fft(res_2);

subplot (2,2,1)
plot(file)
grid
subplot(2,2,2)
stem(n2, transformed);
subplot(2,2,3)
stem(n2, res_1);
grid
subplot (2,2,4);
stem(n2, res_2);
grid

sound(file)
sound(res_2)

%% Question 13
clear all;
close all;
clc;

%% Question 14
clear all;
close all;
clc;


%% Question 15
clear all;
close all;
clc;

Fs= 44.1*10^3;

t = 0:1/Fs:1;

signal = -pi/2*sin(t)

Transformed = hilbert(signal);

plot(t,real(Transformed),t,imag(Transformed))
legend('real','imaginary')
title('Hilbert Transformation')



