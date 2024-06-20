function msg = q2p2(x) 

dw = 2*pi/1050;
l = 10;
y2 = exp(2*pi*(84+128)*1i*(0:512*l-1)/512);
Y = cat(2,y2,x);
y = Y.*exp(dw*1i*(0:length(x)+l*512-1)/512);
y = awgn(y,-5,'measured');


y1 = y(1:512*l);

ycorr = 0;

for i = 1:l-2
    [Y_1,N_1] = max(STFT(y1(512*(i-1)+1:512*(i+1)),1024,512));
    [Y_2,N_2] = max(STFT(y1(512*i+1:512*(i+2)),1024,512));
    s1 = conj(Y_1)*Y_2;
    ycorr = ycorr+(s1/abs(s1));
end
offset = angle(ycorr)/(512);

y2 = exp(-1i*offset*(512*l+1:1:length(y))).*y(512*l+1:length(y));

msg = q2p1(y2);
end

function msg = q2p1(y)

wl = 512;
stride = 512;
Y = STFT(y,wl,stride);

[v,N] = max(abs(Y)');
N = N-128-1;
msg = (cast(N,'char'));

end
function S = STFT(x,wl,stride)
    
    no_frames = floor((length(x) - wl) / stride) + 1;
    S = zeros(no_frames,wl);
    for i = 1:no_frames
        start =(i-1)*stride+1; 
        endi=start+wl-1;
        S(i,:) = FFT(x(start:endi));
    end
end

function y = FFT(x)

    N = length(x);
    if N <= 1
        y = x;
    else
        w = exp(-2*pi*1i/N);
        x1 = x(1:2:end);
        x2 = x(2:2:end);
        y1 = FFT(x1);
        y2 = FFT(x2);
        y = zeros(1,N);
        for j = 1:(N/2)
            y(j)=y1(j)+((w^(j-1))*y2(j));
            y(j+(N/2))=y1(j)-((w^(j-1))*y2(j));
        end
    end
end