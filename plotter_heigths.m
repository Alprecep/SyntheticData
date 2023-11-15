function  plotter_heigths(ytest5,YPredicted_test,portion)

startColor1 = [0.01 0.5 0.5];
startColor2 = [0.5 0.01 0.5];

%
% 'Color', startColor + (ii-1) / 40)
figure(1)

xlabel("1 Week")
ylabel("wind speed [m/s]")

figure(2)
xlabel("1 Week")
ylabel("wind speed [m/s]")

figure(3)
ylabel("wind speed [m/s]")
xlabel("1 Week")


for pp = 1:5
    figure(1)
    coloring1 = startColor1+1.2*[(pp-1)/10, (pp-1)/10, (pp-1)/10];
    plot(ytest5(portion,pp), 'Color', coloring1)
    hold on
xlabel("1 Week")
ylabel("wind speed [m/s]")
    coloring2 = startColor2+ 1.1*[(pp-1)/10, (pp-1)/10, (pp-1)/10];
    plot(YPredicted_test(pp,portion)', 'Color',coloring2)

grid on

    figure(2)
    coloring1 = startColor1+1.2*[(pp-1)/10, (pp-1)/10, (pp-1)/10];
    plot(ytest5(portion,pp), 'Color', coloring1)
    hold on
    xlabel("1 Week")
ylabel("wind speed [m/s]")
grid on

    figure(3)
    coloring2 = startColor2+ 1.2*[(pp-1)/10, (pp-1)/10, (pp-1)/10];
    plot(YPredicted_test(pp,portion)', 'Color',coloring2)
    hold on
    xlabel("1 Week")
ylabel("wind speed [m/s]")
grid on

end
%legend(["R200" "R150" "R100" "R50" "R20"...
%        "S200" "S150" "S100" "S50" "S20"])
    figure(1)

legend(["R200" "S200" ...
        "R140" "S140" ...
        "R80"  "S80" ...
        "R40"  "S50"   ...
        "R20"  "S20"])

grid on
figure(2)
legend(["R200" ...
        "R140" ...
        "R80"  ...
        "R40"  ...
        "R20"  ])

figure(3)
legend(["S200" ...
        "S140" ...
        "S80"  ...
        "S40"  ...
        "S20"  ])


end

