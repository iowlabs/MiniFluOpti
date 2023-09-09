from FluOpti.miniFluOpti import miniFluOpti

print('Testing miniFluo\n')
miniFluo =  miniFluOpti()
print('Testing PWM, press Ctrl-C to quit...')
# [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0]
seq = list(range(0,101,10))
#seq.extend( list(range(90,-1,-10)) )
miniFluo.setTempSampleTime(1)
miniFluo.setTempSP(1,30)
miniFluo.setTempSP(2,35)
miniFluo.startTempCtrl()
for prcnt in seq:
    sys.stdout.flush()
    miniFluo.LEDSetPWR('B',prcnt)
    miniFluo.LEDon('B')
    time.sleep(5)
miniFluo.stopTempCtrl()
miniFluOpti.LEDoff('B')
