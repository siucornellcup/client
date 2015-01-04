from PySide.QtCore import QObject, Signal, Property, Slot

class Visit(QObject):
	def __init__(self):
		visit_id = None
		visit_date = None
		nurse_fingerprint = None
		patient_fingerprint = None
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

	def set_height(self, height):
		self.height = height
	def get_height(self):
		return self.height

	def set_weight(self, weight):
		self.weight = weight
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

	v_id = Property(unicode, get_visit_id, set_visit_id, notify=visit_id_changed)
	v_weight = Property(unicode, get_weight, set_weight, notify=weight_changed)
	v_height = Property(unicode, get_height, set_height, notify=height_changed)
