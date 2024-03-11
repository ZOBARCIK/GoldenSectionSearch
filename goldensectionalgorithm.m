clc;
clear;
clear all;

format long
%Ahmet Arda Zobar
%Golden Section Search
%-------------STEP 1---------------------
vaziyet=input('Choose one of the start and end of the interval; 1) x_low=0 x_up=2, 2) x_low=2 x_up=3 \n');

switch vaziyet;
    case 1
        a=0; %x_low
        b=2; %x_up
    case 2
        a=2;
        b=3;
end

dxfinal=10^-10;   %minimum accuracy value
eps=dxfinal/(b-a);   %tolerance
N=-2.078*log(eps); %max iteration number
k=1; %iteration index
r=0.38197; %golden coefficient?(actually around 0.618)  

%----------------STEP 2-------------------------

x1= (1-r)*a+r*b;
f1=f(x1);
x2= r*a + (1-r)*b;
f2=f(x2);

%---------------STEP 3---------------------------

while k<N
    if f2<f1
        a=x1;
        x1=x2;
        f1=f2;
       x2=r*a + (1-r)*b;
       f2= f(x2);
       k=k+1;
       
       xdump(k+1) = x2;
       ydump(k+1) = f2;
       
    elseif f2>f1
        b=x2;
        x2=x1;
        f2=f1;
        x1= (1-r)*a+r*b;
        f2=f(x1);
        k=k+1;
        
        xdump(k+1) = x1;
        ydump(k+1) = f1;
    end
end


if(f(x1)>f(x2))
    
    disp('xmin')
    disp(x1)
    
    disp('f(xmin)')
    disp(f(x1))
   
    
else
      disp('xmin')
    disp(x2)
    
    disp('f(xmin)')
    disp(f(x2))
   
 
end

%-------------PLOT----------

    figure(1)
            
    xx=-0:0.01:3.5;
    plot(xx,yy(xx))
    grid 
    axis([0,3.5,-2,2])
    hold on
   plot(xx,gg(xx),'--b','linewidth', 2)
   legend('f(x)', '\delta f(x)')
   hold on 
   
if (f(x1)<f(x2))
    plot(x1,f(x1),'r*')  
else    
      plot(x2,f(x2),'r*')
end

figure(2)
subplot(2,1,1)
plot(1:length(xdump),xdump,'linewidth',2)
axis([1 k min(xdump)-0.1, max(xdump)+0.1])
legend('x[k]')

subplot(2,1,2)

plot(1:length(ydump),ydump,'linewidth',2)
axis([1 k min(ydump)-0.1, max(ydump)+0.1])
legend('f(x[k])')


disp('number of iterations has been done:')
disp(k)
%----------Derivative of the function---------
syms x
p=(x-1)*(x-1)*(x-2)*(x-3); %couldn't use the main function at the end of the script
Derivative_of_the_function= diff(p)



%-----------------------FUNCTIONS-----------------------

function y=f(x) 
%asıl fonksiyon
y=(x-1)*(x-1)*(x-2)*(x-3);

end

function y=yy(xx)
y= (xx-1).*(xx-1).*(xx-2).*(xx-3);
end

function g=gg(xx)  %derivative of the function
g= (xx - 1).^2.*(xx - 2) + (xx - 1).^2.*(xx - 3) + (2.*xx - 2).*(xx - 2).*(xx - 3);
end


