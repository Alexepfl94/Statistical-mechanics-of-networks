function [m_av r_av] = average(H,theta,p,m,alpha,r,n,N)

% H = vector containing the Hamiltonians of each graph
% p = probabilitiy of an edge
% m = vector containing the number of directed edges of each graph
% alpha = coupling (associated with r)
% r = vector containing the reciprocity of each graph
% n = number of graphs for the statistical average
% N = size of the networks

% Partition function
%H
% Z = sum(exp(-H+min(H)));
% 
% Probability of each graph
% P = exp(-H+min(H))/Z;
% is_normalized = sum(P)

% Average m, average r
m_av = 0;   r_av = 0;

% for i = 1:n
%     m_av = m_av + m(i)*P(i);
%     r_av = r_av + r(i)*P(i);
% end

m_av = mean(m); r_av = mean(r);

end


% Z = ( (1 + (exp(alpha)-1)*p^2) / (1-p)^2 )^(nchoosek(N,2));

