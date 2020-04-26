This is the repository that contains the codes, parameters and literature information collected during the EUvsVirus Hackathon 24-26 April 2020 by the team 'cellgebra'.

The Data folder contains 3 files: the cytokines interactions relevant to COVID-19, the cytokines half life and the cytokines levels collected from publicly available data.

The Parameters folder contains the 500 best fit parameter sets that align our model to the experimental data.

The Model folder contains the model as an ODE system, written in Julia (v1.3).

First we load the best fit parameter set

```julia
using DelimitedFiles
param = readdlm("params_test.txt")
param = param[1:14,1]
```
Model simulation
```julia
sol = cytokines_model(param)
```
Simulation plots
```julia
using Plots
p1=plot(sol.t,sol[1,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IFNg",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=400)
p2=plot(sol.t,sol[2,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IL-1ra/IL-1",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p3=plot(sol.t,sol[3,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IL-2ra",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p4=plot(sol.t,sol[4,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IL-6",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p5=plot(sol.t,sol[5,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IL-10",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p6=plot(sol.t,sol[6,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IL-18",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p7=plot(sol.t,sol[7,:],linewidth=1.7,xlabel="Time (hours)",ylabel="HGF",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p8=plot(sol.t,sol[8,:],linewidth=1.7,xlabel="Time (hours)",ylabel="MCP-3",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p9=plot(sol.t,sol[9,:],linewidth=1.7,xlabel="Time (hours)",ylabel="MIG",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p10=plot(sol.t,sol[10,:],linewidth=1.7,xlabel="Time (hours)",ylabel="M-CSF",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p11=plot(sol.t,sol[11,:],linewidth=1.7,xlabel="Time (hours)",ylabel="G-CSF",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p12=plot(sol.t,sol[12,:],linewidth=1.7,xlabel="Time (hours)",ylabel="MIP-1a",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p13=plot(sol.t,sol[13,:],linewidth=1.7,xlabel="Time (hours)",ylabel="CTACK",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
p14=plot(sol.t,sol[14,:],linewidth=1.7,xlabel="Time (hours)",ylabel="IP-10(CXCL10)",legend=:false,legendfont=font(16),grid=:false,xtickfont=font(16),ytickfont=font(16), guidefont=font(20),dpi=500)
plot(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,size=(900,900))
```
for further details about our model outcome and analysis please visit our website: www.cellgebra-euvsvirus.com

Questions/remarks can be sent to ayoub@cellgebra.com
