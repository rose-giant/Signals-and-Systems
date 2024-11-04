function [findR,correlationValuesVector]=p3_3(recievedSignal)
    ts=1e-9;
    T=1e-5;
    tau=1e-6;
    t=0:ts:T;
    c=3e8;

    requiredTimeSteps=round(tau/ts);
    
    correlationValuesVector=zeros(size(t));
    % the length of the time vector
    totalSteps=round(T/ts);
    
    for i=1:totalSteps-requiredTimeSteps
        tempPuls=zeros(size(t));
        tempPuls(i:i+requiredTimeSteps-1)=1;
        %performing dot product
        correlationValuesVector(i)=tempPuls*(recievedSignal');
    end

    [~,findMaxIndex]=max(correlationValuesVector);
    findTd=t(findMaxIndex);
    findR=findTd*c/2;
end