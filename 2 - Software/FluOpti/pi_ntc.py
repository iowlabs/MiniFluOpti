"""
This module read of an NTC temperature sensor through the integrated MAX6682

"""

############ IMPLEMENTATION NOTES ##############################################
#
# NTC SPI raspberry pi interface.
# 
# https://learn.sparkfun.com/tutorials/raspberry-pi-spi-and-i2c-tutorial/all
# https://pypi.org/project/spidev/
# ------------------------------------------------------------------------------
#
# - 10 bit resolution
# - Frequency from up to 5MHz
# - Sample time 0.5Hz
# - 2 channels
# 
################################################################################


# ----- Imports ---------------
import spidev

# ----- Global Variables ---------------
DEVICE = 0


class pi_ntc():
  def __init__(self):
    self.temps = [0.0,0.0]
    self.data  = [ 3 , 248]
    self.data_bites = ""
    self.sig      = ""
    self.integer  = ""
    self.decimal  = ""
    
    self.spi_sensors = [spidev.SpiDev(),spidev.SpiDev()] 
    self.spi_sensors[0].open(DEVICE,0) 
    self.spi_sensors[1].open(DEVICE,1) 
    # #self.spi_sensors[0].bits_per_world = 11
    # #self.spi_sensors[1].bits_per_world = 11
  def get_temp(self,ch):
    #read temp from sensor 1
    if ch in [0,1]:
      self.data = spi_sensors[ch].readbytes(2)
    #get the rigth bits
    self.data_bites = "{0:0>8b}".format(self.data[0])+"{0:0>8b}".format(self.data[1])
    #opcion1
    self.sig      = self.data_bites[0]
    self.integer  = self.data_bites[1:8]
    self.decimal  = self.data_bites[8:11]
    #opcion2
    #self.sig      = self.data_bites[4]
    #self.integer  = self.data_bites[5:12]
    #self.decimal  = self.data_bites[12:15]

    temp = (1-2*int(self.sig,2) ) * int(self.integer,2)+int(self.decimal,2)*0.125
    return temp
  
  def get_temps(self,ch=-1):
    if ch ==0:
      return [self.get_temp(0),0]
    if ch ==1:
      return [0,self.get_temp(1)]
    if ch ==-1:
      return [self.get_temp(0),self.get_temp(1)]


# --------------- Testing  -------------------------
if __name__ == '__main__':
  print('Testing PW\n')

  print('Init ntc')
  ntc = pi_ntc()
  print('\tinit done !\n')

  print('Reading temps')
  print('Reading CH0:')
  print(ntc.get_temps(0))
  print('Reading CH1:')
  print(ntc.get_temps(1))
  print('Reading both:')
  print(ntc.get_temps())