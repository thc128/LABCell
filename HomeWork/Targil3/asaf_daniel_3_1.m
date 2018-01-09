function [BS,mobile_cells] = asaf_daniel_3_1()
N=7600;
RADIUS=1000;
[BS.x,BS.y]=getCellsCoordinates(RADIUS);
BS.gain(1:19)=6;
BS.rate(1:19)=randi([1,500],1,19);
for i=1:19
    [mobile_cells(i).x,mobile_cells(i).y]=getSSPositions(N/19,RADIUS);
    mobile_cells(i).x=mobile_cells(i).x';
    mobile_cells(i).y=mobile_cells(i).y';
    mobile_cells(i).power(1:N/19)=-125;
    mobile_cells(i).gain(1:N/19)=3;
    mobile_cells(i).index(1:N/19)=i;
    for j = 1:N/19
        d(j)=sqrt((mobile_cells(i).x(j)).^2+(mobile_cells(i).y(j))^2);
    end
    mobile_cells(i).x=(mobile_cells(i).x)+BS.x(i);
    mobile_cells(i).y=(mobile_cells(i).y)+BS.y(i);
    mobile_cells(i).pathloss(1:N/19)=0;
    mobile_cells(i).SINR(1:N/19)=0;
    mobile_cells(i).rate(1:N/19)=0;
end
