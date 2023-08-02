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
G=[A B];
 S=size(A);
 n=S(1);
disp(G)

 t=zeros(1,n+1);
 for i=1:n 
     if G(i,i)==0
         t=G(i+1,:);
         G(i+1,:)=G(i,:);
         G(i,:)=t;
     end
 end

 for i=1:n
     
     G(i,:)=G(i,:)/G(i,i);
     for j=1:n 
         if j~=i
             G(j,:)=G(j,:)-(G(j,i)*G(i,:))
         end
     end
 end
G(:,n+1)


s = 0;

a0 = exp(-G(1,n+1))
a1 = G(4,n+1)
a2 = G(3,n+1)
a3 = var(2,n+1)/5

f =@(x) a0*(x^(4+(5*a3)))*exp((a1*(log(x)^3))+(a2*(log(x)^2)));
fx = [];
for i = 2:7
    Y = f(i);
    fx = [fx Y];
end
fx

plot(log(x),log(fx),'--');
hold on
plot(log(x),log(y),'r');
grid on
xlabel('log(x)');
ylabel('log(y)');