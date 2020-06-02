data = readtable("weather_female.xlsx");
[r,p]=corr(data.DailyAverageDryBulbTemperature,data.female./sum(data.female))

temp = ~isnan(data.male);
[r,p]=corr(data.DailyAverageDryBulbTemperature,data.male./sum(data.male))

% figure
% hold on
% plot(data.DailyAverageDryBulbTemperature,data.female./sum(data.female),'.')
% plot(data.DailyAverageDryBulbTemperature,data.male./sum(data.male),'.')
% hold off

figure
%plot(data.DailyAverageDryBulbTemperature,data.female./(data.female+data.male),'.')

plot(data.DailySnowfall,data.female./(data.female+data.male),'.')

% [r,p]=corrcoef(data.DailyAverageDryBulbTemperature,data.female./(data.female+data.male),'rows','pairwise')
% 
% [r,p]=corrcoef(data.DailyAverageWindSpeed,data.female./(data.female+data.male),'rows','pairwise')
% 
% [r,p]=corrcoef(data.DailyPrecipitation,data.female./(data.female+data.male),'rows','pairwise')
% 
% [r,p]=corrcoef(data.DailySnowfall,data.female./(data.female+data.male),'rows','pairwise')

temp_corr = zeros(7,1);
wind_corr= zeros(7,1);
rain_corr = zeros(7,1);
snow_corr = zeros(7,1);
%%
for i = 2013:2019
    [r,p]=corrcoef(data.DailyAverageDryBulbTemperature(data.year == i),data.female(data.year == i)./(data.female(data.year == i)+data.male(data.year == i)),'rows','pairwise');
    temp_corr(i-2012) = r(1,2);
    
    [r,p]=corrcoef(data.DailyAverageWindSpeed(data.year == i),data.female(data.year == i)./(data.female(data.year == i)+data.male(data.year == i)),'rows','pairwise');
    wind_corr(i-2012) = r(1,2);
    
    [r,p]=corrcoef(data.DailyPrecipitation(data.year == i),data.female(data.year == i)./(data.female(data.year == i)+data.male(data.year == i)),'rows','pairwise');
    rain_corr(i-2012) = r(1,2);
    
    [r,p]=corrcoef(data.DailySnowfall(data.year == i),data.female(data.year == i)./(data.female(data.year == i)+data.male(data.year == i)),'rows','pairwise');
    snow_corr(i-2012) = r(1,2);
    legend('Temperature','WindSpeed','Precipitation','DailySnowfall');
    title('The influence of weather on the gender disparity');
    %set('gca','fontsize',18);
end
%%
figure
hold on
plot(temp_corr);
plot(wind_corr);
plot(rain_corr);
plot(snow_corr);

title('The influence of weather on the gender disparity');
legend('Temperature','WindSpeed','Precipitation','DailySnowfall');
hold off