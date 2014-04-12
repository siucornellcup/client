from PySide.QtCore import QObject, Signal, Property

class Patient(QObject):
	def __init__(self):
		self.name = None
		self.village = None
		self.dob = None
		QObject.__init__(self)

	def set_name(self, name):
		self.name = name
		print self.name #DEBUGGING
	def get_name(self):
		return self.name

	def set_village(self, village):
		self.village = village
		print self.village #DEBUGGING
	def get_village(self):
		return self.village

	def set_dob(self,dob):
		self.dob = dob
	def get_dob(self):
		return self.dob

	@Signal
	def name_changed(self):
		pass
	@Signal
	def village_changed(self):
		pass
	@Signal
	def dob_changed(self):
		pass

	p_name = Property(unicode, get_name, set_name, notify=name_changed)
	p_village = Property(unicode, get_village, set_village, notify=village_changed)
	p_dob = Property(unicode, get_dob, set_dob, notify=dob_changed)
