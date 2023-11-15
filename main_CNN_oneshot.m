clc;

dinputs = [1:365,1:365,1:365,1:365,1:365];
Ndays = 365;
ux_test_o = ux(year2,1:end-1);
uy_test_o = uy(year2,1:end-1);
temp3 = [];temp4 = [];

for i = 1:5
    temp3 = [temp3 ; reshape(ux_test_o(:,i), 144, [])];
    temp4 = [temp4 ; reshape(uy_test_o(:,i), 144, [])];
end

ux_test_o  = temp3;
uy_test_o  = temp4;

test_set_out_cnn = [ux_test_o; uy_test_o]';

test_set_in_cnn = [];
for i = 1:365
    for h = 1:5
        test_set_in_cnn(:,:,1,i+(h-1)*365) = [...
            ux_test_i(:,i) , ...
            uy_test_i(:,i), ...
            yest_PSD(:,i).*sin(angles2(:,i)), ...
            yest_PSD(:,i).*cos(angles2(:,i))
            ];
    end
end

Noise_data = [dinputs; noisegen(ndim,Ndays)];

dsX1Test = arrayDatastore(test_set_in_cnn,IterationDimension=4);
dsX2Test = arrayDatastore(Noise_data,IterationDimension =2 );
dsT1Test = arrayDatastore(test_set_out_cnn,IterationDimension =1);
dsTest = combine(dsX1Test,dsX2Test,dsT1Test);

dum = predict(net_cnn_os, dsTest);
    %
tempx = [];
tempy = [];

for i=1:365

    tempx = [tempx ; reshape(dum(i,1:720),  [144] , [])];
    tempy = [tempy ; reshape(dum(i,721:end),[144], [])];

end
uxypred_oneshot_cnn = [tempx, tempy];

pred_cnn_x_oneshot = uxypred_oneshot_cnn(:,1:5);
pred_cnn_y_oneshot = uxypred_oneshot_cnn(:,6:end);

pred_cnn_u_oneshot = (pred_cnn_x_oneshot.*pred_cnn_x_oneshot + pred_cnn_y_oneshot.*pred_cnn_y_oneshot).^0.5;
pred_cnn_oneshot = [pred_cnn_x_oneshot, pred_cnn_y_oneshot];
ytest10 = [ux(year2,1),ux(year2,2), ux(year2,3),ux(year2,4),ux(year2,5),...
    uy(year2,1),...
    uy(year2,2),...
    uy(year2,3),...
    uy(year2,4),...
    uy(year2,5)];

names = ["Condition Heigth CNN"];
portion = 1:144*7 + 144*2;
plotter_heigths(ytest5,pred_cnn_u_oneshot',portion)

save("synthetic.mat","pred_cnn_oneshot" )

