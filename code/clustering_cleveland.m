%clear all;
close all;

%load_cleveland;
v=3;
[C1,e1]=clevelandPlot(N,I,'normalized',w, v,names,names,'syn_norm');
[CA,e2]=clevelandPlot(N,I,'unnormalizedA',w, v,names,names,'syn_A');
[CB,e3]=clevelandPlot(N,I,'unnormalizedB',w, v,names,names,'syn_B');
[CC,e4]=clevelandPlot(N,I,'unnormalizedC',w, v,names,names,'syn_C');

accuracy = [e1,e2,e3,e4]