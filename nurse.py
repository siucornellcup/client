from dbTools import nurse_lookup_fp, nurse_userpass_lookup
import json
import base64
from PySide.QtCore import QObject, Property, Signal, Slot

class Nurse(QObject):
	"""Nurse class. Initialized by fingerprint md5 hash"""

	def __init__(self):
		QObject.__init__(self)
		self.name = None
		self.village = None

	def make_json(self):
		"""
		Dumps the pertinent nurse attributes into a JSON hash table
		Returns the JSON string object
		If the photo id has not been encoded, returns False
		"""
		if self.id_photo_format != 'base64':
			return False
		json_data = json.dumps({'name':self.name,
								'fingerprint_hash':self.fingerprint_hash,
								'dob':self.dob,
								'village':self.village,
								'gender':self.gender,
								'id_photo':self.id_photo,
								'id_photo_format':self.id_photo_format
								})
		return json_data

	def encode_photo(self):
		self.id_photo = base64.b64encode(self.id_photo)
		self.id_photo_format = 'base64'
		return

	def get_name(self):
		return self.name
	def set_name(self):
		self.name = name

	def get_village(self):
		return self.village
	def set_village(self):
		self.village = village

	def get_password(self):
		return self.password
	def set_password(self):
		self.password = password

	def get_dob(self):
		return self.dob
	def set_dob(self):
		self.dob = dob



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
	def password_changed(self):
		pass

	@Slot(str)
	def fp_login(self, fingerprint):
		print "Fingerprint Login Initiated" #debugging
		self.fingerprint_hash = fingerprint
		self.fp_lookup = nurse_lookup_fp(fingerprint)
		self.password = '12345' #Amazing. Thats the same password to my luggage.
		if self.fp_lookup != None:
			for e in self.fp_lookup.items():
				setattr(self, e[0], e[1])
			self.dob = str(self.dob)
			self.fp_lookup = None
		print "Welcome",self.name #debugging

	@Slot(str)
	def userpass_login(self, username):
		print "Username & Password Login Initiated" #debugging
		self.name = username
		self.password = '12345' #Amazing. Thats the same password to my luggage.
		print 'Username:',username #debugging
		print 'Password:', self.password #debugging
		self.userpass_lookup = nurse_userpass_lookup(self.name)
		if self.userpass_lookup != None:
			for e in self.userpass_lookup.items():
				setattr(self, e[0], e[1])
			self.dob = str(self.dob)
			self.userpass_lookup = None	
		print "Welcome",self.name #debugging
		print "From the village of",self.village #debugging

	@Slot(str)
	def net_fp_login(self, fingerprint):
		print "Remote Fingerprint Login Initiated" #debugging
		self.fingerprint_hash = fingerprint
		

	n_name = Property(unicode, get_name, set_name, notify=name_changed)
	n_village = Property(unicode, get_village, set_village, notify=village_changed)
	n_password = Property(unicode, get_password, set_password, notify=password_changed)
	n_dob = Property(unicode, get_dob, set_dob, notify=dob_changed)
#Dummy fingerprint: 00372a6fb1a467b54992df4daf0dfa49