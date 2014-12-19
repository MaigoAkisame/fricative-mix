% Configure parameters
config.fs               = 16000;
config.frameLen         = 512;      % 32ms @ 16kHz
config.frameShift       = 256;      % 16ms @ 16kHz
config.fftSize          = 512;      % Equal to frameLen to facilitate synthesis
config.windowAnalysis   = sin(((1:config.frameLen)' - 0.5) / config.frameLen * pi);
config.windowSynthesis  = config.windowAnalysis;
                                    % The sine window will be applied in
                                    % both analysis and synthesis

% Directories
inputDir = '../audio/input-wav/';
outputDir = '../audio/output-wav/';

% Load waveforms
f = wavread([inputDir, 'f.wav']);
s = wavread([inputDir, 's.wav']);
sh = wavread([inputDir, 'sh.wav']);
th = wavread([inputDir, 'th.wav']);

% Mix each pair of fricatives (0.5 is the target duration)
wavwrite(mix(config, f, s, 0.5), config.fs, [outputDir, 'f+s.wav']);
wavwrite(mix(config, f, sh, 0.5), config.fs, [outputDir, 'f+sh.wav']);
wavwrite(mix(config, f, th, 0.5), config.fs, [outputDir, 'f+th.wav']);
wavwrite(mix(config, s, sh, 0.5), config.fs, [outputDir, 's+sh.wav']);
wavwrite(mix(config, s, th, 0.5), config.fs, [outputDir, 's+th.wav']);
wavwrite(mix(config, sh, th, 0.5), config.fs, [outputDir, 'sh+th.wav']);

% For comparison, mix each fricative with itself as well
wavwrite(mix(config, f, f, 0.5), config.fs, [outputDir, 'f+f.wav']);
wavwrite(mix(config, s, s, 0.5), config.fs, [outputDir, 's+s.wav']);
wavwrite(mix(config, sh, sh, 0.5), config.fs, [outputDir, 'sh+sh.wav']);
wavwrite(mix(config, th, th, 0.5), config.fs, [outputDir, 'th+th.wav']);
