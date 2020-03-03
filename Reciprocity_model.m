% Reciprocity model :
% We want to represent the reciprocity as a function of the coupling alpha

N = 1000;       % size of the network
p = 0.01;       % probability of an edge
n = 50;         % number of networks in the graph ensemble
theta = log((1-p)/p);
x_min = -2; x_max = 10; y_min = 0; y_max = 1;
alpha = linspace(x_min,x_max,25)';    % vector containing the couplings

% Reciprocity and connectance for different values of alpha
reciprocity = zeros(length(alpha),1);
connectance = zeros(length(alpha),1);
reciprocity_exact = zeros(length(alpha),1);
connectance_exact = zeros(length(alpha),1);
reciprocity_std = zeros(length(alpha),1);
connectance_std = zeros(length(alpha),1);

for a = 1:length(alpha)
    tic;
    a

    % Generation of n graphs for a particular alpha
    m_r = zeros(n,1);
    r_r = zeros(n,1);
    recip = zeros(n,1);
    connect = zeros(n,1);

    for x = 1:n      % for each graph of the ensemble
        [m_rec r_rec] = graphe(N,p,theta,alpha(a));
        m_r(x) = m_rec;
        r_r(x) = r_rec;
        recip(x) = 2*r_r(x)/m_r(x);
        connect(x) = m_r(x)/(2*nchoosek(N,2));
    end

    % Averages over the n-graph ensemble for a given alpha
    reciprocity(a) = 2*mean(r_r)/mean(m_r);
    connectance(a) = mean(m_r)/(2*nchoosek(N,2));
    
    % Standard deviations
    reciprocity_std(a) = std(recip);
    connectance_std(a) = std(connect);
    
    toc;
end

% Analytical reciprocity and connectance
for i = 1:length(reciprocity_exact)
    reciprocity_exact(i) = (p*exp(alpha(i)))/(1-p+p*exp(alpha(i)));
    connectance_exact(i) = (p*(1+p*(exp(alpha(i))-1)))/(1+p^2*(exp(alpha(i))-1));
end
%%

figure(1)
hold on
plot(alpha,reciprocity,'or')
plot(alpha,reciprocity_exact,'b')
plot(alpha,connectance,'ok')
plot(alpha,connectance_exact,'g')
box on
axis([x_min x_max y_min y_max])
set(gca,'fontsize',15)
title('Reciprocity and connectance of the Reciprocity model')
xlabel('\alpha')
ylabel('Reciprocity or connectance')
legend('Reciprocity','Exact reciprocity','Connectance','Exact connectance','Location','northwest')
hr=errorbar(alpha,reciprocity,reciprocity_std,'.r');
hc=errorbar(alpha,connectance,connectance_std,'.k');

