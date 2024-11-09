data {
    int<lower=0> N; // number of observations
    // array[N] int<lower=0, upper=1> Y; // outcomes
    int<lower=0> X;
    real<lower=0> alpha; // prior hyperparameter
    real<lower=0> beta; // prior hyperparameter

}

parameters {
    real<lower=0, upper=1> theta; // probability of success
}

model {
    theta ~ beta(alpha, beta); // prior
    X ~ binomial(N, theta);

}

generated quantities {
    int predicted_y = bernoulli_rng(theta);
}