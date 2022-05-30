%% �������ӳ������£�
%��������ɱ������
function ret = Mutation(pmutation,lenchrom,chrom,sizepop,pop,bound)
% pcorss      input ���������
% lenchrom    input ��Ⱦɫ�峤��
% chrom       input ��Ⱦɫ��Ⱥ
% sizepop     input ����Ⱥ��ģ
% pop         input ����ǰ��Ⱥ�Ľ������������Ľ���������Ϣ
% ret         output��������Ⱦɫ��
for i = 1:sizepop
    %���ѡ��һ��Ⱦɫ����б���
    pick = rand;
    while pick == 0
        pick = rand;
    end
    index = ceil(pick*sizepop);
    %������ʾ�������ѭ���Ƿ���б���
    pick = rand;
    if pick > pmutation
         continue;
    end
    flag = 0;
    while flag == 0
        %����λ��
        pick = rand;
        while pick == 0
                pick = rand;
        end
        pos = ceil(pick*sum(lenchrom)); 
        %���ѡ����Ⱦɫ������λ�ã���ѡ���˵�pos���������б���
        v = chrom(i,pos);
        v1 = v - bound(pos,1);
        v2 = bound(pos,2) - v;
        pick = rand;  %���쿪ʼ
        if pick > 0.5
            delta = v2*(1-pick^((1-pop(1)/pop(2))^2));
            chrom(i,pos)=v+delta;
        else
            delta = v1*(1-pick^((1-pop(1)/pop(2))^2));
            chrom(i,pos)=v-delta;
        end   %�������
        flag = test(lenchrom,bound,chrom(i,:));  %����Ⱦɫ��Ŀ�����
    end
end
    ret = chrom;    
end

%% %����Ⱦɫ��Ŀ����Գ���
function flag = test(lenchrom,bound,code)
% lenchrom    input ��Ⱦɫ�峤��
% bound       input ��������ȡֵ��Χ
% code        output: Ⱦɫ��ı���ֵ
%��ʼ����
flag = 1;
[n,m] = size(code);
for i=1:n
    if code(i) < bound(i,1)||code(i) > bound(i,2)
        flag = 0;
    end
end
end