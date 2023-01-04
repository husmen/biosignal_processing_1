function visualize_all(data, AF, DR, MS, ZCR, TCR, p_DR, p_MS, p_ZCR, p_TCR, c_DR, c_MS, c_ZCR, c_TCR)
%PLOT_ALL Summary of this function goes here
%   Detailed explanation goes here
    % Plot 1
    N = numel(data);  % number of segments
    
    figure;
    
    subplot(211);
    hold on;
    for i = 1:N
        plot(data(i).t, data(i).force);
    end
    axis tight;
    xlabel('Time (seconds)');
    ylabel('Force (%MVC)')
    
    subplot(212);
    hold on;
    for i = 1:N
        plot(data(i).t, data(i).EMG);
    end
    axis tight;
    xlabel('Time (seconds)');
    ylabel('EMG amplitude (mV)');
    
    % Plot 2
    % Gathering data into arrays for looping
    X = [DR; MS; ZCR; TCR];
    MODELS = {p_DR, p_MS, p_ZCR, p_TCR};
    LABELS = {'DR', 'MS', 'ZCR', 'TCR'};
    CORRS = [c_DR, c_MS, c_ZCR, c_TCR ];
    
    % Plotting linear models and raw data
    figure;
    for i = 1:4
        subplot(2,2,i);
        line = polyval(MODELS{i}, AF);  % line estimate
        plot(AF, line);
        hold on;
        plot(AF, X(i,:), 'o');
        xlabel('Force (%MVC)');
        ylabel([LABELS{i}, ' of EMG']);
        title(['Correlation ', num2str(CORRS(i))] );
    end
end

