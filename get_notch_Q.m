function Q = get_notch_Q(centerFreq, cutoffFreq)
% get notch filter Q given center frequency (f0) and lower cutoff frequency (f1)
% Q = f0 / (f2 - f1) ; f2 = f0^2 / f1
    Q = centerFreq * cutoffFreq / (centerFreq * centerFreq - cutoffFreq * cutoffFreq);

end