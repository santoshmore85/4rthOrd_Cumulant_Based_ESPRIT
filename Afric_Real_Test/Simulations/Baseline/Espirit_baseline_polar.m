%% Afric_Sim_test_espirit
%% Initializations
% Setting up the enviornment\
clear;clc;
alpha = 1; %ground weighting factor
beta = 1;   %veg weighting factor
Noise_weight = 0;% Added Noise to the System

Pol_ground = [1;1;0]./sqrt(2); %Multivatiant Ground
Pol_vegitation = [1;0;1]./sqrt(2); %Multivariant Vegitation

ground_angle = pi/4; %45
vegitation_angle = pi/6;%30

array_size = 6;
Averaged_samples = 100;

angle1 = 0;
angle2 = 0;
%% Matrix Calculations
% Implimenting an average loop of x samples
for Averaged_sample = 1:Averaged_samples;
    
    phi_one = 1i*2*pi*rand;
    phi_two = 1i*2*pi*rand;
    
    position = 1:array_size;
    distance = 2*pi*position/2;  % element separation of 1/2 wavelength
    
    g_polar =  Pol_ground*exp(phi_one);
    v_polar =  Pol_vegitation*exp(phi_two);
    
    g_polar_angle = g_polar*exp(-1i*distance*sin(ground_angle));
    v_polar_angle = v_polar*exp(-1i*distance*sin(vegitation_angle));
    
    signal = alpha*g_polar_angle + beta*v_polar_angle;
    
    signal_Noise = signal + Noise_weight*sqrt(-2*log(1-rand(3,array_size))).*exp(1i*2*pi*rand(3,array_size));
    
    S1 = [signal_Noise(:,1),signal_Noise(:,2)];
    S2 = [signal_Noise(:,5),signal_Noise(:,6)];
    
    R1 = S1*S1';
    R2 = S1*S2';
    
    A=pinv(R1)*R2;
    [u,c] = eig(A);
    
    sg = abs(Pol_ground'*u);
    [n,kk] = sort(sg,'descend');
    
    angle1 = angle1 + angle(c(kk(1),kk(1)));

    sv = abs(Pol_vegitation'*u);
    [~,kk] = sort(sv,'descend');
    
    angle2 = angle2 + angle(c(kk(1),kk(1)));
     
end
angle1 = angle1/Averaged_sample;
angle2 = angle2/Averaged_sample;
angle1*180/pi
angle2*180/pi
%% Ploting Results
% figure(1)
% hold on;
% plot(phi1*180/pi,'b+');
% plot(phi2*180/pi,'ro');
% hold off
%
% figure(2)
% hold on;
% plot(mag1,'b+');
% plot(mag2,'ro');
% hold off;