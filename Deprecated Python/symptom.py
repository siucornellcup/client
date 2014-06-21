from PySide.QtCore import QObject, Signal, Property, Slot

class Symptom(QObject):
	def __init__(self):
		location = None
		intensity = None
		painType = None
		duration = None
		QObject.__init__(self)

	def set_duration(self, duration):
		self.duration = duration
	def get_duration(self):
		return self.duration

	def set_location(self, location):
		self.location = location
	def get_location(self):
		return self.location

	def set_intensity(self, intensity):
		self.intensity = intensity
	def get_intensity(self):
		return self.intensity

	def set_painType(self, painType):
		self.painType = painType
	def get_painType(self):
		return self.painType

	@Signal
	def duration_changed(self):
		pass

	@Signal
	def location_changed(self):
		pass

	@Signal
	def intensity_changed(self):
		pass

	@Signal
	def painType_changed(self):
		pass

	s_location = Property(unicode, get_location, set_location, notify = location_changed)
	s_intensity = Property(unicode, get_intensity, set_intensity, notify = intensity_changed)
	s_painType = Property(unicode, get_painType, set_painType, notify = painType_changed)
	s_duration = Property(unicode, get_duration, set_duration, notify = duration_changed)

