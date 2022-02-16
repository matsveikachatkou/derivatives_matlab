function price = binomial(option_type, exercise_type, r, S_0, K, y, T, sigma, nsteps)

% check the option type
if option_type == "C"
    phi = 1;
elseif option_type == "P"
    phi = -1;
else
    disp("Not a valid option type");
end

% define up and down factors
deltat = T/nsteps;
u = exp(sigma * sqrt(deltat));
d = 1 / u;

% risk neutral probability 
q = (exp((r - y) * deltat) - d) / (u - d);

% create a binomial tree
upmoves = 0:1:nsteps;
probs = pdf('Binomial', upmoves, nsteps, q);

% terminal payoff
sT = s0*u.^(2*upmoves-nsteps);
terminal_payoff = max(phi*(sT-k),0);

if exercise_type == "E"
    % expected payoff for european put/calls
    exp_payoff = terminal_payoff * probs;
    % discont price
    price = exp(-r * T) * exp_payoff;
else
    value = terminal_payoff;
    for t=nsteps:-1:0
        % continuation value
        value = exp(-r * deltat) * value(2:end) * q + exp(-r * deltat) * value(1:end-1) * (1 - q);
        % exercise value
        upmoves = 0:1:t;
        s_payoff = s0*u.^(2*upmoves-t);
        opt_payoff = max(phi*(s_payoff-k),0);

        value = max(value, opt_payoff);
    end
    price = value(1);
end
end