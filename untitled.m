% Antag att z är ditt iddata-objekt med 4000 sampel
N = size(z.OutputData, 1);  % Hämtar antalet sampel

% Dela upp iddata-objektet i två delar
z_estimation = z(30:2000);     % Första 2000 sampel för estimering
z_validation = z(2001:4001);   % Sista 2000 sampel för validering

% Perform Spectral Power Analysis
P = spa(z);  % P is an IDFRD model containing frequency response data

g=etfe(z)
bode(g)


