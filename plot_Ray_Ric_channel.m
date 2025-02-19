% plot_Ray_Ric_channel.m 
clear, clf
N=200000; level=30; K_dB=[-40 -20 0 10 15];
gss=['k-s'; 'b-o';'r-^';'k-s';'b-o';'r-^' ];
% Rayleigh model
Rayleigh_ch=Ray_model(N); 
[temp,x]=hist(abs(Rayleigh_ch(1,:)),level);
plot(x,temp,gss(1,:)), hold on
% Rician model
for i=1:length(K_dB);
    Rician_ch(i,:) = Ric_model(K_dB(i),N); 
    [temp x] = hist(abs(Rician_ch(i,:)),level);
    plot(x,temp,gss(i+1,:))
    
end
xlabel('x'), ylabel('Occurrence') 
legend('Rayleigh','Rician, K=-40dB','Rician, K=-20dB','Rician, K=0dB','Rician, K=10dB','Rician, K=15dB')
