import sys
import os
from PyQt5.QtCore import pyqtProperty, QCoreApplication, QObject, QUrl
from PyQt5.QtQml import qmlRegisterType, QQmlComponent, QQmlEngine
from PyQt5.QtQuick import QQuickView
from PyQt5.QtGui import QGuiApplication

if __name__ == '__main__':
	print "Starting GUI"
	#app = QCoreApplication(sys.argv)
	#engine = QQmlEngine()
	#component = QQmlComponent(engine)
	#component.loadUrl(QUrl('main.qml'))
	#component.create()
	app = QGuiApplication(sys.argv)
	view = QQuickView()
	#view.setWidth(500)
   	#view.setHeight(500)
   	view.setTitle('Courier')
   	#view.setResizeMode(QQuickView.SizeRootObjectToView)
   	view.setSource(QUrl.fromLocalFile(os.path.join(os.path.dirname(__file__),'main.qml')))
   	view.show()
   	qml_rectangle = view.rootObject()
   	sys.exit(app.exec_())