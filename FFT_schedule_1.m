N = 1024;
tic
schedule = getinitialschedule(FFT_gen(N), timinginfo, 0, 0:K:(K*(N-1)));
toc
plotschedule(schedule)