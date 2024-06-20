function msg = q2p1(x)

y = awgn(x,-15,'measured');

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