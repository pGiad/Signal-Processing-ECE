% PANAGIOTIS GIADIKIAROGLOU
% 03119185


% Askisi 1
% Meros 1.1

% Erwthma 1.1.a

a=1;
b2=[0.55 0 0.45];
b5=[0.55 0 0 0 0 0.45];


% Erwthma 1.1.b

figure (1)
freqz(b2,a)
title('Frequency responce of echo effect filter for P=2')
figure (2)
freqz(b5,a)
title('Frequency responce of echo effect filter for P=5')
% Paratiroume oti me megalutero P exoume kai megaluteri syxnotita


% Erwthma 1.1.c

[z2_echo,p2_echo,k2_echo] = tf2zpk(b2,a);
figure (3)
zplane(z2_echo, p2_echo)
title('Zero pole diagram of echo effect filter for P=2')
[z5_echo,p5_echo,k5_echo] = tf2zpk(b5,a);
figure (4)
zplane(z5_echo, p5_echo)
title('Zero pole diagram of echo effect filter for P=5')
% H sinartisi tf2zp() den leitourgei gia arnitikous ekthetes se antithesi
% me thn sinartisi tf2zpk()
% Paratiroume pws to p isoutai me ton arithmo midenikwn kai ton arithmo polwn


% Erwthma 1.1.d

figure (5)
impz(b2,a)
title('Impulse response of echo effect filter for P=2')
figure (6)
impz(b5,a)
title('Impulse response of echo effect filter for P=5')
% Paratiroume oti oi times pou emfanizontai gia to impulse response
% einai ises me tis times tou b2 kai tou b5 gia P=2 kai P=5 antistoixa


% Erwthma 1.1.e

[h_echo,t_echo] = impz(b2,a);
h_help = conv(h_echo,h_echo);
h_reverb = conv(h_help, h_echo);

Toepl = toeplitz(h_reverb);
a_rev = (inv(Toepl))*h_reverb;
b_rev = h_reverb;
% Ara ai = [1, 0, 0, 0, 0]
% Apo ton typo 4.3.11 sth selida 240 tou vivliou tou k. Maragkou
% kai apo to ai pou vrikame prokuptei oti:
% bi = h_reverb = [0.1664, 0, 0.4084, 0, 0.3341, 0, 0.0911]

figure (7)
freqz(b_rev,a_rev)
title('Frequency responce of reverb effect filter for P=2')

[z_rev,p_rev,k_rev] = tf2zpk(b_rev,a_rev);
figure (8)
zplane(z_rev,p_rev)
title('Zero pole diagram of reverb effect filter for P=2')

figure (9)
impz(b_rev,a_rev)
title('Impulse response of reverb effect filter for P=2')


% Erwthma 1.1.st

% Apo Z transform sth sxesh h1[n]*h2[n] = delta[n] prokuptei oti:
% H1(Z)H2(Z) = 1. Epomenws apo th sxesh 5.3.7 sth selida 281 tou vivliou
% tou k. Maragkou prokuptei amesa to akoloutho:
a_der = b_rev;
b_der = a_rev;
[h_dereverb, t_der] = impz(b_der, a_der);

% Elegxos me to shma x[n] = u[n] - u[n-5]
n = -1:1:6;
x = heaviside(n) - heaviside(n-5);
figure (10)
stem(n, x);
title('x[n] = u[n] - u[n-5]');
xlabel('Samples');
ylabel('Amplitude');

x_rev = conv(x, h_reverb);
x_der = conv(x_rev, h_dereverb);

n_new = -1:1:307;
figure(11)
stem(n_new, x_der);
title('Dereverbed x[n]');
xlabel('Samples');
ylabel('Amplitude');
xlim([-1 6]);
% Prokuptei to idio shma x, opws anamenotan



% Meros 1.2

% Erwthma 1.2.a

p1 = [0.65+0.65.*1i 0.65-0.65.*1i 0.65+0.65.*1i 0.65-0.65.*1i]';
z1 = [0.8 0.8 0.8.*1i -0.8.*1i]';
figure (12)
zplane(z1, p1)
title('Zero pole diagram of bandpass filter')
[b,a1] = zp2tf(z1,p1,1);
% thetw k=1 


% Erwthma 1.2.b

figure (13)
freqz(b,a1);
title('Frequency response of bandpass filter')


% Erwthma 1.2.c

figure (14)
impz(b,a1);
title('Impulse response of bandpass filter')
figure (15)
stepz(b,a1)
title('Step response of bandpass filter')


% Erwthma 1.2.d

p2 = [0.7+0.7.*1i 0.7-0.7.*1i 0.7+0.7.*1i 0.7-0.7.*1i]';
[b_p2,a_p2] = zp2tf(z1,p2,1);
figure (16)
freqz(b_p2,a_p2);
title('Frequency response of bandpass filter p2')
figure (17)
impz(b_p2,a_p2);
title('Impulse response of bandpass filter p2')
figure (18)
zplane(z1, p2)
title('Zero pole diagram of bandpass filter p2')

p3 = [0.707+0.707.*1i 0.707-0.707.*1i 0.707+0.707.*1i 0.707-0.707.*1i]';
[b_p3,a_p3] = zp2tf(z1,p3,1);
figure (19)
impz(b_p3,a_p3);
title('Impulse response of bandpass filter p3')
figure (20)
zplane(z1, p3)
title('Zero pole diagram of bandpass filter p3')

p4 = [0.75+0.75.*1i 0.75-0.75.*1i 0.75+0.75.*1i 0.75-0.75.*1i]';
[b_p4,a_p4] = zp2tf(z1,p4,1);
figure (21)
impz(b_p4,a_p4);
title('Impulse response of bandpass filter p4')
figure (22)
zplane(z1, p4)
title('Zero pole diagram of bandpass filter p4')


% Erwthma 1.2.e

p5 = [0.4+0.7.*1i 0.4-0.7.*1i 0.4+0.7.*1i 0.4-0.7.*1i]';
figure (23)
zplane(z1,p5)
title('Zero pole diagram of bandpass filter p5')

[b_p5,a_p5] = zp2tf(z1,p5,1);
figure (24)
freqz(b_p5,a_p5)
title('Frequency response of bandpass filter p5')


% Erwthma 1.2.st

z2 = [0.77+0.2.*1i 0.77-0.2.*1i 0.2+0.77.*1i 0.2-0.77.*1i]';
figure (25)
zplane(z2,p1)
title('Zero pole diagram of bandpass filter z2')

[b_z2,a_z2] = zp2tf(z2,p1,1);

figure (26)
freqz(b_z2,a_z2)
title('Frequency response of bandpass filter z2')

z3 = [0.4+0.7.*1i 0.4-0.7.*1i 0.7+0.4.*1i 0.7-0.4.*1i]';
figure (27)
zplane(z3,p1)
title('Zero pole diagram of bandpass filter z3')

[b_z3,a_z3] = zp2tf(z3,p1,1);

figure (28)
freqz(b_z3,a_z3)
title('Frequency response of bandpass filter z3')




% Askisi 2
% Meros 2.1

% Erwthma 2.1.a

[y_series,fs]=audioread("viola_series.wav");
sound(y_series,fs);
ts=1/fs;
t = 0:ts:(length(y_series)*ts)-ts;
figure (29)
plot(t, y_series);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Signal of Viola Series');


% Erwthma 2.1.b

y_series_norm = normalize(y_series, 'range', [-1, 1]);
figure (30)
plot(t, y_series_norm);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Normalized Signal of Viola Series');

w = hamming(1000);
y_squared = y_series_norm.^2;
E = conv(y_squared, w);
t_nrg = 0:ts:(length(E)*ts)-ts;
y_nrg_norm = normalize(y_series, 'range', [-65 65]);
figure (31)
plot(t, y_nrg_norm);
hold on
plot(t_nrg, E);
hold off
xlabel('Time(sec)');
ylabel('Amplitude');
title('Energy of Viola Series');


% Erwthma 2.1.c

DFT_y_series = fft(y_series);
N=length(DFT_y_series);
fy = 0:fs/N:fs-fs/N;
figure (32)
plot(fy, abs(DFT_y_series(1:N)));
xlim([0 5000]);
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('DFT of Viola Series');


% Erwthma 2.1.d

figure (33)
plot(t,y_series);
xlim([5.1 6.8])
xlabel('Time(sec)');
ylabel('Amplitude');
title('Signal of Third Viola Note');

figure (34)
plot(t, y_series);
xlim([5.26 5.3])
xlabel('Time(sec)');
ylabel('Amplitude');
title('Zoomed Signal of Third Viola Note');
% Epoptika h periodos tou simatos ypologistike 3.49ms


% Erwthma 2.1.e

limitsForNote = (t>5.1) & (t<6.8);
Y_note = fft(y_series(limitsForNote), fs);
N_note = length(Y_note);
fy_note = 0:fs/N_note:fs-fs/N_note;
figure (35)
plot(fy_note, abs(Y_note(1:N_note)));
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('DFT of Third Viola Note');
xlim([0 5000]);
% H megisth timh tou fasmatos einai sta 287 ara f0 = 287 Hz


% Erwthma 2.1.st

[y_note_st, fs_note_st] = audioread("viola_note.wav");
ts_note_st = 1/fs_note_st;
t_note_st = 0:ts_note_st:(length(y_note_st)*ts_note_st)-ts_note_st;
figure (36)
plot(t_note_st, y_note_st);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Viola Note');

DFT_y_note_st = fft(y_note_st);
N_note_st = length(DFT_y_note_st)-1;
fy_note_st = 0:fs_note_st/N_note_st:fs_note_st/2-fs_note_st/N_note_st;
figure (37)
plot(fy_note_st, abs(DFT_y_note_st(1:N_note_st/2)));
xlim([0 5000]);
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('DFT of Viola Note');

p_viola1 = [0.994+0.09.*1i 0.994-0.09.*1i 0.994+0.09.*1i 0.994-0.09.*1i]';
z_viola1 = [0.85 -0.85 0.85.*1i -0.85.*1i]';
figure (38)
zplane(z_viola1,p_viola1);
title('Zero pole diagram of bandpass filter Harmonic 2');
[b_viola1, a_viola1] = zp2tf(z_viola1, p_viola1, 0.00001);
figure (39)
freqz(b_viola1, a_viola1);
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('Frequency response of bandpass filter Harmonic 2');

y_filter1 = filter(b_viola1, a_viola1, y_note_st);
t_note_filter1 = 0:ts_note_st:(length(y_filter1)*ts_note_st)-ts_note_st;
figure (40)
plot(t_note_filter1, y_filter1);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Filtered viola note Harmonic 2');

DFT_y_filter1 = fft(y_filter1);
figure (41)
plot(fy_note_st, abs(DFT_y_filter1(1:N_note_st/2)));
xlim([0 5000]);
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('DFT of viola note Harmonic 2');

p_viola2 = [0.9782+0.184.*1i 0.9782-0.184.*1i 0.9782+0.184.*1i 0.9782-0.184.*1i]';
z_viola2 = [0.85 -0.85 0.85.*1i -0.85.*1i]';
figure (42)
zplane(z_viola2,p_viola2);
title('Zero pole diagram of bandpass filter Harmonic 4');
[b_viola2, a_viola2] = zp2tf(z_viola2, p_viola2, 0.0001);
figure (43)
freqz(b_viola2, a_viola2);
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('Frequency response of bandpass filter Harmonic 4');

y_filter2 = filter(b_viola2, a_viola2, y_note_st);
t_note_filter2 = 0:ts_note_st:(length(y_filter2)*ts_note_st)-ts_note_st;
figure (44)
plot(t_note_filter2, y_filter2);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Filtered viola note Harmonic 4');

DFT_y_filter2 = fft(y_filter2);
figure (45)
plot(fy_note_st, abs(DFT_y_filter2(1:N_note_st/2)));
xlim([0 5000]);
xlabel('Frequency(Hz)');
ylabel('Amplitude');
title('DFT of viola note Harmonic 4');



% Meros 2.2

% Erwthma 2.2.a

[y_piano, fs_piano] = audioread("piano_note.wav");
sound(y_piano, fs_piano);
ts_piano=1/fs_piano;
t_piano = 0:ts_piano:(length(y_piano)*ts_piano)-ts_piano;
figure (46)
plot(t_piano,y_piano);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Signal of Piano Note');


% Erwthma 2.2.b

% (1/44.1kHz)*P = 0.15 => P = 6615
a_piano = 1;
b_piano = zeros(1, 6615);
b_piano(1) = 0.6;
b_piano(6615) = 0.4;

[h_piano_echo, th_piano] = impz(b_piano, a_piano);
piano_echo = filter(b_piano, a_piano, y_piano);
t_piano_echo = 0:ts_piano:(length(piano_echo)*ts_piano)-ts_piano;

sound(piano_echo, fs_piano);

figure (47)
plot(t_piano_echo, piano_echo);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Echoed Piano Note');

piano_help = conv(h_piano_echo, h_piano_echo);
h_piano_reverb = conv(h_piano_echo, piano_help);

%toepl_rev = toeplitz(h_piano_reverb);
%ai_piano_rev = (inv(toepl_rev))*h_piano_reverb;
ai_piano_rev = 1;
bi_piano_rev = h_piano_reverb;
% O ypologismos tou ai_piano_rev mesw tou toeplitz kathisterei arketa
% to programma kai thn emfanish twn diagrammatwn kai gia auto
% xrhsimopoieitai apeutheias to apotelesma ai_piano_rev = 1

piano_reverb = filter(bi_piano_rev, ai_piano_rev, y_piano);
t_piano_reverb = 0:ts_piano:(length(piano_reverb)*ts_piano)-ts_piano;

sound(piano_reverb, fs_piano);

figure (48)
plot(t_piano_reverb, piano_reverb);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Reverbed Piano Note');


% Erwthma 2.2.c

DFT_y_piano = fft(y_piano);
figure (49)
plot(20*log10(abs(DFT_y_piano(2:end))));
xlabel('Frequency(Hz)');
ylabel('Amplitude(dB)');
title('DFT of Piano Note');

DFT_piano_echo = fft(piano_echo);
figure (50)
plot(20*log10(abs(DFT_piano_echo(2:end))));
xlabel('Frequency(Hz)');
ylabel('Amplitude(dB)');
title('DFT of Echoed Piano Note');

DFT_piano_reverb = fft(piano_reverb);
figure (51)
plot(20*log10(abs(DFT_piano_reverb(2:end))));
xlabel('Frequency(Hz)');
ylabel('Amplitude(dB)');
title('DFT of Reverbed Piano Note');


% Erwthma 2.2.d

% Meta apo parathrhseis gia thn apostash tou arxikou apo to echoed shma
% kai meta apo arketes dokimes kateliksa oti to echo effect arxizei na mhn
% paratiteitai otan P ~= 1602 kai ara to delay einai 36.327 ms
a_piano_mdf(1) = 1;
b_piano_mdf = zeros(1, 1602);
b_piano_mdf(1) = 0.6;
b_piano_mdf(1602) = 0.4;

piano_mdf_echo = filter(b_piano_mdf, a_piano_mdf, y_piano);
t_piano_mdf_echo = 0:ts_piano:(length(piano_mdf_echo)*ts_piano)-ts_piano;

sound(piano_mdf_echo, fs_piano);

figure (52)
plot(t_piano_mdf_echo, piano_mdf_echo);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Modified Echoed Piano Note');


% Erwthma 2.2.e

audiowrite("piano_echo.wav", piano_echo, fs_piano);
audiowrite("piano_reverb.wav", piano_reverb, fs_piano);


% Erwthma 2.2.st

ai_piano_der = bi_piano_rev;
bi_piano_der = ai_piano_rev;

piano_dereverb = filter(bi_piano_der, ai_piano_der, piano_reverb);
t_piano_dereverb = 0:ts_piano:(length(piano_dereverb)*ts_piano)-ts_piano;

figure (53)
plot(t_piano,y_piano);
hold on
plot(t_piano_dereverb, piano_dereverb);
hold off
xlabel('Time(sec)');
ylabel('Amplitude');
title('Dereverbed and Original Piano Note');
xlim([0 1.2]);
ylim([-0.03 0.04]);


% Erwthma 2.2.z

% 5 Samples Off
a_piano_5 = 1;
b_piano_5 = zeros(1, 6620);
b_piano_5(1) = 0.6;
b_piano_5(6620) = 0.4;

[h_piano_echo_5, th_piano_5] = impz(b_piano_5, a_piano_5);

piano_help_5 = conv(h_piano_echo_5, h_piano_echo_5);
h_piano_reverb_5 = conv(h_piano_echo_5, piano_help_5);

%toepl_rev_5 = toeplitz(h_piano_reverb_5);
%ai_piano_rev_5 = (inv(toepl_rev_5))*h_piano_reverb_5;
ai_piano_rev_5 = 1;
bi_piano_rev_5 = h_piano_reverb_5;

ai_piano_der_5 = bi_piano_rev_5;
bi_piano_der_5 = ai_piano_rev_5;

piano_dereverb_5 = filter(bi_piano_der_5, ai_piano_der_5, piano_reverb);
t_piano_dereverb_5 = 0:ts_piano:(length(piano_dereverb_5)*ts_piano)-ts_piano;

figure (54)
plot(t_piano_dereverb_5, piano_dereverb_5);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Dereverbed Signal (5 Samples Off)');

ai_final_5 = ai_piano_der_5.*ai_piano_rev;
bi_final_5 = bi_piano_der_5.*bi_piano_rev;

figure (55)
freqz(bi_final_5, ai_final_5);
title('Frequency response of dereverb filter (5 Samples Off)')

% 10 Samples Off
a_piano_10 = 1;
b_piano_10 = zeros(1, 6625);
b_piano_10(1) = 0.6;
b_piano_10(6625) = 0.4;

[h_piano_echo_10, th_piano_10] = impz(b_piano_10, a_piano_10);

piano_help_10 = conv(h_piano_echo_10, h_piano_echo_10);
h_piano_reverb_10 = conv(h_piano_echo_10, piano_help_10);

%toepl_rev_10 = toeplitz(h_piano_reverb_10);
%ai_piano_rev_10 = (inv(toepl_rev_10))*h_piano_reverb_10;
ai_piano_rev_10 = 1;
bi_piano_rev_10 = h_piano_reverb_10;

ai_piano_der_10 = bi_piano_rev_10;
bi_piano_der_10 = ai_piano_rev_10;

piano_dereverb_10 = filter(bi_piano_der_10, ai_piano_der_10, piano_reverb);
t_piano_dereverb_10 = 0:ts_piano:(length(piano_dereverb_10)*ts_piano)-ts_piano;

figure (56)
plot(t_piano_dereverb_10, piano_dereverb_10);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Dereverbed Signal (10 Samples Off)');

ai_final_10 = ai_piano_der_10.*ai_piano_rev;
bi_final_10 = bi_piano_der_10.*bi_piano_rev;

figure (57)
freqz(bi_final_10, ai_final_10);
title('Frequency response of dereverb filter (10 Samples Off)')

% 50 Samples Off
a_piano_50 = 1;
b_piano_50 = zeros(1, 6665);
b_piano_50(1) = 0.6;
b_piano_50(6665) = 0.4;

[h_piano_echo_50, th_piano_50] = impz(b_piano_50, a_piano_50);

piano_help_50 = conv(h_piano_echo_50, h_piano_echo_50);
h_piano_reverb_50 = conv(h_piano_echo_50, piano_help_50);

%toepl_rev_50 = toeplitz(h_piano_reverb_50);
%ai_piano_rev_50 = (inv(toepl_rev_50))*h_piano_reverb_50;
ai_piano_rev_50 = 1;
bi_piano_rev_50 = h_piano_reverb_50;

ai_piano_der_50 = bi_piano_rev_50;
bi_piano_der_50 = ai_piano_rev_50;

piano_dereverb_50 = filter(bi_piano_der_50, ai_piano_der_50, piano_reverb);
t_piano_dereverb_50 = 0:ts_piano:(length(piano_dereverb_50)*ts_piano)-ts_piano;

figure (58)
plot(t_piano_dereverb_50, piano_dereverb_50);
xlabel('Time(sec)');
ylabel('Amplitude');
title('Dereverbed Signal (50 Samples Off)');

ai_final_50 = ai_piano_der_50.*ai_piano_rev;
bi_final_50 = bi_piano_der_50.*bi_piano_rev;

figure (59)
freqz(bi_final_50, ai_final_50);
title('Frequency response of dereverb filter (50 Samples Off)')

% Original
ai_final = ai_piano_der.*ai_piano_rev;
bi_final = bi_piano_der.*bi_piano_rev;

figure (60)
freqz(bi_final, ai_final);
title('Frequency response of original dereverb filter')

