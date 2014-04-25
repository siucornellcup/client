from PySide.QtCore import QObject, Signal, Property, Slot
from faker import Factory
from dbTools import create_patient


class Patient(QObject):
	def __init__(self):
		self.name = None
		self.first_name = None
		self.last_name = None
		self.village = None
		self.dob = None
		self.fingerprint = None
		self.gender = None
		self.photo_id_path = None
		self.photo_id = None
		QObject.__init__(self)

	@Slot()
	def create_patient_fp(self):
		fake = Factory.create()
		self.fingerprint = fake.md5(raw_output=False)
		print self.fingerprint

	@Slot()
	def create_record(self):
		create_patient(self.first_name, self.last_name, self.village, self.gender, self.fingerprint)

	@Slot()
	def load_photo_id(self, photo_path):
		self.photo_id = open(photo_path,"rb").read()


	def set_name(self, name):
		self.name = name
		print self.name #DEBUGGING
	def get_name(self):
		return self.name

	def set_first_name(self, first_name):
		self.first_name = first_name
	def get_first_name(self):
		return self.first_name

	def set_last_name(self, last_name):
		self.last_name = last_name
	def get_last_name(self):
		return self.last_name

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

	def set_photo_id_path(self, photo_id_path):
		self.photo_id_path = photo_id_path
	def get_photo_id_path(self):
		return self.photo_id_path

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
	@Signal
	def photo_id_path_changed(self):
		pass
	@Signal
	def first_name_changed(self):
		pass
	@Signal
	def last_name_changed(self):
		pass

	p_name = Property(unicode, get_name, set_name, notify=name_changed)
	p_first_name = Property(unicode, get_first_name, set_first_name, notify=first_name_changed)
	p_last_name = Property(unicode, get_last_name, set_last_name, notify=last_name_changed)
	p_village = Property(unicode, get_village, set_village, notify=village_changed)
	p_dob = Property(unicode, get_dob, set_dob, notify=dob_changed)
	p_gender = Property(unicode, get_gender, set_gender, notify=gender_changed)
	p_photo_id_path = Property(unicode, get_photo_id_path, set_photo_id_path, notify=photo_id_path_changed)
