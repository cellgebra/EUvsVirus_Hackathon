using DifferentialEquations
using LSODA
function cytokines_model(param::Array{Float64,1})
    #u0 = [32.0 411.0 89.0 9.7 6.0 73.0 460.0 6.5 172.0 35.0 51.6 4.6 312.15 159.13]
    u0 = zeros(14)
    tspan = (0.0,360.0)
    p = param
    oprob = ODEProblem(f, u0, tspan, p)
    sol = solve(oprob,lsoda(),reltol=1e-8)
    return sol
end
function f(du,u,p,t)
    connection_matrix = [1 -1 -1 1 -1 1 0 1 1 0 0 1 1 1; 1 0 0 0 0 1 1 1 1 1 0 1 0 1;1 -1 -1 1 -1 1 0 1 1 0 1 1 1 1;1 -1 -1	1 -1 1 1 1 1 1 1 1 1 1;1	-1	-1	1	-1	1	0	1	1	1	1	1	1	1
;1	-1	-1	1	-1	1	1	1	1	1	0	1	1	1
;0	0	0	0	0	0	0	0	0	0	0	0	0	0
;1	0	0	0	0	1	0	1	1	1	0	1	0	1
;1	-1	0	1	0	1	0	1	1	1	1	1	0	1
;1	-1	-1	1	-1	1	1	1	1	1	0	1	1	1
;1	0	0	0	0	1	1	1	1	1	0	1	0	1
;1	-1	-1	1	-1	1	1	1	1	1	1	1	1	1
;0	0	0	0	0	0	1	0	0	0	0	0	0	0
;1	-1	0	0	0	1	1	1	1	1	1	1	0	1]
    y = zeros(14)
    y[1] =  sum(connection_matrix[1,:].*u)
    du[1] = -1.25*u[1] + (p[1]/1+exp(-y[1]))
    y[2] = sum(connection_matrix[2,:].*u)
    du[2] = -0.769230769*u[2] + (p[2]/1+exp(-y[2]))
    y[3] = sum(connection_matrix[3,:].*u)
    du[3] = -1.0*u[3] + (p[3]/1+exp(-y[3]))
    y[4] = sum(connection_matrix[4,:].*u)
    du[4] = -0.105263158*u[4] + (p[4]/1+exp(-y[4]))
    y[5] = sum(connection_matrix[5,:].*u)
    du[5] = -0.526315789*u[5] + (p[5]/1+exp(-y[5]))
    y[6] = sum(connection_matrix[6,:].*u)
    du[6] = -0.357142857*u[6] + (p[6]/1+exp(-y[6]))
    y[7] = sum(connection_matrix[7,:].*u)
    du[7] = -1.25*u[7] + (p[7]/1+exp(-y[7]))
    y[8] = sum(connection_matrix[8,:].*u)
    du[8] = -1.25*u[8] + (p[8]/1+exp(-y[8]))
    y[9] = sum(connection_matrix[9,:].*u)
    du[9] = -0.138888889*u[9] + (p[9]/1+exp(-y[9]))
    y[10] = sum(connection_matrix[10,:].*u)
    du[10] = -1.0*u[10] + (p[10]/1+exp(-y[10]))
    y[11] = sum(connection_matrix[11,:].*u)
    du[11] = -0.227272727*u[11] + (p[11]/1+exp(-y[11]))
    y[12] = sum(connection_matrix[12,:].*u)
    du[12] = -0.526315789*u[12] + (p[12]/1+exp(-y[12]))
    y[13] = sum(connection_matrix[13,:].*u)
    du[13] = -0.909090909*u[13] + (p[13]/1+exp(-y[13]))
    y[14] = sum(connection_matrix[14,:].*u)
    du[14] = -0.716116991*u[14] + (p[14]/1+exp(-y[14]))
end
