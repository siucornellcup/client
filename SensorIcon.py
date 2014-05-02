import os
import sys
import threading
import usb
from PySide import QtCore, QtGui, QtDeclarative


class SensorIcon(QtCore.QObject):
	
	def __init__(self,heartRateIDs,bloodPressureIDs):
		QtCore.QObject.__init__(self)
		self._heartRateIDs = heartRateIDs;
		self._bloodPressureIDs = bloodPressureIDs;
		self._heartRate = False
		self._bloodPressure = False
		self._running = False
		self.start_watch()
			
	def _watch(self):
		while (self._running == True):
			
			usb_dump = usb.core.find(find_all=True)
			
			temp = False
			for dev in usb_dump:
				if ((dev.idVendor, dev.idProduct) == self._heartRateIDs):
					temp = True
					break
				else:
					temp = False
			
			emit = False
			if(temp != self._heartRate):
				emit = True
			self._heartRate = temp
			if(emit):
				self.on_heartRate.emit()
				emit = False
			
			temp = False
			for dev in usb_dump:
				currentVendorID = dev.idVendor
				currentProductID = dev.idProduct
				
				if ((dev.idVendor, dev.idProduct) == self._bloodPressureIDs):
					temp = True
					break
				else:
					temp = False
			
			emit = False
			if(temp != self._bloodPressure):
				emit = True
			self._bloodPressure = temp
			if(emit):
				self.on_bloodPressure.emit()
				emit = False
				
	@QtCore.Slot()
	def start_watch(self):
		self._running = True
		thread = threading.Thread(target=self._watch)
		thread.start()
	
	def _get_heartRate(self):
		return self._heartRate;
	
	def _get_bloodPressure(self):
		return self._bloodPressure;
	
	def _get_running(self):
		return self._running;
		
	def _set_running(self, running):
		self._running = running
		self.on_running.emit()
	
	
	on_heartRate = QtCore.Signal()
	on_bloodPressure = QtCore.Signal()
	on_running = QtCore.Signal()
		
	heartRate = QtCore.Property(bool, _get_heartRate, notify=on_heartRate)
	bloodPressure = QtCore.Property(bool, _get_bloodPressure, notify=on_bloodPressure)
	running = QtCore.Property(bool, _get_running, _set_running, notify=on_running)

if __name__ == "__main__":
	
	
	heartRateIDs = (int("1778",16),int("0208",16))
	bloodPressureIDs = (000,000)
	sensorIcon = SensorIcon(heartRateIDs,bloodPressureIDs)
	
	view.rootContext().setContextProperty('sensorIcon',sensorIcon)
	
	for dev in usb.core.find(find_all=True):
		currentVendorID = dev.idVendor
		currentProductID = dev.idProduct
		if ((currentVendorID, currentProductID) == (int("1778",16),int("0208",16))):
			print "I SAW IT"

