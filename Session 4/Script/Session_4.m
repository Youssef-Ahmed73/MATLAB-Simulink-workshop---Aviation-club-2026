%% Session 4 Data Visaulization
% Before we start any script
clc
clear
close all % We will know in today's session

%-------------------------------------------------------------------------%
%----------------------------Part 1: Tips & Tricks------------------------%
% Useful built-in functions
%% linspace()
x=1:1.5:9;
y=linspace(1,9,10);
%% size() and length()
x=1:1.5:9;
y=linspace(1,9,10);
size(x);
length(x);
%% sum()
y=1:9;
sum(y);
x=[1:3;4:6;7:9];
sum(x);
sum(x,1);
sum(x,2);
sum(x,'all');
%% any() and all()
y=1:9;
x=-5:1:5;
any(x);
all(x);
any(y);
all(y);
%% min() and max
y=1:9;
min(y);
max(y);
%% isscalar()
x=1;
y=1:9;
isscalar(x);
isscalar(y);
%% Mathematical expressions and functions:
% sqrt()
% abs()
% sin() , cos(), tan()
% sind(), cosd(), tand()
% asin(), acos(), atan()
% exp()
% log(), log10()
% pi
% e

pi;
3e5;
sqrt(4);
sqrt([1 4 9]);
abs([1 -1 6]);
sin(pi);
sind(180);
asin(1);
exp(1);
log(exp(5));
%% General ideas
% You can use help with your own functions
help myfun;
%% Let's revise working with scripts and the debugging tool
myfun(5);
%% Part2
%-------------------------------------------------------------------------%
%-----------------------------Part 2: 2D-Plots----------------------------%

% Let's start by plotting a simple line
close all
figure
x=linspace(0,10,10);
y=linspace(0,10,10);
y2=linspace(5,15,10);
plot(x,y)
figure
plot(x,y2)

%% Let's make slightely more advanced plot with 10 points
close all
x=linspace(0,4*pi,10);
y=sin(x);
plot(x,y)
%% Let's try changing the number of points to see what happens
close all
figure
x=linspace(0,4*pi,10);
y=sin(x);
plot(x,y)
figure
x=linspace(0,4*pi,100);
y=sin(x);
plot(x,y)
%% Let's explore the plot command more
help plot;
%% Try plot line/marker options
close all
figure
x=linspace(0,4*pi,100);
y=sin(x);
plot(x,y,'--mo')
%% LineWidth and MarkerSize arguments
close all
figure
x=linspace(0,4*pi,100);
y=sin(x);
plot(x,y,'-or','LineWidth',5)
%% Plot decoration
% axes limits
% axes label
% plot title
% grid
% text

close all
figure
x=linspace(0,4*pi,100);
y=sin(x);
plot(x,y)
xlim([0 4*pi])
ylim([-1.5 1.5])
xlabel('time (seconds)')
ylabel('Amplitude (Cm)')
title('Signal of standing wave')
grid on
%grid off
text(2,-1,'here is the valley of the curve','FontSize',15)
%% Adding multiple plots on the same figure
close all
figure
x=linspace(0,4*pi,100);
y1=sin(x);
y2=cos(x);
plot(x,y1)
%figure
hold on
plot(x,y2)
%% Adding legend to illustrate which signal is which
close all
figure
x=linspace(0,4*pi,100);
y1=sin(x);
y2=cos(x);
plot(x,y1)
hold on
plot(x,y2)
legend('sin x','cos x','Location','bestoutside')
%% Figures and subplots
close all
x=linspace(0,4*pi,100);
y1=sin(x);
y2=cos(x);
figure
% plot(x,y1)
% figure
% plot(x,y2)
subplot(1,2,1)
plot(x,y1)
subplot(1,2,2)
plot(x,y2)
%% Other types of 2D-plots
% histogram
% plotyy
% semilogx
% pie
% scatter
close all
figure
data=rand(1,100);
histogram(data,10)

figure
x=linspace(0,4*pi,100);
y1=sin(x);
y2=5*cos(x);
% plot(x,y1)
% hold on
% plot(x,y2)
% xlim([0 4*pi])
% ylim([-5 5])
plotyy(x,y1,x,y2)

figure
semilogx(x,y1)
grid on

figure 
data=[10 20 30 25 15];
pie(data)

figure 
x=linspace(0,4*pi,100);
y=sin(x);
scatter(x,y)
%% Part3
%-------------------------------------------------------------------------%
%-----------------------------Part 3: 3D-Plots----------------------------%

% Basic plotting
close all
x=linspace(0, 4*pi ,100);
y=sin(x);
z=cos(x);
plot3(x,y,z)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%% Changing the view
close all
x=linspace(0, 4*pi ,100);
y=sin(x);
z=cos(x);
plot3(x,y,z)
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
view([58 25])
%% patch()
close all
figure
x=[1 0 0];
y=[0 1 0];
z=[0 0 1];
patch(x,y,z)
%% Creating surface using meshgrid()
close all
figure
x=linspace(0, 4*pi ,100);
y=linspace(0, 4*pi ,100);
[X,Y]=meshgrid(x,y);
Z=X.* cos(Y);

%mesh
mesh(X,Y,Z)

%surf
figure
surf(X,Y,Z)
shading interp
colorbar
%% Part4
%-------------------------------------------------------------------------%
%----------------------------Part 4: Animation----------------------------%

close all
figure
x=linspace(0, 4*pi ,100);
y=sin(x);
z=cos(x);
for i=1:100
    plot3(x,y,z)
    xlabel('x axis')
    ylabel('y axis')
    zlabel('z axis')
    view([i 25])
    %pause(0.2)
    drawnow
end

%% Another type of animatoin: Drawing the curve

close all
figure
x=linspace(0, 4*pi ,100);
y=sin(x);

for i=1:length(x)
    plot(x(1:i),y(1:i))
    xlim([0 4*pi])
    ylim([-1.5 1.5]) 
    title('sine wave animation')
    xlabel('X axis')
    ylabel('Y axis')
    drawnow
   
end

%% Saving animation as video

close all
figure
x=linspace(0, 4*pi ,100);
y=sin(x);
for i=1:length(x)
    plot(x(1:i),y(1:i))
    xlim([0 4*pi])
    ylim([-1.5 1.5]) 
    title('sine wave animation')
    xlabel('X axis')
    ylabel('Y axis')
    drawnow
    mymovie(i)=getframe;  
end
mywriter=VideoWriter('my sine wave','MPEG-4');

open(mywriter)
writeVideo(mywriter, mymovie)
close(mywriter)