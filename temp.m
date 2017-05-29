    plotdays = linspace(trainDays, numdays, numdays-trainDays); % the dates to predict    for i = 1:length(plotdays)        xtest = x(sum(numRec(1:plotdays(i)-1,:)(:))+1:sum(numRec(1:plotdays(i),:)(:)), :);        ytest = y(sum(numRec(1:plotdays(i)-1,:)(:))+1:sum(numRec(1:plotdays(i),:)(:)));                [mu, s2] = gp(hyp2, @infExact, meanfunc, covfunc, likfunc, xtrain, ytrain, xtest);                numPoints = numRec(plotdays(i),1);        fig = figure;        plot(ytest(1:numPoints),'b', 'LineWidth',2);        hold on;        plot(mu(1:numPoints),'r');        legend('Actual Flow', 'Prediction');        hold off;        saveas(fig, strcat('03-',num2str(plotdays(i)),'-',num2str(cell_id),'-normalized.png'));    end