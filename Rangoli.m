%=======================RANGOLI============================%
clear all; clf
scatter(0,0,70,50,'c*','LineWidth',4) %centre blue star
hold on

%the centre pink color gradient circles
for sz=50:100:750
    alpha1=(750-sz)/700;% ratio used to scale colour
    colour=[1,0,1]+alpha1*[0,1,0];%adding two colours with some ratio
    scatter(0,0,sz,colour)%circle centre
end


%gets the semi circle points
x1=-1.5:0.05:1.5
y1=sqrt(1.5^2-x1.^2)

%repeatedly plots the transformed points of yellow pattern
for theta=0:pi/6:2*pi
points=move(theta,[x1;y1],1.5)%move-refer function below
plot(points(1,:),points(2,:),'y')
end

%gets the semi circle points
x1=-2:0.05:2
y1=sqrt(2^2-x1.^2)

%repeatedly plots the transformed points of green patterns
for theta=0:pi/6:2*pi
points=move(theta,[x1;y1],2)
plot(points(1,:),points(2,:),'g')
end

points=get_petal(4,3,7)%get_petal-refer function below
points_of_flower=[]%to get all petals combined as a flower
for theta=0:pi/3:2*pi
points_petal=move(theta,points,2)
plot(points_petal(1,:),points_petal(2,:),'b')
points_of_flower=[points_of_flower,points_petal];
end

points_of_flower=points_of_flower*1.2;%re-ploting the flower bigger
plot(points_of_flower(1,:),points_of_flower(2,:),'r','LineWidth',2)

points_of_flower=points_of_flower*1.1;%re-ploting the flower bigger
plot(points_of_flower(1,:),points_of_flower(2,:),'b','LineWidth',2)

%loops through to change colour and size for each flower
for i=1:30
    alpha1=(30-i)/30;
    colour=[1,0,0]+alpha1*[0,1,1];
    points=get_petal(4,3,7)%gets petal
    
    %plots the flower
    for theta=0:pi/3:2*pi
          points_petal=move(theta,points,0)*(1+alpha1/2)
          plot(points_petal(1,:),points_petal(2,:),'color',colour)
     end
end

%lamp
r=1
x1=-r:0.01:r; y1=-sqrt(r^2-x1.^2); %bigger semi-circle

%two small upper semi-circles
x2=r:-0.01:0;y2=-0.4*sqrt(r/2^2-(x2-r/2).^2);%0.4 scales down y axis 
x3=0:-0.01:-r;y3=-0.4*sqrt(r/2^2-(x3+r/2).^2);%0.4 scales down y axis

x=[x1,x2,x3];y=[y1,y2,y3];%combine

%transform and plot all lamps
for theta=pi/6:pi/3:2*pi+pi/6
points=move(theta,[x;y],10);
plot(points(1,:),points(2,:),'LineWidth',2,'color',[0.8500, 0.3250, 0.0980])
end

%plots the yellow light of lamp and cyan stars in rangoli
for theta=pi/6:pi/3:2*pi+pi/6
%yellow light    
x1=10.2*cos(theta-pi/6);y1=10.2*sin(theta-pi/6);
scatter(x1,y1,50,'y','filled')
scatter(x1,y1,150,'y*')

%cyan points
x1=7.9*cos(theta-pi/6);y1=7.9*sin(theta-pi/6);
scatter(x1,y1,50,'c','filled')
scatter(x1,y1,150,'c*','LineWidth',1.5)
end

%final outer circle
theta=0:0.01:2*pi
x=12*cos(theta);y=12*sin(theta) % polar co-ordinate to cartesian co-ordinate
scatter(x,y,60,[0.4940 0.1840 0.5560]) %purple-[0.4940 0.1840 0.5560]

%set figure window 
axis equal
xlim([-15,15])
ylim([-15,15])
h1=figure(1);
set(h1,'Position',[200 100 600 500])
title('Rajayogeshwar G')
xlabel('Festival of Lights')
ylabel('Happiness')


%Given petal specifications returns petal points
function points=get_petal(l,dx,r)
%left half petal
x=-l:0.1:0
y=sqrt(r^2-(x-dx).^2 );

%invert and get full petal
x=[x,flip(-x)]; y=[y,flip(y)];
points=[x;y];
end

%Given the points of shape it rotates,translates am=nd returns the points
function points=move(theta,points1,rad) 
x1=points1(1,:);y1=points1(2,:);

%get x,y from R(distance from origin)
translate2=rad*[sin(theta);cos(theta)]

%transformation matrix
R=[cos(theta) sin(theta);
    -sin(theta) cos(theta)];

 points=translate2+R*[x1;y1]%rotate and translate the points
end
