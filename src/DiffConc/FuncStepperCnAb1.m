% Function: FuncStepperCnAb1.m
% Description: Crank-Nicolson for the diffusion, Euler stepping for the NL

% ODE: 
% dv/dt = Lop v + NL
% v_{n+1} = v_{n} + ...
%     (1 - dt / 2* Lop) ^(-1) * ( (1 - dt / 2* Lop) * v_{n} + dt * NL_{n} )
% or
% v_{n+1} = v_{n} + ...
%     ML^(-1) * ( MR * v_{n} + dt * NL_{n} )
%
% Outputs: 
% vNext: the function at the next time step
% Inputs: 
% v: current function
% Mr: Matrix Mr = (1 + dt/2 * Lop)
% Mlinv: Matrix Mlinv = (1 - dt/2 * Lop)^(-1)
% NL: Nonlinear contribution at the current step
% dt: timestep

function [vNext] = FuncStepperCnAb1(v,Mr,Ml,NL,dt)

vNext = Ml \ ( Mr * v + NL .* dt );

end
