include("VarnerFlux.jl")
include("Problem3matrices.jl")

# Given Parameters
w1 = 0.26
w2 = 300.0
p = 5.0
n = 1.5
K = 0.30
I = [0.0001:0.1:10...]

# Transcription Parameters
k_e_X = (60/924)
R_X = 0.15
k_d_X = 0.3
t_X = 2.7

# Translation Parameters
k_e_L = (16.5/308)
R_L = 1.6
k_d_L = 57.0
t_L = 0.8

# Arrays
F_I = [0.0001:0.1:10...]
X_I = [0.0001:0.1:10...]
U_I = [0.0001:0.1:10...]
m_I = [0.0001:0.1:10...]
L_I = [0.0001:0.1:10...]

# Control Function
for i = 1:length(1)
    F_I[i] = (I[i]^n / K^n +I[i]^n)
    X_I[i] = (U_I[i] * (k_e_X * R_X * p)) / (t_X * k_d_X + (t_X + 1) * p)
    U_I[i] = (0 + w2 * F_I[i]) / (1 + 0 + w2 * F_I[i])
    m_I[i] = X_I[i]
    L_I[i] = (1 * (k_e_L * R_L * m_I[i])) / (t_L  * k_d_L + (t_L + 1) * m_I[i])
end


(objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag) = calculate_optimal_flux_distribution(S, objective_coefficient_array, species_bounds_array, default_bounds_array, min_flag=false)
