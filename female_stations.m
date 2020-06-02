stations = readtable("nyc_bikeshare_key (1).csv");
females = readtable("stationcountfemale.csv");
males = readtable("stationcountmale.csv");
%%
for i = 1:length(females.Var1)
    temp = find(stations.station_id == females.Var1(i));
    stations.female(i) = females.Var2(i);
end
%%
for i = 1:length(males.Var1)
    temp = find(stations.station_id == males.Var1(i));
    stations.male(i) = males.Var2(i);
end
stations(:,'station_name') = [];
%%
mytable = table2array(stations);
%%

%stations.ratio=stations.female./(stations.female+stations.male);

figure
hold on
sortrows(mytable,4);
%scatter(mytable(1:100,2),mytable(1:100,3),9,mytable(1:100,4),'filled');
sortrows(mytable,5);
%scatter(mytable(1:100,2),mytable(1:100,3),9,mytable(1:100,5),'filled');
scatter(mytable(:,2),mytable(:,3),9,mytable(:,4)./mytable(:,5),'filled');
xlim([40.6,41])
ylim([-74.1,-73.85])
colormap(jet)
colorbar
hold off