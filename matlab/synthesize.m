function x = synthesize(config, X)
    nFrames = size(X,2);    % Number of frames in the spectrogram   
    x = zeros(config.frameLen + config.frameShift * (size(X, 2) - 1), 1);
        % The synthesized signal
    for f = 1:nFrames
        tmp = [X(:,f); conj(X(end-1:-1:2, f))];
            % Spectrum of the f-th frame, with the high-frequency half recovered
        frame = real(ifft(tmp)) .* config.windowSynthesis;
            % Compute the inverse Fourier transform and apply the synthesis window
            % The real() is used to eliminate the imaginary part, which is
            %   purely floating-point error
        start = (f-1) * config.frameShift + 1;
        finish = start - 1 + length(frame);
        x(start:finish) = x(start:finish) + frame;
    end
end
