function [FeatMat, Labels, Dates] = convert2LastFiredFeatMat(ss, as, timeStepSize)

senseList = ss.getIDs;
numSense = length(senseList);

% minActCount = 5;
% idx = find(histc(as.id,as.getIDs)>=minActCount);
% tempActList = as.getIDs;
% idx2 = find(ismember(as.id,tempActList(idx)));
% as = as(idx2);

actList = as.getIDs;

if (ss(1).start < as(1).start)
    startTimestamp = ss(1).startsecs;
else
    startTimestamp = as(1).startsecs;
end

if (ss(ss.len).end > as(as.len).end)
    endTimestamp = ss(ss.len).endsecs;
else
	endTimestamp = as(as.len).endsecs;
end

numTimesteps = ceil((endTimestamp - startTimestamp)/timeStepSize)+1;

FeatMat = zeros(numSense, numTimesteps);
Labels = zeros(1, numTimesteps);
Dates = (startTimestamp + (0:(numTimesteps-1))*timeStepSize)/86400;

for i=1:ss.len,
    % Determine position in feature vector
    [dummy,idxS] = intersect(senseList,ss(i).id);
    
    % Determine time steps
    startSenseFire = floor((ss(i).startsecs - startTimestamp)/timeStepSize)+1;
    endSenseFire = ceil((ss(i).endsecs - startTimestamp)/timeStepSize)+1;
    
    % In case sensor fired before first activity
    if (startSenseFire < 1)
        startSenseFire = 1;
    end        
    
    % Set value to 1 for sensor at time
    FeatMat(idxS, startSenseFire) = 1;
    FeatMat(idxS, endSenseFire) = 1;
end
[idxRow, idxCol] = find(FeatMat(:,1:end)==1);
for i=1:length(idxCol)-1,
    FeatMat(idxRow(i), idxCol(i):idxCol(i+1))=1;
end

for i=1:as.len,
    % Determine position in feature vector
     [dummy,idxA] = intersect(actList,as(i).id);
    
    % Determine time steps
    startAct = floor((as(i).startsecs - startTimestamp)/timeStepSize)+1;
    endAct = ceil((as(i).endsecs - startTimestamp)/timeStepSize)+1;

    % Set value to 1 for sensor at time
    Labels(1, startAct:endAct) = idxA;
end