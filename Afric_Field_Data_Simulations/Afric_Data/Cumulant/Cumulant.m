function [ Cumulant_11,Cumulant_12 ] = Cumulant( s1_Noise,s2_Noise ,Window_optimal)
        %% Forming the Six Arrays
        S1_2 = [s1_Noise(1,:)
            s1_Noise(2,:)
            s1_Noise(3,:)];
        
        S2_2 = [s2_Noise(1,:)
            s2_Noise(2,:)
            s2_Noise(3,:)];
        
        R11_2 = S1_2*S1_2.'/Window_optimal;
        E_h1_h1 = R11_2(1,1);
        E_h1_v1 = R11_2(1,2);
        E_h1_x1 = R11_2(1,3);
        E_v1_v1 = R11_2(2,2);
        E_v1_x1 = R11_2(2,3);
        E_x1_x1 = R11_2(3,3);
        
        R11c_2 = S1_2*S1_2'/Window_optimal;
        E_h1_h1c = R11c_2(1,1);
        E_h1_v1c = R11c_2(1,2);
        E_h1_x1c = R11c_2(1,3);
        E_v1_h1c = R11c_2(2,1);
        E_v1_v1c = R11c_2(2,2);
        E_v1_x1c = R11c_2(2,3);
        E_x1_h1c = R11c_2(3,1);
        E_x1_v1c = R11c_2(3,2);
        E_x1_x1c = R11c_2(3,3);
        
        R12c_2 = S1_2*S2_2'/Window_optimal;
        E_h1_h2c = R12c_2(1,1);
        E_h1_v2c = R12c_2(1,2);
        E_h1_x2c = R12c_2(1,3);
        E_v1_h2c = R12c_2(2,1);
        E_v1_v2c = R12c_2(2,2);
        E_v1_x2c = R12c_2(2,3);
        E_x1_h2c = R12c_2(3,1);
        E_x1_v2c = R12c_2(3,2);
        E_x1_x2c = R12c_2(3,3);
        
        R22_2 = S2_2*S2_2.'/Window_optimal;
        E_h2_h2 = R22_2(1,1);
        E_h2_v2 = R22_2(1,2);
        E_h2_x2 = R22_2(1,3);
        E_v2_v2 = R22_2(2,2);
        E_v2_x2 = R22_2(2,3);
        E_x2_x2 = R22_2(3,3);
       
        S1_4 = [s1_Noise(1,:).*s1_Noise(1,:)
            s1_Noise(2,:).*s1_Noise(2,:)
            s1_Noise(3,:).*s1_Noise(3,:)
            s1_Noise(1,:).*s1_Noise(2,:)
            s1_Noise(1,:).*s1_Noise(3,:)
            s1_Noise(2,:).*s1_Noise(3,:)];
        
        S2_4 = [s2_Noise(1,:).*s2_Noise(1,:)
            s2_Noise(2,:).*s2_Noise(2,:)
            s2_Noise(3,:).*s2_Noise(3,:)
            s2_Noise(1,:).*s2_Noise(2,:)
            s2_Noise(1,:).*s2_Noise(3,:)
            s2_Noise(2,:).*s2_Noise(3,:)];
        
        R11_4 = S1_4*S1_4'/Window_optimal;
        R12_4 = S1_4*S2_4'/Window_optimal;     
        %% Forming Cumulant One Matrix
        %% HH
        Cumulant_11(1,1) = R11_4(1,1) - E_h1_h1*conj(E_h1_h1)...
            - E_h1_h1c*E_h1_h1c ...
            - E_h1_h1c*E_h1_h1c;
        
        Cumulant_11(1,2) = R11_4(1,2) - E_h1_h1*conj(E_v1_v1)...
            - E_h1_v1c*E_h1_v1c...
            - E_h1_v1c*E_h1_v1c;
        
        Cumulant_11(1,3) = R11_4(1,3) - E_h1_h1*conj(E_x1_x1)...
            - E_h1_x1c*E_h1_x1c...
            - E_h1_x1c*E_h1_x1c;
        
        Cumulant_11(1,4) = R11_4(1,4) - E_h1_h1*conj(E_h1_v1)...
            - E_h1_h1c*E_h1_v1c...
            - E_h1_v1c*E_h1_h1c;
        
        Cumulant_11(1,5) = R11_4(1,5) - E_h1_h1*conj(E_h1_x1)...
            - E_h1_h1c*E_h1_x1c...
            - E_h1_x1c*E_h1_h1c;
        
        Cumulant_11(1,6) = R11_4(1,6) - E_h1_h1*conj(E_v1_x1)...
            - E_h1_v1c*E_h1_x1c...
            - E_h1_x1c*E_h1_v1c;
        %% VV
        Cumulant_11(2,1) = R11_4(2,1) - E_v1_v1*conj(E_h1_h1)...
            - E_v1_h1c*E_v1_h1c...
            - E_v1_h1c*E_v1_h1c;
        
        Cumulant_11(2,2) = R11_4(2,2) - E_v1_v1*conj(E_v1_v1)...
            - E_v1_v1c*E_v1_v1c...
            - E_v1_v1c*E_v1_v1c;
        
        Cumulant_11(2,3) = R11_4(2,3) - E_v1_v1*conj(E_x1_x1)...
            - E_v1_x1c*E_v1_x1c...
            - E_v1_x1c*E_v1_x1c;
        
        Cumulant_11(2,4) = R11_4(2,4) - E_v1_v1*conj(E_h1_v1)...
            - E_v1_h1c*E_v1_v1c...
            - E_v1_v1c*E_v1_h1c;
        
        Cumulant_11(2,5) = R11_4(2,5) - E_v1_v1*conj(E_h1_x1)...
            - E_v1_h1c*E_v1_x1c...
            - E_v1_x1c*E_v1_h1c;
        
        Cumulant_11(2,6) = R11_4(2,6) - E_v1_v1*conj(E_v1_x1)...
            - E_v1_v1c*E_v1_x1c...
            - E_v1_x1c*E_v1_v1c;
        %% XX
        
        Cumulant_11(3,1) = R11_4(3,1) - E_x1_x1*conj(E_h1_h1)...
            - E_x1_h1c*E_x1_h1c...
            - E_x1_h1c*E_x1_h1c;
        
        Cumulant_11(3,2) = R11_4(3,2) - E_x1_x1*conj(E_v1_v1)...
            - E_x1_v1c*E_x1_v1c...
            - E_x1_v1c*E_x1_v1c;
        
        Cumulant_11(3,3) = R11_4(3,3) - E_x1_x1*conj(E_x1_x1)...
            - E_x1_x1c*E_x1_x1c...
            - E_x1_x1c*E_x1_x1c;
        
        Cumulant_11(3,4) = R11_4(3,4) - E_x1_x1*conj(E_h1_v1)...
            - E_x1_h1c*E_x1_v1c...
            - E_x1_v1c*E_x1_h1c;
        
        Cumulant_11(3,5) = R11_4(3,5) - E_x1_x1*conj(E_h1_x1)...
            - E_x1_h1c*E_x1_x1c...
            - E_x1_x1c*E_x1_h1c;
        
        Cumulant_11(3,6) = R11_4(3,6) - E_x1_x1*conj(E_v1_x1)...
            - E_x1_v1c*E_x1_x1c...
            - E_x1_x1c*E_x1_v1c;
        %% HV
        Cumulant_11(4,1) = R11_4(4,1) - E_h1_v1*conj(E_h1_h1)...
            - E_h1_h1c*E_v1_h1c...
            - E_h1_h1c*E_v1_h1c;
        
        Cumulant_11(4,2) = R11_4(4,2) - E_h1_v1*conj(E_v1_v1)...
            - E_h1_v1c*E_v1_v1c...
            - E_h1_v1c*E_v1_v1c;
        
        Cumulant_11(4,3) = R11_4(4,3) - E_h1_v1*conj(E_x1_x1)...
            - E_h1_x1c*E_v1_x1c...
            - E_h1_x1c*E_v1_x1c;
        
        Cumulant_11(4,4) = R11_4(4,4) - E_h1_v1*conj(E_h1_v1)...
            - E_h1_h1c*E_v1_v1c...
            - E_h1_v1c*E_v1_h1c;
        
        Cumulant_11(4,5) = R11_4(4,5) - E_h1_v1*conj(E_h1_x1)...
            - E_h1_h1c*E_v1_x1c...
            - E_h1_x1c*E_v1_h1c;
        
        Cumulant_11(4,6) = R11_4(4,6) - E_h1_v1*conj(E_v1_x1)...
            - E_h1_v1c*E_v1_x1c...
            - E_h1_x1c*E_v1_v1c;
        %% HX
        Cumulant_11(5,1) = R11_4(5,1) - E_h1_x1*conj(E_h1_h1)...
            - E_h1_h1c*E_x1_h1c...
            - E_h1_h1c*E_x1_h1c;
        
        Cumulant_11(5,2) = R11_4(5,2) - E_h1_x1*conj(E_v1_v1)...
            - E_h1_v1c*E_x1_v1c...
            - E_h1_v1c*E_x1_v1c;
        
        Cumulant_11(5,3) = R11_4(5,3) - E_h1_x1*conj(E_x1_x1)...
            - E_h1_x1c*E_x1_x1c...
            - E_h1_x1c*E_x1_x1c;
        
        Cumulant_11(5,4) = R11_4(5,4) - E_h1_x1*conj(E_h1_v1)...
            - E_h1_h1c*E_x1_v1c...
            - E_h1_v1c*E_x1_h1c;
        
        Cumulant_11(5,5) = R11_4(5,5) - E_h1_x1*conj(E_h1_x1)...
            - E_h1_h1c*E_x1_x1c...
            - E_h1_x1c*E_x1_h1c;
        
        Cumulant_11(5,6) = R11_4(5,6) - E_h1_x1*conj(E_v1_x1)...
            - E_h1_v1c*E_x1_x1c...
            - E_h1_x1c*E_x1_v1c;
        %%VX
        Cumulant_11(6,1) = R11_4(6,1) - E_v1_x1*conj(E_h1_h1)...
            - E_v1_h1c*E_x1_h1c...
            - E_v1_h1c*E_x1_h1c;
        
        Cumulant_11(6,2) = R11_4(6,2) - E_v1_x1*conj(E_v1_v1)...
            - E_v1_v1c*E_x1_v1c...
            - E_v1_v1c*E_x1_v1c;
        
        Cumulant_11(6,3) = R11_4(6,3) - E_v1_x1*conj(E_x1_x1)...
            - E_v1_x1c*E_x1_x1c...
            - E_v1_x1c*E_x1_x1c;
        
        Cumulant_11(6,4) = R11_4(6,4) - E_v1_x1*conj(E_h1_v1)...
            - E_v1_h1c*E_x1_v1c...
            - E_v1_v1c*E_x1_h1c;
        
        Cumulant_11(6,5) = R11_4(6,5) - E_v1_x1*conj(E_h1_x1)...
            - E_v1_h1c*E_x1_x1c...
            - E_v1_x1c*E_x1_h1c;
        
        Cumulant_11(6,6) = R11_4(6,6) - E_v1_x1*conj(E_v1_x1)...
            - E_v1_v1c*E_x1_x1c...
            - E_v1_x1c*E_x1_v1c;
        
        %% Forming Cumulant Two Matrix
        %% HH
        Cumulant_12(1,1) = R12_4(1,1) - E_h1_h1*conj(E_h2_h2)...
            - E_h1_h2c*E_h1_h2c...
            - E_h1_h2c*E_h1_h2c;
        
        Cumulant_12(1,2) = R12_4(1,2) - E_h1_h1*conj(E_v2_v2)...
            - E_h1_v2c*E_h1_v2c...
            - E_h1_v2c*E_h1_v2c;
        
        Cumulant_12(1,3) = R12_4(1,3) - E_h1_h1*conj(E_x2_x2)...
            - E_h1_x2c*E_h1_x2c...
            - E_h1_x2c*E_h1_x2c;
        
        Cumulant_12(1,4) = R12_4(1,4) - E_h1_h1*conj(E_h2_v2)...
            - E_h1_h2c*E_h1_v2c...
            - E_h1_v2c*E_h1_h2c;
        
        
        Cumulant_12(1,5) = R12_4(1,5) - E_h1_h1*conj(E_h2_x2)...
            - E_h1_h2c*E_h1_x2c...
            - E_h1_x2c*E_h1_h2c;
        
        Cumulant_12(1,6) = R12_4(1,6) - E_h1_h1*conj(E_v2_x2)...
            - E_h1_v2c*E_h1_x2c...
            - E_h1_x2c*E_h1_v2c;
        %% VV
        Cumulant_12(2,1) = R12_4(2,1) - E_v1_v1*conj(E_h2_h2)...
            - E_v1_h2c*E_v1_h2c...
            - E_v1_h2c*E_v1_h2c;
        
        Cumulant_12(2,2) = R12_4(2,2) - E_v1_v1*conj(E_v2_v2)...
            - E_v1_v2c*E_v1_v2c...
            - E_v1_v2c*E_v1_v2c;
        
        Cumulant_12(2,3) = R12_4(2,3) - E_v1_v1*conj(E_x2_x2)...
            - E_v1_x2c*E_v1_x2c...
            - E_v1_x2c*E_v1_x2c;
        
        Cumulant_12(2,4) = R12_4(2,4) - E_v1_v1*conj(E_h2_v2)...
            - E_v1_h2c*E_v1_v2c...
            - E_v1_v2c*E_v1_h2c;
        
        Cumulant_12(2,5) = R12_4(2,5) - E_v1_v1*conj(E_h2_x2)...
            - E_v1_h2c*E_v1_x2c...
            - E_v1_x2c*E_v1_h2c;
        
        Cumulant_12(2,6) = R12_4(2,6) - E_v1_v1*conj(E_v2_x2)...
            - E_v1_v2c*E_v1_x2c...
            - E_v1_x2c*E_v1_v2c;
        %% XX
        Cumulant_12(3,1) = R12_4(3,1) - E_x1_x1*conj(E_h2_h2)...
            - E_x1_h2c*E_x1_h2c...
            - E_x1_h2c*E_x1_h2c;
        
        Cumulant_12(3,2) = R12_4(3,2) - E_x1_x1*conj(E_v2_v2)...
            - E_x1_v2c*E_x1_v2c...
            - E_x1_v2c*E_x1_v2c;
        
        Cumulant_12(3,3) = R12_4(3,3) - E_x1_x1*conj(E_x2_x2)...
            - E_x1_x2c*E_x1_x2c...
            - E_x1_x2c*E_x1_x2c;
        
        Cumulant_12(3,4) = R12_4(3,4) - E_x1_x1*conj(E_h2_v2)...
            - E_x1_h2c*E_x1_v2c...
            - E_x1_v2c*E_x1_h2c;
        
        Cumulant_12(3,5) = R12_4(3,5) - E_x1_x1*conj(E_h2_x2)...
            - E_x1_h2c*E_x1_x2c...
            - E_x1_x2c*E_x1_h2c;
        
        Cumulant_12(3,6) = R12_4(3,6) - E_x1_x1*conj(E_v2_x2)...
            - E_x1_v2c*E_x1_x2c...
            - E_x1_x2c*E_x1_v2c;
        %% HV
        
        Cumulant_12(4,1) = R12_4(4,1) - E_h1_v1*conj(E_h2_h2)...
            - E_h1_h2c*E_v1_h2c...
            - E_h1_h2c*E_v1_h2c;
        
        Cumulant_12(4,2) = R12_4(4,2) - E_h1_v1*conj(E_v2_v2)...
            - E_h1_v2c*E_v1_v2c...
            - E_h1_v2c*E_v1_v2c;
        
        Cumulant_12(4,3) = R12_4(4,3) - E_h1_v1*conj(E_x2_x2)...
            - E_h1_x2c*E_v1_x2c...
            - E_h1_x2c*E_v1_x2c;
        
        Cumulant_12(4,4) = R12_4(4,4) - E_h1_v1*conj(E_h2_v2)...
            - E_h1_h2c*E_v1_v2c...
            - E_h1_v2c*E_v1_h2c;
        
        Cumulant_12(4,5) = R12_4(4,5) - E_h1_v1*conj(E_h2_x2)...
            - E_h1_h2c*E_v1_x2c...
            - E_h1_x2c*E_v1_h2c;
        
        Cumulant_12(4,6) = R12_4(4,6) - E_h1_v1*conj(E_v2_x2)...
            - E_h1_v2c*E_v1_x2c...
            - E_h1_x2c*E_v1_v2c;
        %% HX
        Cumulant_12(5,1) = R12_4(5,1) - E_h1_x1*conj(E_h2_h2)...
            - E_h1_h2c*E_x1_h2c...
            - E_h1_h2c*E_x1_h2c;
        
        Cumulant_12(5,2) = R12_4(5,2) - E_h1_x1*conj(E_v2_v2)...
            - E_h1_v2c*E_x1_v2c...
            - E_h1_v2c*E_x1_v2c;
        
        Cumulant_12(5,3) = R12_4(5,3) - E_h1_x1*conj(E_x2_x2)...
            - E_h1_x2c*E_x1_x2c...
            - E_h1_x2c*E_x1_x2c;
        
        Cumulant_12(5,4) = R12_4(5,4) - E_h1_x1*conj(E_h2_v2)...
            - E_h1_h2c*E_x1_v2c...
            - E_h1_v2c*E_x1_h2c;
        
        Cumulant_12(5,5) = R12_4(5,5) - E_h1_x1*conj(E_h2_x2)...
            - E_h1_h2c*E_x1_x2c...
            - E_h1_x2c*E_x1_h2c;
        
        Cumulant_12(5,6) = R12_4(5,6) - E_h1_x1*conj(E_v2_x2)...
            - E_h1_v2c*E_x1_x2c...
            - E_h1_x2c*E_x1_v2c;
        % VX
        
        Cumulant_12(6,1) = R12_4(6,1) - E_v1_x1*conj(E_h2_h2)...
            - E_v1_h2c*E_x1_h2c...
            - E_v1_h2c*E_x1_h2c;
        
        Cumulant_12(6,2) = R12_4(6,2) - E_v1_x1*conj(E_v2_v2)...
            - E_v1_v2c*E_x1_v2c...
            - E_v1_v2c*E_x1_v2c;
        
        Cumulant_12(6,3) = R12_4(6,3) - E_v1_x1*conj(E_x2_x2)...
            - E_v1_x2c*E_x1_x2c...
            - E_v1_x2c*E_x1_x2c;
        
        Cumulant_12(6,4) = R12_4(6,4) - E_v1_x1*conj(E_h2_v2)...
            - E_v1_h2c*E_x1_v2c...
            - E_v1_v2c*E_x1_h2c;
        
        Cumulant_12(6,5) = R12_4(6,5) - E_v1_x1*conj(E_h2_x2)...
            - E_v1_h2c*E_x1_x2c...
            - E_v1_x2c*E_x1_h2c;
        
        Cumulant_12(6,6) = R12_4(6,6) - E_v1_x1*conj(E_v2_x2)...
            - E_v1_v2c*E_x1_x2c...
            - E_v1_x2c*E_x1_v2c; 
end

