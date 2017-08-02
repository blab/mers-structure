data{
  int N; // number of grid points
  int L;// number of observations
  int J;// number of years
  int M; // number of months (usually 12)
  int year_indices[N];
  int month_indices[N];
  int X[N];
}
parameters{
  real beta[M];//
  real<lower=0> sigma_month;
  real alpha[J]; // year coefficients
  real mu_y; //
  real<lower=0> sigma_year;
}
transformed parameters{
  real<lower=0, upper=1> theta[N];
  for(i in 1:N) theta[i] = inv_logit(alpha[year_indices[i]] + beta[month_indices[i]]);
}
model{
    target += cauchy_lpdf(sigma_month | 0, 2.5);
    target += cauchy_lpdf(sigma_year | 0, 2.5);
    target += normal_lpdf(mu_y| 0, 1);
    target += normal_lpdf(beta | 0, sigma_month);
    target += normal_lpdf(alpha| mu_y, sigma_year);
    for(i in 1:N){
      target += binomial_lpmf(X[i] | L, theta[i]);
    } 
}
generated quantities{
  real theta_month[M];
  real theta_year[J];
  real log_lik[N];
  int Y_hat[N];
  for(i in 1:N){
    Y_hat[i] = binomial_rng(L, theta[i]);
    log_lik[i] = binomial_lpmf(X[i] | L, theta[i]);
  } 
  for(m in 1:M) theta_month[m] = inv_logit(beta[m]);
  for(j in 1:J) theta_year[j] = inv_logit(alpha[j]);
}
