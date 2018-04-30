%% TASK 1 - FIR Filter (look at "FIRsum.m")

%% TASK 2 - Test the FIR Function

clear all;
clc;
close all;

x = [1 2 3 4 5 6 7 8 9 10];
h = [0.2 0.3 0.2];

% FIR Equation Process.
Y = FIRsum(x,h);
stem(abs(Y));                                  
grid on;                      
ylabel('Magnitude');         
xlabel('Discrete Points');      
title('FIR Filtering (FIRsum)');    

% Filter Function Process.
Y2 = filter(h,1,x);
stem(abs(Y2));                                     
grid on;                        
ylabel('Magnitude');             
xlabel('Discrete Points');       
title('FIR Filtering (Function)');    

% Transfer Function Solution
Transfer_Function = tf(x,Y);

%% TASK 3 - 10 Samples.

clear all;
clc;
close all;

x = [1 2 3 4 5 6 7 8 9 10];

% Choose one, NOT both!
h = [1 1 1 1 1 1 1 1 1 1];
h = [10 20 30 40 50 60 70 80 90 100];

% FIR Equation Process.
Y = FIRsum(x,h);
stem(abs(Y));                                   
grid on;                      
ylabel('Magnitude');         
xlabel('Discrete Points');      
title('FIR Filtering (FIRsum)');    

% Filter Function Process.
Y2 = filter(h,1,x);
stem(abs(Y2));                                     
grid on;                        
ylabel('Magnitude');             
xlabel('Discrete Points');       
title('FIR Filtering (Function)');

%% TASK 4 - 1 second long signal.

clear all;
clc;
close all;

fs = 8000;
t = 0:(1/8000):(1/8000)*100; % The 100 samples.

% Sum of three sinusoids.
x = 5*cos(2*pi*(500)*t) + 5*cos(2*pi*(1200)*t + (0.25*pi)) + 5*cos(2*pi*(1800)*t + (0.5*pi));

% Plot the signal and play the sound.
plot (t,x);
grid on;
ylabel('Magnitude');             
xlabel('Time (sec)');       
title('Sinusoid Signal');
soundsc(abs(x));

%% TASK 5 - Impulse Response.

clear all;
clc;
close all;

h1 = [-0.0012 -0.0025 -0.0045 -0.0068 -0.0073 -0.0030 0.0089 0.0297 0.0583 0.0907 0.1208 0.1422 0.1500 0.1422 0.1208 0.0907 0.0583 0.0297 0.0089 -0.0030 -0.0073 -0.0068 -0.0045 -0.0025 -0.0012];
h2 = [0.0004 -0.0017 -0.0064 -0.0076 0.0073 0.0363 0.0458 0.0000 -0.0802 -0.1134 -0.0419 0.0860 0.1500 0.0860 -0.0419 -0.1134 -0.0802 0.0000 0.0458 0.0363 0.0073 -0.0076 -0.0064 -0.0017 0.0004];

% Plot both filters onto a stem graph.
stem(h1);
grid on;                      
ylabel('Magnitude');         
xlabel('Discrete Points');      
title('Impulse Response (H1)');    

stem(h2);
grid on;                      
ylabel('Magnitude');         
xlabel('Discrete Points');      
title('Impulse Response (H2)');  

% Filter the incoming signal (use 'x' from task 4!!)
Filtered_H1 = FIRsum(x,h1);
Filtered_H2 = FIRsum(x,h2);

% Carry over as the input spectrum.
Input = fft(x);

H1_spectrum = fft(Filtered_H1);
H2_spectrum = fft(Filtered_H2);

% Plot all 3 together.
subplot(2, 2, 1);
stem(t, Input);
title('Input Spectrum');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

subplot(2, 2, 2);
stem(t, H1_spectrum);
title('H1 Spectrum');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

subplot(2, 2, 3);
stem(t, H2_spectrum);
title('H2 Spectrum');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

soundsc(abs(Input));
soundsc(abs(H1_spectrum));
soundsc(abs(H2_spectrum));

%% TASK 6 - Frequency Response.

[freq_h1, position_h1] = freqz(h1, 8000);
[freq_h2, position_h2] = freqz(h2, 8000);

subplot (2, 2, 1);
impz(h1, 8000);
title('H1 Impulse Response');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

subplot (2, 2, 2);
impz(h2, 8000);
title('H2 Impulse Response');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

subplot (2, 2, 3);
plot(position_h1, freq_h1);
title('H1 Frequency Response');
ylabel('Frequency(Hz)');
xlabel('Magnitude (dBs)');
grid;

subplot (2, 2, 4);
plot(position_h2, freq_h2);
title('H2 Frequency Response');
ylabel('Frequency(Hz)');
xlabel('Magnitude (dBs)');
grid;

%% TASK 7 - Input Spectrum Speech File.

clear all;
clc;
close all;

Fs = 8000;
file = load('WE.DAT');
t = (0:length(file)-1) / Fs;

h1 = [-0.0012 -0.0025 -0.0045 -0.0068 -0.0073 -0.0030 0.0089 0.0297 0.0583 0.0907 0.1208 0.1422 0.1500 0.1422 0.1208 0.0907 0.0583 0.0297 0.0089 -0.0030 -0.0073 -0.0068 -0.0045 -0.0025 -0.0012];
h2 = [0.0004 -0.0017 -0.0064 -0.0076 0.0073 0.0363 0.0458 0.0000 -0.0802 -0.1134 -0.0419 0.0860 0.1500 0.0860 -0.0419 -0.1134 -0.0802 0.0000 0.0458 0.0363 0.0073 -0.0076 -0.0064 -0.0017 0.0004];

H1_Filtered = FIRsum(file,h1);
H2_Filtered = FIRsum(file,h2);

subplot(2, 2, 1);
stem(t,file);
title('Unfiltered Signal');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

subplot(2, 2, 2);
stem(t,H1_Filtered);
title('H1 - Filtered Signal');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

subplot(2, 2, 3);
stem(t,H2_Filtered);
title('H2 - Filtered Signal');
xlabel('Time(Sec)');
ylabel('Amplitude');
grid;

sound(file);
sound(H1_Filtered);
sound(H2_Filtered);

%% TASK 8 - 

%% TASK 9 -

%% TASK 10 - Magnitude of FFR.

clear all;
clc;
close all;

r1 = 0.99;
r2 = 0.9;
r3 = 0.8;

theta = [pi/3];

Number_1 = [1-r1];
Number_2 = [1-r2];
Number_3 = [1-r3];

DeNumber_1 = [1-2*r1*cos(theta) r1^2];
DeNumber_2 = [1-2*r2*cos(theta) r2^2];
DeNumber_3 = [1-2*r3*cos(theta) r3^2];

subplot (2,2,1)
[h1 w1] = freqz(DeNumber_1, r1, 512);
plot(w1/pi,20*log10(abs(h1)));
title('R = 0.99');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid;

subplot (2,2,2)
[h2 w2] = freqz(DeNumber_2, r2, 512);
plot(w2/pi,20*log10(abs(h2)));
title('R = 0.9');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid;

subplot (2,2,3)
[h3 w3] = freqz(DeNumber_3, r3, 512);
plot(w3/pi,20*log10(abs(h3)));
title('R = 0.8');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid;

%% TASK 11 - Magnitude of FFR (pi).

clear all;
clc;
close all;

Val_1 = pi/6;
Val_2 = pi/3;
Val_3 = pi/2;

r = 0.9;

Number = [1-r];

DeNumber_1 = [1-2*r*cos(Val_1) r^2];
DeNumber_2 = [1-2*r*cos(Val_2) r^2];
DeNumber_3 = [1-2*r*cos(Val_3) r^2];

subplot (2,2,1)
[h1 w1] = freqz(DeNumber_1, Number, 512);
plot(w1/pi,20*log10(abs(h1)));
title('pi/6')
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid;

subplot (2,2,2)
[h2 w2] = freqz(DeNumber_2, Number, 512);
plot(w2/pi,20*log10(abs(h2)));
title('pi/3')
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid;

subplot (2,2,3)
[h3 w3] = freqz(DeNumber_3, Number, 512);
plot(w3/pi,20*log10(abs(h3)));
title('pi/2')
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid;

%% TASK 12 - 

%% TASK 13 -

%% TASK 14 -

%% TASK 15 -