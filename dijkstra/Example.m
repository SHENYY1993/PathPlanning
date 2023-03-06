close all;
hold on;
% example
G = [0 3 9 0 0 0 0;
     0 0 0 7 1 0 0;
     0 2 0 7 0 0 0;
     0 0 0 0 0 2 8;
     0 0 4 5 0 9 0;
     0 0 0 0 0 0 4;
     0 0 0 0 0 0 0;
];
s=[1 1 2 2 3 3 4 4 5 5 5 6];
t=[2 3 4 5 2 4 6 7 3 4 6 7];
w=[3 9 7 1 2 7 2 8 4 5 9 4];
% names={'1' '2' '3' '4' '5' '6' '7'};
G_plot=graph(s,t,w)
myplot = plot(G_plot,'EdgeLabel',G_plot.Edges.Weight)

[e L] = dijkstra(G, 1, 7);
highlight(myplot,L,'EdgeColor','r')
