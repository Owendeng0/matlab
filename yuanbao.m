%% ����GUI����
plotbutton=uicontrol('style','pushbutton','string','����','fontsize',12,'position',[150,400,50,20],'callback','run=1;');
erasebutton=uicontrol('style','pushbutton','string','ֹͣ','fontsize',12,'position',[250,400,50,20],'callback','freeze=1;');
quitbutton=uicontrol('style','pushbutton','string','�˳�','fontsize',12,'position',[350,400,50,20],'callback','stop=1;close;');
number = uicontrol('style','text','string','1','fontsize',12,'position',[20,400,50,20]);
%% Ԫ���Զ�������
n=200;
%��ʼ��״̬
z = zeros(n,n);
sum = z;
cells = (rand(n,n))<.6;
%����ͼ����
imh = image(cat(3,cells,z,z));
set(imh,'erasemode','none')
%Ԫ�����µ�����������
x = 2:n-1;
y = 2:n-1;
% ���¼�ѭ��
stop = 0; run = 0; freeze = 0;
while stop == 0
    if run ==1
        %�����ھӴ������
        sum(x,y) = cells(x,y-1) + cells(x,y+1) + cells(x-1,y) + cells(x+1,y)...
            + cells(x-1,y-1) + cells(x-1,y+1) + cells(x+1,y-1) + cells(x+1,y+1);
        %���չ������
        cells = (sum==3) | (sum==2 & cells);
        set(imh, 'cdata', cat(3,cells,z,z))
        stepnumber = 1 + str2double(get(number,'string'));
        set(number,'string',num2str(stepnumber))
    end
    if freeze==1
        run = 0;
        freeze = 0;
    end
    drawnow
end