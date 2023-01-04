function visualize_filter(FS, ecg1, ecg2, b, a, ecg1_filtered, ecg2_filtered)
    figure
    
    subplot(4,2,1)
    plot( (0:length(ecg1)-1)/FS, ecg1 )
    hold on
    plot( (0:length(ecg1_filtered)-1)/FS, ecg1_filtered )
    ylabel('Amplitude [a.u.]')
    xlabel('Time [s]')
    title('ECG 1')
    xlim([0 length(ecg1)/FS])
    ylim([-2 3])
    legend('original','filtered');
    
    subplot(4,2,2)
    plot( (0:length(ecg2)-1)/FS, ecg2 )
    hold on
    plot( (0:length(ecg2_filtered)-1)/FS, ecg2_filtered )
    ylabel('Amplitude [a.u.]')
    xlabel('Time [s]')
    title('ECG 2')
    xlim([0 length(ecg2)/FS])
    ylim([-2 3])
    legend('original','filtered');
    
    subplot(4,2,3)
    plot( (0:length(ecg1)-1)/FS, ecg1 )
    hold on
    plot( (0:length(ecg1_filtered)-1)/FS, ecg1_filtered )
    ylabel('Amplitude [a.u.]')
    xlabel('Time [s]')
    title('ECG 1')
    xlim([2 3])
    ylim([-2 3])
    legend('original','filtered');
    
    subplot(4,2,4)
    plot( (0:length(ecg2)-1)/FS, ecg2 )
    hold on
    plot( (0:length(ecg2_filtered)-1)/FS, ecg2_filtered )
    ylabel('Amplitude [a.u.]')
    xlabel('Time [s]')
    title('ECG 2')
    xlim([1 2])
    ylim([-2 3])
    legend('original','filtered');
    
    subplot(4,2,5)
    periodogram(ecg1,[],[],FS)
    title('Original PSD')
    ylabel('Power [a.u.]')
    
    subplot(4,2,6)
    periodogram(ecg2,[],[],FS)
    title('Original PSD')
    ylabel('Power [a.u.]')
    
    subplot(4,2,7)
    periodogram(ecg1_filtered,[],[],FS)
    title('Filtered PSD')
    ylabel('Power [a.u.]')
    
    subplot(4,2,8)
    periodogram(ecg2_filtered,[],[],FS)
    title('Filtered PSD')
    ylabel('Power [a.u.]')
    
    figure
    freqz(b,a,[],FS); 
    title('Frequency response of the MA filter');
end

