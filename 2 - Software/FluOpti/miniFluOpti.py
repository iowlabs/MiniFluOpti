#!/usr/bin/python3
import json, signal, sys, base64, os, glob, datetime, io, sched
from zipfile import ZipFile
from time import sleep, mktime, time
from picamera import PiCamera, Color

from camera_pi import Camera
import pi_pwm, pi_ntc

from base64 import encodebytes
from PIL import Image

from threading import Timer

class miniFluOpti():
    def __init__(self):
        self._default_modules  = {
        #MODULE  #CHANNEL    #VALUE
        'R'    :{ 'chan':5, 'value': 0},
        'G'    :{ 'chan':4, 'value': 0},
        'B'    :{ 'chan':3, 'value': 0},
        'W'    :{ 'chan':2, 'value': 0},
        'HEATER_1' :{ 'chan':0, 'value': 0},
        'HEATER_2' :{ 'chan':1, 'value': 0}
        }
        self.t1 = 0.0
        self.t2 = 0.0
        # Start hardware components
        self.camera_status = False
        #self.startCamera()

        self.startPWM()
        self.startNTC()

        self.pics_taken = len(glob.glob1("data/","*.jpg"))

    def gen_frame(self):
        """Video streaming generator function."""
        while True:
            frame = Camera().get_frame()
            yield (b'--frame\r\n'
                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

    def startPWM(self):
        try:
            print('pwm start')
            self.pwm = pi_pwm.pi_pwm(0x5c)
            self.pwm_status = True
        except  Exception as e:
            print('Problem with the i2c modules')
            self.pwm_status = False
            print(e, flush=True)

    def startNTC(self):
        try:
            print('ntc start (temp sensor)')
            self.ntc = pi_ntc.pi_ntc()
            self.ntc_status = True
        except  Exception as e:
            print('Problem with the ntc module')
            self.ntc_status = False
            print(e, flush=True)

    def startCamera(self):
        try:
            print("Starting camera", flush=True)
            try: self.camera.close()
            except: pass
            self.camera = PiCamera()
            self.camera_status = True
        except Exception as e:
            self.camera_status = False
            print(e, flush=True)

    def LEDSetPWR(self,color, p):
        self._default_modules[color]['value'] = p

    def LEDon(self,color):
        self.pwm.set_pwm(_default_modules[color]['chan'],self._default_modules[color]['value'])

    def LEDoff(self,color): #not change the value stored
        self.pwm.set_pwm(_default_modules[color]['chan'],0)

    def updateTemps(self):
        self.t1,self.t2 = self.ntc.get_temps()
        print(f"t1: {self.t1},\t t2: {self.t2} ")

    ''' Clean exit '''
    def close(self, *args):
        try:
            self.camera.close()
        except Exception as e:
            print(e, flush=True)
# --------------- Testing  -------------------------
if __name__ == '__main__':

    print('Testing miniFluo\n')
    miniFluo =  miniFluOpti()

	print('Testing PWM, press Ctrl-C to quit...')

	# [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0]
	seq = list(range(0,101,10))
	#seq.extend( list(range(90,-1,-10)) )

	while True:
		for prcnt in seq:
			print(prcnt)
			sys.stdout.flush()
            miniFluo.LEDSetPWR('B',prcnt)
            miniFluo.LEDon('B')
            miniFluo.updateTemps()
            time.sleep(0.5)
