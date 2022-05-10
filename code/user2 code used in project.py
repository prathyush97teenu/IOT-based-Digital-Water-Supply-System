import requests
import urllib2
import json

import RPi.GPIO as GPIO                    #Import GPIO library

import time                                #Import time library

GPIO.setmode(GPIO.BCM)                     #Set GPIO pin numbering 


TRIG = 20                                  #Associate pin 23 to TRIG

ECHO = 21                                  #Associate pin 24 to ECHO

valve = 19


moist_pin = 4

#print "Distance measurement in progress"



GPIO.setup(TRIG,GPIO.OUT)                  #Set pin as GPIO out
GPIO.setup(ECHO,GPIO.IN)                   #Set pin as GPIO in
GPIO.setup(valve,GPIO.OUT)                 #Set pin as GPIO out
GPIO.setup(moist_pin,GPIO.IN)

def check_level():
  GPIO.output(TRIG, False)                 #Set TRIG as LOW
  print "Waitng For Sensor To Settle"
  time.sleep(1)                            #Delay of 2 seconds

  GPIO.output(TRIG, True)                  #Set TRIG as HIGH
  time.sleep(0.00001)                      #Delay of 0.00001 seconds
  GPIO.output(TRIG, False)                 #Set TRIG as LOW

  while GPIO.input(ECHO)==0:               #Check whether the ECHO is LOW
    pulse_start = time.time()              #Saves the last known time of LOW pulse

  while GPIO.input(ECHO)==1:               #Check whether the ECHO is HIGH
    pulse_end = time.time()                #Saves the last known time of HIGH pulse 

  pulse_duration = pulse_end - pulse_start #Get pulse duration to a variable

  distance = pulse_duration * 17150        #Multiply pulse duration by 17150 to get distance
  distance = round(distance, 2)            #Round to two decimal points

  if distance > 2 and distance < 35:      #Check whether the distance is within range
    #print "Distance:",distance - 0.5,"cm"  #Print distance with 0.5 cm calibration
    distance=distance-0.5
    distance=distance/22
    distance=distance*100
    distance=100-distance
    #distance=format(distance,'.2f')
    print (distance)
    print ("checked")
    return distance
  else:
    print "Out Of Range"                   #display out of range
    return 999


  

def control(j):
	a=check_level()
	c=75
	GPIO.output(valve, False)
	if a<c:
		GPIO.output(valve, True)                  #Set TRIG as HIGH
		print("valve on")
		print(j)
		while a<75 and j>0:
			a=check_level()
			j=j-1
			print(a,j)
			#time.sleep(1)
		GPIO.output(valve, False)                  #Set TRIG as HIGH
		#print("tank full")
		payload = {"id": 2}
		r = requests.get("https://www.inventeron-iot.com/digiwater11/api/tank_cmd_update.php", params=payload)
		print(r.url)
			
	else:
		GPIO.output(valve, False)                  #Set TRIG as HIGH
		#print(a)
		print("tank alreday full")
		payload = {"id": 2}
		r = requests.get("https://www.inventeron-iot.com/digiwater11/api/tank_cmd_update.php", params=payload)
		print(r.url)


payload = {"id": 2}
r = requests.get("https://www.inventeron-iot.com/digiwater11/api/tank_cmd_update.php", params=payload)
print(r.url)


while True:
  
  print "Reading Moisture sensor"
  x=GPIO.input(moist_pin)
  if not x==1:
    moist=1
  else:
    moist=0
  ph=0
  payload = {"moist": moist, "ph": ph}
  r = requests.get("http://www.inventeron-iot.com/digiwater11/api/sensor_update.php", params=payload)
  print(r.url)
  
  GPIO.output(TRIG, False)                 #Set TRIG as LOW
  print "Waitng For Sensor To Settle"
  time.sleep(3)                            #Delay of 2 seconds

  GPIO.output(TRIG, True)                  #Set TRIG as HIGH
  time.sleep(0.00001)                      #Delay of 0.00001 seconds
  GPIO.output(TRIG, False)                 #Set TRIG as LOW

  while GPIO.input(ECHO)==0:               #Check whether the ECHO is LOW
    pulse_start = time.time()              #Saves the last known time of LOW pulse

  while GPIO.input(ECHO)==1:               #Check whether the ECHO is HIGH
    pulse_end = time.time()                #Saves the last known time of HIGH pulse 

  pulse_duration = pulse_end - pulse_start #Get pulse duration to a variable

  distance = pulse_duration * 17150        #Multiply pulse duration by 17150 to get distance
  distance = round(distance, 2)            #Round to two decimal points

  if distance > 2 and distance < 35:      #Check whether the distance is within range
    #print "Distance:",distance - 0.5,"cm"  #Print distance with 0.5 cm calibration
    distance=distance-0.5
    distance=distance/22
    distance=distance*100
    distance=100-distance
    distance=format(distance,'.2f')
    
    print (distance)
  else:
    print "Out Of Range"                   #display out of range
  payload = {"id": 3, "status": distance}
  r = requests.get("https://www.inventeron-iot.com/digiwater11/api/tank_status_update.php", params=payload)
  print(r.url)
  time.sleep(3)

  req = urllib2.Request('https://www.inventeron-iot.com/digiwater11/api/tank_cmd.php?id=2')
  response = urllib2.urlopen(req)
  j = response.read()
  j=int(j)
  print(j)
  if j>1:
  	GPIO.output(valve, False)
  	control(j)
  else:
  	print("no cmd")
