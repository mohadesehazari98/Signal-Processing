function pairs = peak_to_pair(peaks)

    deltaT = 20; % Time interval after the peak. (in pixels)
    deltaF = 10; % Distance from the frequency of the peak. (in pixels)
    plotLines = true;
    timeLowerBound = 0;
    fanout = 3;
    timeUpperBound = timeLowerBound + deltaT;

    [f, t] = find(peaks);
    numOfPeaks = length(f);

    outputTuple = [];

    wb = waitbar(0,'1','Name','Number of Peaks');
    for p = 1 : numOfPeaks
        waitbar(p/numOfPeaks,wb,sprintf('%d : %d',p, numOfPeaks))
        currentPeakF = f(p);
        currentPeakT = t(p);
        peakPairPosition = (t ~= t(p)) & ...
                           (f > currentPeakF - deltaF) & ...
                           (f < currentPeakF + deltaF) & ...
                           (t > currentPeakT + timeLowerBound) & ...
                           (t < currentPeakT + timeUpperBound);
        peakPairPosition = find(peakPairPosition, fanout);
        tuple = cat(2, repmat(t(p), size(peakPairPosition)), t(peakPairPosition), ...
                       repmat(f(p), size(peakPairPosition)), f(peakPairPosition));
        outputTuple = cat(1, outputTuple, tuple);
    end
    close(wb);
    pairs = outputTuple;

    if plotLines
        figure
        imagesc(peaks)
        colormap(1 - gray)
        hold on
        for i = 1 : size(pairs, 1)
            line(pairs(i, 1:2), pairs(i, 3:4))
        end
        figure(1)
        title('Spectrogram local peaks and peak pairs')
        xlabel('Time')
        ylabel('Frequency')
    end
end
