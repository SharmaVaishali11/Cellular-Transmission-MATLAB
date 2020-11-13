clc
clear all
s=[0 1 1 1 0]
for j=1:10
    for i=1:5
        r(i)=rand;
        if r(i)<0.5
            b(i)=0;
        else
            b(i)=1;
        end
    end
    m = xor(b,s);
    for i=1:5
        if m(i)==0
            d(i)=-1;
        else
            d(i)=1;
        end
    end
    l=length(d);
    res=.01;
    t=0:res:(l-res);
    i=1;
    while i<l+1
        for j=((i-1)/res)+1:i/res
            y(j)=d(i);  
        end
        i=i+1;
    end
    sig=sin(2*pi*t).*y;
    pnSequence = comm.PNSequence('Polynomial',[3 2 0],'SamplesPerFrame',5,'InitialConditions',[0 0 1]);
    x2 = pnSequence()
    for i=1:5
        if x2(i)==0
            x1(i)=-1;
        else
            x1(i)=1;
        end
    end
    l1=length(x1);
    res=.01;
    t=0:res:(l1-res);
    i=1;
    while i<l1+1
        for j=((i-1)/res)+1:i/res
            y1(j)=x1(i);  
        end
        i=i+1;
    end
    figure
    subplot(5,1,1)
    plot(t,sin(2*pi*t))
    title('Carrier Wave')
    xlabel('bit value')
    ylabel('amplitude')
    subplot(5,1,2)
    plot(t,y)
    title('Data Wave')
    xlabel('bit value')
    ylabel('amplitude')
    subplot(5,1,3)
    plot(t,sig)
    title('BPSK')
    xlabel('bit value')
    ylabel('amplitude')
    subplot(5,1,4)
    plot(t,y1)
    title('PN')
    xlabel('bit value')
    ylabel('amplitude')
    subplot(5,1,5)
    plot(t,y1.*sig)
    title('DSSS BPSK and PN')
    xlabel('bit value')
    ylabel('amplitude')
    figure
    stem(t,y1.*sig)
    title('DSSS BPSK and PN(Sampled Version)')
    xlabel('bit value')
    ylabel('amplitude')
end
   

    

