%by Abhishek saini
%M.Tech power system svnit
clear all;
clc;
a=input('matrix');
b=input('matrix');
%a=[1 1 1;1 2 2;1 2 3];
%b=[5;6;8];
n=length(b);
l=eye(n,n);
u=a;
for i=2:1:n;
        for j=1:1:i-1;
            l(i,j)=u(i,j)/u(j,j);
            u(i,:)=u(i,:)-((u(i,j)/u(j,j)).*u(j,:));
        end
end
y=zeros(n,1);
b1=[l b];
for i=1:1:n;
    y(i)=(b1(i,n+1)-b1(i,1:i-1)*y(1:i-1))/b1(i,i);
end
x=zeros(n,1);
y2=[u y];
for i=n:-1:1;
    x(i)=(y2(i,n+1)-y2(i,i+1:n)*x(i+1:n,1))/y2(i,i);
end