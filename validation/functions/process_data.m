%%% process the data and plot graphs
%%%

%% find how many files
clear all
close all
% resultsdir='../testvalues/postProcessing/linesample/'
%resultsdir='../testvalues/postProcessing/linesample/'
resultsdir='../postProcessing/linesample/'
AA=dir([resultsdir '*'])

timevalues=[];
pvalues=[];
Tvalues=[];
UXvalues=[];
UYvalues=[];
UZvalues=[];
NS=[];
for hj=1:length(AA)

hj
    name_dir=AA(hj).name;
if (~isnan(str2double(AA(hj).name)))
    timevalues=[timevalues ; str2num(AA(hj).name)];
NS=[NS; hj];

end
end

[tsort,N]=sort(timevalues);
for qwe=1:length(NS)

hj=NS(N(qwe));

 AB=dlmread([resultsdir AA(hj).name '/s1_T_p_U.xy']);
 Xpos=AB(:,1);
T=AB(:,4);
p=AB(:,5);
UX=AB(:,6);
UY=AB(:,7);
UZ=AB(:,8);
pvalues=[pvalues p];
Tvalues=[Tvalues T];
UXvalues=[UXvalues UX];
UYvalues=[UYvalues UY];
UZvalues=[UZvalues UZ];




end

[XPOS,TPOS]=meshgrid(Xpos,tsort);
figure(1)
[c,h]=contourf(TPOS',XPOS',Tvalues,100);
set(h,'Linestyle','None');
hold on;  colorbar
grid on
ylabel('$T$','Interpreter','latex')


figure(2)
[c,h]=contourf(TPOS',XPOS',pvalues-1E5,100);
hold on;  colorbar
set(h,'Linestyle','None');
ylabel('$p$','Interpreter','latex')

figure(3)

[c,h]=contourf(TPOS',XPOS',UXvalues,100);
hold on;  colorbar
set(h,'Linestyle','None');
ylabel('$U_x$','Interpreter','latex')

figure(4)
NJ=size(pvalues,2);
for hj=1:(NJ-5)
p1=pvalues(:,hj);
II=find(p1>1.11e5);

loglog(timevalues(hj),Xpos(max(II)),'k+'); hold on
end
grid on
xlim([1E-6 1E-1])
ylim([0.1 10])
xx=linspace(1E-6,1,1000); plot(xx,0.1*(xx/1E-6).^(2/5),'r-');


figure(8)
for hj=1:(NJ-5)
p1=pvalues(:,hj);
II=find(p1>1.11e5);
plot(Xpos(max(II)),max(p1)/1e5,'k+'); hold on
end

figure(9)
for hj=1:(NJ-5)
p1=pvalues(:,hj);
II=find(p1>1.11e5);
plot(timevalues(hj),max(p1)/1e5,'k+'); hold on
end

figure(5)
for hj=400:10:NJ
p1=pvalues(:,hj);
II=min(find(p1==max(p1)));
plot(Xpos/Xpos(II(1)),p1/max(p1),'k-'); hold on
end
xlim([0 1.5])

figure(6)
for hj=400:1:NJ

T1=Tvalues(:,hj);
II=find(T1>305);
plot(Xpos/Xpos(max(II)),T1,'k-'); hold on
end
 xlim([0 1.5])



figure(7)
for hj=400:10:2500
UX1=UXvalues(:,hj);
II=find(UX1>1);
plot(Xpos/Xpos(max(II)),UX1,'k-'); hold on
end
 xlim([0 1.5])

 


