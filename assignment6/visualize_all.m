function visualize_all(N, cycles, SPCs, th, data, onsets, segment_length, systoles, PSDs)
%VISUALIZE_ALL Summary of this function goes here
%   Detailed explanation goes here
    figure;
    for i = 1:N

        subplot(3,N,i);
        plot(cycles(i).t, cycles(i).ECG);
        xlabel('Time (s)');
        ylabel('ECG amplitude (au)');
        axis tight;
        
        title(sprintf('Subj. %d.', i))
        
        subplot(3,N,N+i);
        plot(cycles(i).t, cycles(i).PCG);
        xlabel('Time (s)');
        ylabel('PCG amplitude (au)');
        axis tight;
        
        subplot(3,N,2*N+i);
        surf( SPCs(i).t, SPCs(i).f, 10*log10( SPCs(i).p + eps ), 'EdgeColor', 'none');
        axis xy; axis tight; colormap(jet); view(0,90); caxis([th 0]);
        xlabel('Time (secs)');
        colorbar('east');
        ylabel('Frequency (HZ)');
    
    end

    for i = 1:N
        figure
        subplot(2,1,1);
    
        plot(data(i).t, data(i).ECG);
        xlabel('Time (s)');
        ylabel('ECG amplitude (au)');
        hold on;
        plot(data(i).t(onsets{i}), data(i).ECG(onsets{i}), 'r*');
        plot(data(i).t(onsets{i} + segment_length), data(i).ECG(onsets{i} + segment_length), 'ro');
        axis tight;
        
        title(sprintf('Subj. %d.', i))
    
        subplot(2,1,2);
        plot(data(i).t, data(i).PCG);
        xlabel('Time (s)');
        ylabel('PCG amplitude (au)');
        hold on;
        plot(data(i).t(onsets{i}), zeros(size(onsets{i})), 'r*');  % could also plot PCG data, but that is more chaotic
        plot(data(i).t(onsets{i} + segment_length), zeros(size(onsets{i})), 'ro');
        xlabel('Time (s)');
        ylabel('PCG amplitude (au)');
        axis tight;
    
    end

    for i = 1:N
        subplot(N, 3, 3*(i-1) + 1); 
        plot(systoles{i}(1, :));
        xlabel('samples');
        ylabel('PCG (au)');
        axis tight;
        
        subplot(N, 3, 3*(i-1) + 2);
        plot(PSDs(i).F, PSDs(i).Pxx(1,:));
        grid on;
        xlabel('Frequency (Hz)');
        ylabel('PSD (dB)');
        axis tight;
        
        subplot(N, 3, 3*(i-1) + 3);
        plot(PSDs(i).F, PSDs(i).Pxx_mean);
        xlim([0,200]);
        grid on;
        xlabel('Frequency (Hz)');
        ylabel('Avg. PSD (dB)');
        axis tight;
    end
end

