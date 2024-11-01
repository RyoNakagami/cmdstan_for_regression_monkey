data {
    int<lower=0> N; // number of observations
    array[N] int<lower=0, upper=1> Y; // outcomes
    real<lower=0> alpha; // prior hyperparameter
    real<lower=0> beta; // prior hyperparameter

}

parameters {
    real<lower=0, upper=1> theta; // probability of success
}

model {
    theta ~ beta(alpha, beta); // prior

    for (n in 1:N) {
        Y[n] ~ bernoulli(theta);
    }

}
