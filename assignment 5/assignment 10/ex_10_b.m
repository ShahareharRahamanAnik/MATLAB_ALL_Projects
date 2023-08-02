close all
clear all
clc
format compact

x = 2:7;
y = [6.886*(10^4) 1.1815*(10^10) 7.6930*(10^15) 8.1911*(10^21) 9.5082*(10^27) 9.8618*(10^33)];

p = input('Enter order of Equ.:');

A = zeros(p+1,p+1);
B = zeros(p+1,1);

for k = 1:p+1
    for j = 1:p+1
        A(k,j) = sum((log(x)).^(k+j-2));
    end
    B(k) = sum((log(x).^(k-1)).*(log(y)-(4*log(x))));
end
A;
B;
AB = [A B]

a = size(AB);
n1= a(1);
n2 = a(2);
AB_corr = AB;

var = zeros(1,n1);
var_old = zeros(1,n1);
err = zeros(1,n1);
max_err = 100;

for i = 1:n1
    max_val = max(abs(A(i,:)));
    for j = 1:n1
        if A(i,j) == max_val
            AB_corr(j,:) = AB(i,:);
        end
    end
end

while(max_err > 0.001)
    for i = 1:n1
        var_old(i) = var(i);
        s = 0;
        for j= 1:n1
            if(j~=i)
                s = s + AB_corr(i,j)*var(j);
            else
                s=s;
            end
            var(i) = (AB_corr(i,n2)-s)/AB_corr(i,i);
        end
        err(i) = abs((var(i))-var_old(i));
    end
    max_err = max(err);
end

var

s = 0;

a0 = exp(var(1,1))
a1 = var(1,4)
a2 = var(1,3)
a3 = var(1,2)/5

f =@(x) a0*(x^(4+(5*a3)))*exp((a1*(log(x)^3))+(a2*(log(x)^2)));
fx = [];
for i = 2:7
    Y = f(i);
    fx = [fx Y];
end
fx

plot(log(x),log(fx),'--');
hold on
plot(log(x),log(y),'o');
grid on
xlabel('log(x)');
ylabel('log(y)');