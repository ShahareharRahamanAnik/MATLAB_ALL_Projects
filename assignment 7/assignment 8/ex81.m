% clear all
% close all
% clc
format compact 
N= input('enter Total number of Nodes :');
N1 = input('enter Positive terminal node :');
N2 = input('enter Negative terminal node :');
Vdc = input('enter DC source:');
Res = zeros(N);
%Resistances
for K = 1:N
    for M = 1:N
        if (K==M)
            continue;
        else
            fprintf('The resistance between node %d and %d',K,M);
            Res(K,M) = input(' is = ');
        end
    end
end
Res
Rp = zeros(N);
for K = 1:N
    if K == N1 || K == N2
        continue;
    end
    for M = 1:N
        if Res(K,M) == 10^7
            continue;
        else     
            if K == M
                for R = 1:N
                    if Res(K,R) == 0 || Res(K,R) == 10^7
                        continue;
                    end
                    Rp(K,M) = Rp(K,M) + 1/Res(K,R);
                end
            else
                Rp(K,M) = Rp(K,M) - 1/Res(K,M);
            end
        end
    end
end
Rp
store = N-2;
Rt = zeros(store);
for K = 1:N-1
    if K == N1 || K == N2
        continue;
    else
        for M = 1:N-1
            if M == N1 || M == N2
                continue;
            else 
                Rt(K-1,M-1) = Rp(K,M);
            end
        end
    end
end
Rt          %Resistance Matrix
I = zeros(store,1);
for K = 1:N
    if K == N1
        I(K,1) = Vdc/Res(K+1,K);
    else
        continue;
    end
end
I           %Current Matrix
D = [Rt I];
N = size(D,1);
for K = 1:N
    D(K,:) = D(K,:)/D(K,K);
    if D(K,:) == 0
        temp = D(K+1,:);
        D(K,:) = temp;
    end
    for M = 1:N
        if M == K
            continue;
        else
            D(M,:) = D(M,:)-D(M,K)*D(K,:);
        end
        D;
    end
end
clear all
close all
clc
format compact
N= input('enter Total number of Nodes :');
N1 = input('enter Positive terminal node :');
N2 = input('enter Negative terminal node :');
Vdc = input('enter DC source:');
Res = zeros(N);
%Resistances
for K = 1:N
    for M = 1:N
        if (K==M)
            continue;
        else
            fprintf('The resistance between node %d and %d',K,M);
            Res(K,M) = input(' is = ');
        end
    end
end
Res
Rp = zeros(N);
for K = 1:N
    if K == N1 || K == N2
        continue;
    end
    for M = 1:N
        if Res(K,M) == 10^7
            continue;
        else     
            if K == M
                for R = 1:N
                    if Res(K,R) == 0 || Res(K,R) == 10^7
                        continue;
                    end
                    Rp(K,M) = Rp(K,M) + 1/Res(K,R);
                end
            else
                Rp(K,M) = Rp(K,M) - 1/Res(K,M);
            end
        end
    end
end
Rp
store = N-2;
Rt = zeros(store);
for K = 1:N-1
    if K == N1 || K == N2
        continue;
    else
        for M = 1:N-1
            if M == N1 || M == N2
                continue;
            else 
                Rt(K-1,M-1) = Rp(K,M);
            end
        end
    end
end
Rt          %Resistance Matrix
I = zeros(store,1);
for K = 1:N
    if K == N1
        I(K,1) = Vdc/Res(K+1,K);
    else
        continue;
    end
end
I           %Current Matrix
D = [Rt I];
N = size(D,1);
for K = 1:N
    D(K,:) = D(K,:)/D(K,K);
    if D(K,:) == 0
        temp = D(K+1,:);
        D(K,:) = temp;
    end
    for M = 1:N
        if M == K
            continue;
        else
            D(M,:) = D(M,:)-D(M,K)*D(K,:);
        end
        D;
    end
end
V=zeros(N,1);
V(:,1)=D(:,N+1);
V