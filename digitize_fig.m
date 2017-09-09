%digitizes the plots for the figure (only line-plots)
clear all;
clc;

%opens the figure with the following name
%comment out to use the figure that is currently open in Matlab
%it is safer to have only one figure open at the moment
open('mytestfigure_differentNum.fig');
%open('mytestfigure_sameNum.fig');

%select storage type/types
ArrayStorage=true; %works only if all line plots in the figure have the same number of points.
CollectionStorage=true; %works for arbitrary ones


f=gcf; %current figure handle
h=findobj(f,'type','line'); %get all the lines

numLines=size(h,1); %determine number of lines in the plot

if (ArrayStorage)
    doArray=true;
    lengthArray=size(h(numLines).XData,2);
    for i=numLines-1:-1:1
        newLengthArray=size(h(i).XData,2);
        if (newLengthArray~=lengthArray)
            clear lengthArray;
            fprintf('Lines in the figure have different length. Cannot do ArrayStorage.\n');
            doArray=false;
            break;
        end
    end
    if (doArray)
        XDataArray=zeros(lengthArray,numLines);
        YDataArray=zeros(lengthArray,numLines);
        for i=numLines:-1:1
            XDataArray(:,numLines-i+1)=h(i).XData(:);
            YDataArray(:,numLines-i+1)=h(i).YData(:);
        end
    end
    clear newLengthArray;clear doArray;
end


if (CollectionStorage)
    for i=numLines:-1:1
        DataCollection(numLines-i+1,1).x(:)=h(i).XData(:);
        DataCollection(numLines-i+1,1).y(:)=h(i).YData(:);
        DataCollection(numLines-i+1,1).length=size(h(i).XData,2);
    end
end

clear ArrayStorage; clear CollectionStorage;
clear f; clear h; clear i;