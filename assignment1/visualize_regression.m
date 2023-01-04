function visualize_regression(spiro_resampled, belt,flow1, flow2, flow3)
    %% PLOTTING %%
    t = ( 0:size(belt,1)-1 ) / 50;
    figure
    subplot(211)
    plot(t, spiro_resampled, 'k')
    hold on
    plot(t, flow1, 'r')
    plot(t, flow2, 'b')
    plot(t, flow3, 'g')
    title('Measured and predicted flows')
    xlabel('time [s]')
    ylabel('flow [ml/s]')
    legend('Spirometer (resampled)', 'Model 1', 'Model 2', 'Model 3')
    subplot(212)
    title('Belt signals')
    plot(t, belt(:,1), 'b')
    hold on
    plot(t, belt(:,2), 'g')
    xlabel('time [s]')
    ylabel('respiratory effort [a.u.]')
    legend('Belt 1', 'Belt 2')
    ylim([-700 700])
end

