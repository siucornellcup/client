import sys
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtDeclarative import QDeclarativeView
import nurse
import patient
import dbTools
import Visit
import symptom
import serial
import SensorIcon
import time
import WeightScale


class PatList(QAbstractListModel):
	COLUMNS = ('patient',)
	def __init__(self, patients):
		QAbstractListModel.__init__(self)
		self._patients = patients
		self.setRoleNames(dict(enumerate(PatList.COLUMNS)))
    
	def rowCount(self, parent):
		return len(self._patients)

	def data(self, index, role):
		if index.isValid() and role == PatList.COLUMNS.index('patient'):
			return self._patients[index.row()]
		return None
		
	@Slot()
	def update(self):
		self._patients = dbTools.get_all_patients()

class SympList(QAbstractListModel):
	COLUMNS = ('symptom',)
	def __init__(self):
		QAbstractListModel.__init__(self)
		self._symptoms = []
		self.setRoleNames(dict(enumerate(SympList.COLUMNS)))
	
	def rowCount(self, parent):
		return len(self._symptoms)

	def data(self, index, role):
		if index.isValid() and role == SympList.COLUMNS.index('symptom'):
			return self._symptoms[index.row()]
		return None

	@Slot()
	def updateList(self, symptom):
		self._symptoms.append(symptom)
		
class Courier(QDeclarativeView):
	def __init__(self):
		super(Courier, self).__init__()
		self.setWindowTitle("SIU Courier Telemedical Solution")
		self.setWindowFlags(Qt.FramelessWindowHint)
		self.showFullScreen()

def main():
	app = QApplication(sys.argv)
	heartRateIDs = (int("16C0",16),int("0483",16))
	bloodPressureIDs = (000,000)
	sensorIcon = SensorIcon.SensorIcon(heartRateIDs,bloodPressureIDs)
	
	weightScale = WeightScale.WeightScale()	

	nurse1 = nurse.Nurse()
	patient1 = patient.Patient()
	visit1 = Visit.Visit()
	symptom1 = symptom.Symptom()
	symptomList = SympList()
	view = Courier()
	view.rootContext().setContextProperty('symptom', symptom)
	view.rootContext().setContextProperty('patient', patient1)
	view.rootContext().setContextProperty('nurse', nurse1) #this needs to happen before setsource or errors get thrown
	view.rootContext().setContextProperty('visit', visit1)
	view.rootContext().setContextProperty('sensorIcon',sensorIcon)
	view.rootContext().setContextProperty('weightScale',weightScale)	
	patientList = dbTools.get_all_patients()
	patients = PatList(patientList)
	view.rootContext().setContextProperty('patientListModel', patients)
	view.setSource('main.qml')
	view.show()
	app.exec_()
	sensorIcon._set_running(False)
	sys.exit()

if __name__ == '__main__':
	main()
