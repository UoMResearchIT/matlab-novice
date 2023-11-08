function fabricate_data(varargin)
    %% Function arguments
    % Define default values
    default_filename = "";
    default_np = 60;                % Number of patients
    default_days = 40;              % Days of trial
    default_prob_group_2 = 0.3;     % Probability of patient having mu and sigma 2
    default_prob_extra_noisy = 0.1; % Probability of measurements being extra noisy
    %Input parser
    p=inputParser;
    addParameter(p,'filename',default_filename)
    addParameter(p,'np',default_np)
    addParameter(p,'days',default_days)
    addParameter(p,'prob_group_2',default_prob_group_2)
    addParameter(p,'prob_extra_noisy',default_prob_extra_noisy)
    parse(p,varargin{:})
    % Access the arguments
    filename = p.Results.filename;
    np = p.Results.np;
    days = p.Results.days;
    prob_group_2 = p.Results.prob_group_2;
    prob_extra_noisy = p.Results.prob_extra_noisy;

    %% Other defaults
    % Group parameters
    mu_1 = 2.3;     % Mean for group 1
    sig_1 = 0.7;    % Variance for group 1
    damp_1 = 0.2;   % Dampening of lognormal for group 1
    mu_2 = 2.9;     % Mean for group 2
    sig_2 = 0.3;    % Variance for group 2
    damp_2 = 0.6;   % Dampening of lognormal for group 2
    % Noise strengths
    ns=0.001;       % Deviation from log normal plot
    en_ns = 0.01;   % Deviation from log normal plot for extra noisy data
    mu_ns=0.05;     % Noise of mean
    sig_ns=0.02;    % Noise of variance

    %% Fabricate data
    % Generate random parameters for each patient
    group = rand(np, 1) < prob_group_2;
    mu = mu_1 + group*(mu_2 - mu_1) + randn(np,1)*mu_ns;
    sig = sig_1 + group*(sig_2 - sig_1) + randn(np,1)*sig_ns;
    damp = damp_1 + group*(damp_2 - damp_1);
    p_ns = ns + (rand(np, 1) < prob_extra_noisy)*(en_ns - ns);
    % Compute the inflammation level for all data points at once
    x = repmat(1:days,np,1);
    y = exp(-(log(x) - mu).^2 ./ sig) ./ (x .* sig * sqrt(2 * pi) .* damp);
    % Add noise to data for all data points at once
    r = randn(np, days) .* p_ns ./ damp;
    p = y + r;
    % Postprocessing data
    p = p .* (p > 0);   % Removes negative numbers
    p(:, 1) = 0;        % Makes sure it starts at 0
    p = round(p, 3);

    % Plot all data points with semi-transparent lines
    plot(1:days, p, 'Color', [0 0 0 0.1]);

    if filename ~= ""
        writematrix(p,filename)
    end
end
