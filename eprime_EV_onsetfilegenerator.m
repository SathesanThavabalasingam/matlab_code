% This script will pull trial onset information from a excel-exported
% eprime file (saved as .xls), and will generate EV's for each condition.
% It needs to be modifed for each experiment, as the indicators for
% conditions and the column name that is associated with the trial onset
% will be different from experiment to experiment.

clear all
trial_number = 256 ; %number of trials

%%%%
%%%%
%%%%
subj= 'S11R3' % change 1 to the appropriate value
%%%%
%%%%
%%%%


%%%%
%%%%
%%%%
xlsread('itemcontext_RET_V3_RUN3-11-1.xls')
%%%%
%%%%
%%%%




item_in= ans
item_in(:,61)=item_in(:,61)/1000
onsettime=item_in(2,61)

% change if you want to write out EV file
write_out=1 % write EV files? 0=no 1=yes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Processing of item EVs %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% sort item conditions into EVs
%these are counters to indicate what entry each value will be in the
%respective ev files.
a1=1; a2=1; a3=1; a4=1; a5=1;
a6=1; a7=1; a8=1; a9=1; a10=1;
a11=1;a12=1;a13=1;a14=1;a15=1;a16=1;

%Set trial lists as empty for each EV
EV1=[];EV2=[];EV3=[];EV4=[];EV5=[];
EV6=[];EV7=[];EV8=[];EV9=[];EV10=[];
EV11=[]; EV12=[];EV13=[];EV14=[];
EV15=[];EV16=[];


% populate based on the nature of the Edat file, note that in this case,
% every other trial is a fixation, so the loop counts by twos
for x=2:2:trial_number
    if item_in(x,38)==1;
        if item_in(x,53)==1;
            if item_in(x,57)==1;
                EV1(a1)= item_in(x,61)-onsettime; a1=a1+1;
            elseif item_in(x,57)==0;
                EV2(a2)= item_in(x,61)-onsettime; a2=a2+1;
            end
        elseif item_in(x,53)==3;
            if item_in(x,57)==1;
                EV3(a3)= item_in(x,61)-onsettime; a3=a3+1;
            elseif item_in(x,57)==0;
                EV4(a4)= item_in(x,61)-onsettime; a4=a4+1;
            end
            
        end
    elseif item_in(x,38)==2;
        if item_in(x,53)==1;
            if item_in(x,57)==1;
                EV5(a5)= item_in(x,61)-onsettime; a5=a5+1;
            elseif item_in(x,57)==0;
                EV6(a6)= item_in(x,61)-onsettime; a6=a6+1;
            end
        elseif item_in(x,53)==3;
            if item_in(x,57)==1;
                EV7(a7)= item_in(x,61)-onsettime; a7=a7+1;
            elseif item_in(x,57)==0;
                EV8(a8)= item_in(x,61)-onsettime; a8=a8+1;
            end
            
        end
    elseif item_in(x,38)==3;
        if item_in(x,53)==1;
            if item_in(x,57)==1;
                EV9(a9)= item_in(x,61)-onsettime; a9=a9+1;
            elseif item_in(x,57)==0;
                EV10(a10)= item_in(x,61)-onsettime; a10=a10+1;
            end
        elseif item_in(x,53)==3;
            if item_in(x,57)==1;
                EV11(a11)= item_in(x,61)-onsettime; a11=a11+1;
            elseif item_in(x,57)==0;
                EV12(a12)= item_in(x,61)-onsettime; a12=a12+1;
            end
            
        end
    elseif item_in(x,38)==4;
        if item_in(x,53)==1;
            if item_in(x,57)==1;
                EV13(a13)= item_in(x,61)-onsettime; a13=a13+1;
            elseif item_in(x,57)==0;
                EV14(a14)= item_in(x,61)-onsettime; a14=a14+1;
            end
        elseif item_in(x,53)==3;
            if item_in(x,57)==1;
                EV15(a15)= item_in(x,61)-onsettime; a15=a15+1;
            elseif item_in(x,57)==0;
                EV16(a16)= item_in(x,61)-onsettime; a16=a16+1;
            end
            
        end
    end
end

%Create a 3 column matrix with the duration and weight information (here,
%duration is hard-coded)
for xx=1:16
    eval(sprintf('ev%dmtx(:,1)=(EV%d'')',xx,xx))
    eval(sprintf('ev%dmtx(:,2)=3.5',xx))
    eval(sprintf('ev%dmtx(:,3)=1',xx))
end


%Write to .dat files
if write_out == 1
    dlmwrite(sprintf('EV1.%s.dat', subj ), ev1mtx ,'\t')
    dlmwrite(sprintf('EV2.%s.dat', subj ), ev2mtx ,'\t')
    dlmwrite(sprintf('EV3.%s.dat', subj ), ev3mtx ,'\t')
    dlmwrite(sprintf('EV4.%s.dat', subj ), ev4mtx ,'\t')
    dlmwrite(sprintf('EV5.%s.dat', subj ), ev5mtx ,'\t')
    dlmwrite(sprintf('EV6.%s.dat', subj ), ev6mtx ,'\t')
    dlmwrite(sprintf('EV7.%s.dat', subj ), ev7mtx ,'\t')
    dlmwrite(sprintf('EV8.%s.dat', subj ), ev8mtx ,'\t')
    dlmwrite(sprintf('EV9.%s.dat', subj ), ev9mtx ,'\t')
    dlmwrite(sprintf('EV10.%s.dat', subj ), ev10mtx ,'\t')
    dlmwrite(sprintf('EV11.%s.dat', subj ), ev11mtx ,'\t')
    dlmwrite(sprintf('EV12.%s.dat', subj ), ev12mtx ,'\t')
    dlmwrite(sprintf('EV13.%s.dat', subj ), ev13mtx ,'\t')
    dlmwrite(sprintf('EV14.%s.dat', subj ), ev14mtx ,'\t')
    dlmwrite(sprintf('EV15.%s.dat', subj ), ev15mtx ,'\t')
    dlmwrite(sprintf('EV16.%s.dat', subj ), ev16mtx ,'\t')
    
end
