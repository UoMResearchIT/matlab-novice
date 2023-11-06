second_group = 0.3;
extra_noisy = 0.1;

% Noise strengths
ns=0.005;       % Deviation from log normal plot
en_ns = 0.03;   % For extra noisy data
mu_ns=0.05;     % Noise of mean
sig_ns=0.02;    % Npise of sigma

x=1:30; % Days of trial
np=600;  % Number of patients per file

clf
hold on
for i = 1:np
    % Chooses distribution parameters
    mu=2.3;
    sig=0.7;
    damp=0.2;
    if rand<second_group
        mu=2.9;
        sig=0.3;
        damp=0.6;
    end
    % Adds noise to parameters
    mu=mu+randn*mu_ns;
    sig=sig+randn*sig_ns;

    % Computes inflamation level
    y=exp(-(log(x)-mu).^2/sig)./(x*sig*sqrt(2*3.141592)*damp);
    %plot(x,y)

    % Adds noise to data
    p_ns=ns;
    if rand<extra_noisy
        p_ns=en_ns;
    end
    r=randn(1,30)*p_ns;
    p=y+r;
    p=p.*(p>0); % Removes negative numbers
    p(1)=0;     % Makes sure it starts at 0
    p=round(p,3);

    plot(x,p,'Color',[0 0 0 0.1])
end
hold off
