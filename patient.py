from PySide.QtCore import QObject, Signal, Property, Slot
from faker import Factory
from dbTools import create_patient


class Patient(QObject):
	def __init__(self):
		self.name = None
		self.village = None
		self.dob = None
		self.fingerprint = None
		self.gender = None
		QObject.__init__(self)

	@Slot()
	def create_patient_fp(self):
		fake = Factory.create()
		self.fingerprint = fake.md5(raw_output=False)
		print self.fingerprint

	@Slot()
	def create_record(self):
		create_patient(self.name, self.village, self.gender, self.fingerprint)


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

	def set_gender(self, gender):
		self.gender = gender
		print self.gender
	def get_gender(self):
		return self.gender

	@Signal
	def name_changed(self):
		pass
	@Signal
	def village_changed(self):
		pass
	@Signal
	def dob_changed(self):
		pass
	@Signal
	def gender_changed(self):
		pass

	p_name = Property(unicode, get_name, set_name, notify=name_changed)
	p_village = Property(unicode, get_village, set_village, notify=village_changed)
	p_dob = Property(unicode, get_dob, set_dob, notify=dob_changed)
	p_gender = Property(unicode, get_gender, set_gender, notify=gender_changed)
