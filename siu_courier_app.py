import sys
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtDeclarative import QDeclarativeView
import nurse
import patient
import dbTools

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

class Courier(QDeclarativeView):
	def __init__(self):
		super(Courier, self).__init__()
		self.setWindowTitle("SIU Courier Telemedical Solution")
	##	self.setWindowFlags(Qt.FramelessWindowHint)
	##	self.showFullScreen()

def main():
	app = QApplication(sys.argv)
	nurse1 = nurse.Nurse()
	patient1 = patient.Patient()
	view = Courier()
	view.rootContext().setContextProperty('patient', patient1)
	view.rootContext().setContextProperty('nurse', nurse1) #this needs to happen before setsource or errors get thrown
	patientList = dbTools.get_all_patients()
	patients = PatList(patientList)
	view.rootContext().setContextProperty('patientListModel', patients)
	view.setSource('main.qml')
	view.show()
	sys.exit(app.exec_())

if __name__ == '__main__':
	main()
