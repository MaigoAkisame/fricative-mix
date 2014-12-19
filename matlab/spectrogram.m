function X = spectrogram(config, x)
    nBins = config.fftSize / 2 + 1; % Number of bins in the spectrogram
    nFrames = floor((length(x) - config.frameLen) / config.frameShift) + 1;
                                    % Number of frames in the spectrogram
    X = zeros(nBins, nFrames);      % The spectrogram
    for f = 1:nFrames
        start = (f-1) * config.frameShift + 1;
        finish = start - 1 + config.frameLen;
        frame = x(start:finish) .* config.windowAnalysis;
                                    % Apply the analysis window to the frame
        tmp = fft(frame, config.fftSize);
                                    % Compute the Fourier transform
        X(:,f) = tmp(1:nBins);      % Retain only the low-frequency half
    end
end
