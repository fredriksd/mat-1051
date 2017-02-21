figure(1)
yyaxis left
plot(Time,smooth(Wind),'blue'), grid on
title('Wind speed and sun radiation, 5.June 2011')
xlabel('Time, HHmmss')
ylabel('Wind speed, m/s')
ylim([0,12])

yyaxis right
plot(Time,smooth(Sun))
ylabel('Sun radiation, W/m^2')
ylim([0,760])
