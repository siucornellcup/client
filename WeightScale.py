import os
import sys
import socket
import threading
import usb
from PySide import QtCore, QtGui, QtDeclarative


class WeightScale(QtCore.QObject):
	
	def __init__(self,port=59832,host="localhost"):
		QtCore.QObject.__init__(self)
		self._port = port
		self._host = host
		self._weight = 0
		self._hasrun = False
		self._running = False
			
	def _watch(self):
		self._set_running(True)
		self._set_hasrun(True)
		
		s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
		s.bind((self._host,self._port))
		s.listen(1)
		conn,addr = s.accept()
		data = conn.recv(100000)
		data = data.decode("utf-8")
		s.close()

		self._set_weight(data)
		self._set_running(False)		
				
	@QtCore.Slot()
	def start_watch(self):
		self._running = True
		thread = threading.Thread(target=self._watch)
		thread.start()
	
	def _get_running(self):
		return self._running
		
	def _set_running(self, running):
		self._running = running
		self.on_running.emit()
		
	def _get_hasrun(self):
		return self._hasrun
	
	def _set_hasrun(self, hasrun):
		self._hasrun = hasrun
		self.on_hasrun.emit()
	
	def _get_weight(self):
		return self._weight
	
	def _set_weight(self, weight):
		self._weight = weight
		self.on_weight.emit()
	
	on_weight = QtCore.Signal()
	on_hasrun = QtCore.Signal()
	on_running = QtCore.Signal()
	
	weight = QtCore.Property(float, _get_weight, notify=on_weight)
	running = QtCore.Property(bool, _get_running, _set_running, notify=on_running)
	hasrun = QtCore.Property(bool, _get_hasrun, _set_hasrun, notify=on_hasrun)
