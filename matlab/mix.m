function z = mix(config, x, y, duration)
    % Normalize the power of the two inputs
    x = (x - mean(x)) ./ std(x, 0) / 5;
    y = (y - mean(y)) ./ std(y, 0) / 5;

    % Compute the spectrograms of the two inputs
    X = spectrogram(config, x);
    Y = spectrogram(config, y);

    % Stretch both spectrograms to the target duration
    N = floor((duration * config.fs - config.frameLen) / config.frameShift) + 1;
        % N is the number of frames in 0.5 seconds
    X = X(:, ceil((1:N) / N * size(X,2)));
    Y = Y(:, ceil((1:N) / N * size(Y,2)));

    % Separate the magnitude and phase of the spectrograms
    Xmag = abs(X); Xphase = angle(X);
    Ymag = abs(Y); Yphase = angle(Y);

    % Average the magnitude spectrogram of the two inputs to get the
    % magnitude spectrogram of the mixture
    Zmag = (Xmag + Ymag) / 2;
    % Use random phase for the mixture
    Zphase = rand(size(Zmag)) * 2 * pi;

    % Synthesis the mixture
    Z = Zmag .* exp(j * Zphase);
    z = synthesize(config, Z);
end
