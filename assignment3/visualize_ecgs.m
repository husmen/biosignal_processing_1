function visualize_ecgs(t, abd_sig1, mhb, fetus, fhb, c2)
    figure

    subplot(311)
    plot( t, abd_sig1, 'b' )
    hold on
    plot( t, mhb, 'r--' )
    legend('abd\_sig1 (x = x_1 + c_2 x_2)','mhb (y = x_2)')
    xlabel('t [s]')
    ylabel('amplitude [a.u.]')
    ylim([-2 4]);
    
    subplot(312)
    plot( t, c2 * mhb )
    legend('scaled mhb (c_2 x_2)')
    xlabel('t [s]')
    ylabel('amplitude [a.u.]')
    ylim([-2 4]);
    
    subplot(313)
    plot( t, fetus, 'b' )
    hold on
    plot( t, fhb, 'r--' )
    legend('fetus (x - y = x - c_2 x_2)', 'true fetus')
    xlabel('t [s]')
    ylabel('amplitude [a.u.]')
    ylim([-2 4]);

end

