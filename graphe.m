function [m_graphA r_graphA] = graphe(N,p,theta,alpha)

% creates a network and computes its number of directed edges m_graph
% and its reciprocity r_graph

% N = size of the network
% p = probability of an edge (constant)
% theta = coupling associated with m_graph
% alpha = coupling associated with r_graph

m_graphA = 0;    r_graphA = 0;

% creation of the adjacency matrix A of the network
A = zeros(N);
rng('shuffle');
Z_1 = (1+(exp(alpha)-1)*p^2)/((1-p)^2);
for m = 1:N-1
    for n = m+1:N
        r = rand;   s = rand;
        if (1/Z_1 < r) && (r <= (1+2*exp(-theta))/Z_1)
            if s < 1/2
                A(m,n) = 1; A(n,m) = m + 10;
            else
                A(n,m) = 1; A(m,n) = m + 10;
            end
        elseif ((1+2*exp(-theta))/Z_1 < r) && (r <= 1)
            A(m,n) = 1; A(n,m) = 1;
        else
            A(m,n) = m + 10;   % makes the matrix asymmetric
            A(n,m) = n + 10;   % (allows to calculate r_graph faster)
        end
    end
end

m_graphA = sum(sum(A==1)); 
r_graphA = (sum(sum(A==A'))-N)/2;   % -N to remove diagonal, /2 because i<j

end




