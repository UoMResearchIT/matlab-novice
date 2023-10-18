
% plot_switch:
%   0 - show plots interactively
%   1 - save plots to disk

plot_switch = 0;

for idx = 1:3

    % Generate strings for file and image names:
    file_name = sprintf('data/inflammation-%02d.csv', idx);
    img_name = sprintf ('patient_data-%02d', idx);

    patient_data = csvread(file_name);
    ave_inflammation = mean(patient_data, 1);

    if plot_switch == 1
        figure(visible='off')
    else
        figure(visible='on')
    end

    tlo = tiledlayout(1,3);
    xlabel(tlo,'Day of trial')

    nexttile
    plot(ave_inflammation);
    ylabel('average')

    nexttile
    plot(max(patient_data, [], 1));
    ylabel('max')

    nexttile
    plot(min(patient_data, [], 1));
    ylabel('min')

    if plot_switch == 1
        print(img_name,'-dpng');   
        close()
    end

end
