clear all
close all
clc
format compact
%Start
N= input('Total number of Nodes :');
N1 = input('Positive terminal node :');
N2 = input('Negative terminal node :');
Vdc = input('DC source:');
Res = zeros(N);
%Resistances
for K = 1:N
    for M = 1:N
        if (K==M)
            continue;
        else
            fprintf('The resistance between node %d and %d',K,M);
            Res(K,M) = input(' is = ');
            %if there is no resistance between any two nodes, then input
            %10^5 in the place of the resistance
        end
    end
end
Res
Rn = zeros(N);
for K = 1:N
    if K == N1 || K == N2
        continue;
    end
    for M = 1:N
        if Res(K,M) == 10^7
            continue;
        else     
            if K == M
                for T = 1:N
                    if Res(K,T) == 0 || Res(K,T) == 10^7
                        continue;
                    end
                    Rn(K,M) = Rn(K,M) + 1/Res(K,T);
                end
            else
                Rn(K,M) = Rn(K,M) - 1/Res(K,M);
            end
        end
    end
end
Rn
store = N-2;
Rr = zeros(store);
for K = 1:N-1
    if K == N1 || K == N2
        continue;
    else
        for M = 1:N-1
            if M == N1 || M == N2
                continue;
            else 
                Rr(K-1,M-1) = Rn(K,M);
            end
        end
    end
end
Rr          %Resistance Matrix
I = zeros(store,1);
for K = 1:N
    if K == N1
        I(K,1) = Vdc/Res(K+1,K);
    else
        continue;
    end
end
I           %Current Matrix
AB = [Rr I];
x = size(AB);
N1= x(1);
N2 = x(2);
AB_corr = AB;
Voltages = zeros(1,N1);
var_old = zeros(1,N1);
err = zeros(1,N1);
max_err = 100;
for K = 1:N1
    max_val = max(abs(Rr(K,:)));
    for M = 1:N1
        if Rr(K,M) == max_val
            AB_corr(M,:) = AB(K,:);
        end
    end
end
while(max_err > 0.001)
    for K = 1:N1
        var_old(K) = Voltages(K);
        store = 0;
        for M= 1:N1
            if(M~=K)
                store = store + AB_corr(K,M)*Voltages(M);
            else
                store=store;
            end
            Voltages(K) = (AB_corr(K,N2)-store)/AB_corr(K,K);
        end
        err(K) = abs((Voltages(K))-var_old(K));
    end
    max_err = max(err);
end
Voltages