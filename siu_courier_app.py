import sys
from PySide.QtCore import *
from PySide.QtGui import *
from PySide.QtDeclarative import QDeclarativeView
import nurse
import patient


class Courier(QDeclarativeView):
	def __init__(self):
		super(Courier, self).__init__()
		self.setWindowTitle("SIU Courier Telemedical Solution")
		self.showFullScreen()

def main():
	app = QApplication(sys.argv)
	nurse1 = nurse.Nurse()
	patient1 = patient.Patient()
	view = Courier()
	view.rootContext().setContextProperty('patient', patient1)
	view.rootContext().setContextProperty('nurse', nurse1) #this needs to happen before setsource or errors get thrown
	view.setSource('main.qml')
	view.show()
	sys.exit(app.exec_())

if __name__ == '__main__':
	main()
