function visualize_power(FS, ecg1, ecg2, P_ecg1, P_ecg2, f1, f2)
    figure
    
    subplot(2,2,1)
    plot( (0:length(ecg1)-1)/FS, ecg1 )
    ylabel('Amplitude [a.u.]')
    xlabel('Time [s]')
    title('ECG 1')
    xlim([0 length(ecg1)/FS])
    ylim([-2 3])
    
    subplot(2,2,2)
    plot( (0:length(ecg2)-1)/FS, ecg2 )
    ylabel('Amplitude [a.u.]')
    xlabel('Time [s]')
    title('ECG 2')
    xlim([0 length(ecg2)/FS])
    ylim([-2 3])
    
    subplot(2,2,3)
    semilogy(f1, P_ecg1(1:length(f1)));    
    xlim([f1(1) f1(end)])
    ylim([0 100]);
    title('ECG 1 Power Spectrum');
    xlabel('Frequency [Hz]');
    ylabel('Power [a.u.]');
    
    subplot(2,2,4)
    semilogy(f2, P_ecg2(1:length(f2)));    
    xlim([f2(1) f2(end)])
    ylim([0 100]);
    title('ECG 2 Power Spectrum');
    xlabel('Frequency [Hz]');
    ylabel('Power [a.u.]');
end

