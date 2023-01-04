function visualize_qrs(T, ECG, ECG_filtered1, ECG_filtered2, ECG_filtered3, ECG_filtered5, QRSStart_ECG, QRSEnd_ECG, delays)
    subplot(6,1,1);
    plot((1:length(ECG))*T,ECG);
    xlabel('Time (s)');
    ylabel('A.U.');
    title('Original');
    
    subplot(6,1,2);
    plot((1:length(ECG_filtered1))*T,ECG_filtered1);
    xlabel('Time (s)');
    ylabel('A.U.');
    title('Lowpass filtered');
    
    subplot(6,1,3);
    plot((1:length(ECG_filtered2))*T,ECG_filtered2);
    xlabel('Time (s)');
    ylabel('A.U.');
    title('Highpass filtered');
    
    subplot(6,1,4);
    plot((1:length(ECG_filtered3))*T,ECG_filtered3);
    xlabel('Time (s)');
    ylabel('A.U.');
    title('Derivative filtered');
    
    subplot(6,1,5);
    plot((1:length(ECG_filtered5))*T,ECG_filtered5);
    xlabel('Time (s)');
    ylabel('A.U.');
    title('Moving-window integrator output');
    
    
    time_axis = (1:length(ECG))*T;
    hold on; % Output of P-T
    plot(time_axis(QRSStart_ECG),ECG_filtered5(QRSStart_ECG),'r*');
    plot(time_axis(QRSEnd_ECG),ECG_filtered5(QRSEnd_ECG),'ro');
    
    delays = round(delays); % to make plotting more robust in case rounding errors added up
    subplot(6,1,6);hold on; % ECG-channel
    plot((1:length(ECG))*T,ECG);
    plot(time_axis((QRSStart_ECG-delays)),ECG((QRSStart_ECG-delays)),'r*');
    plot(time_axis((QRSEnd_ECG-delays)),ECG((QRSEnd_ECG-delays)),'ro');
    xlabel('Time (s)');
    ylabel('A.U.');
    title('Original marked');
    
    
    % **Computation of parameters************************************
    beats = length(QRSStart_ECG);
    disp(['# beats: ', num2str(beats)]);
    averageRRinterval = mean(QRSStart_ECG(2:length(QRSStart_ECG))-QRSStart_ECG(1:(length(QRSStart_ECG)-1)))*T*1000;
    disp(['avg R-R: ', num2str(averageRRinterval)]);
    stdRRinterval = std(QRSStart_ECG(2:length(QRSStart_ECG))-QRSStart_ECG(1:(length(QRSStart_ECG)-1)))*T*1000;
    disp(['std R-R: ', num2str(stdRRinterval)]);
    heartRate = 60*1000/averageRRinterval;
    disp(['HR bpm : ', num2str(heartRate)]);
end

