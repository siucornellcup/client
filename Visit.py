from PySide.QtCore import QObject, Signal, Property, Slot
import serial
import io

class Visit(QObject):
	def __init__(self):
		visit_id = None
		visit_date = None
		nurse_fingerprint = None
		patient_id = None
		doctor_id = None
		weight = None
		height = None
		bp_systolic = None
		bp_diastolic = None
		pulse_rate = None
		resp_id = None
		blood_glucose = None
		QObject.__init__(self)

	## Getters & Setters
	# Old code for SpO2 sensor
	# @Slot()
	# def read_pulse_sensor(self):
	# 	print 'pulse scan initiated'
	# 	ser = serial.Serial('/dev/ttyACM0', 9600)
	# 	ser.flushOutput()
	# 	datum = ser.readline()
	# 	self.pulse_rate = datum
	# 	print datum

	def set_pulse(self, pulse):
		self.pulse_rate = pulse
		print "pulse: " + self.pulse_rate #debugging

	def get_pulse(self):
		return int(self.pulse_rate)

	def set_height(self, height):
		self.height = height
		print "height: " + self.height #debugging

	def get_height(self):
		return self.height

	def set_weight(self, weight):
		self.weight = weight
		print "weight: " + self.weight #debugging

	def get_weight(self):
		return self.weight

	def set_visit_id(self, visit_id):
		self.visit_id = visit_id

	def get_visit_id(self):
		return self.visit_id

	@Signal
	def weight_changed(self):
		pass

	@Signal
	def height_changed(self):
		pass

	@Signal
	def visit_id_changed(self):
		pass

	@Signal
	def pulse_rate_changed(self):
		pass

	v_id = Property(unicode, get_visit_id, set_visit_id, notify=visit_id_changed)
	v_weight = Property(unicode, get_weight, set_weight, notify=weight_changed)
	v_height = Property(unicode, get_height, set_height, notify=height_changed)
	v_pulse_rate = Property(int, get_pulse, set_pulse, notify=pulse_rate_changed)