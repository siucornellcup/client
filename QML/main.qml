/*
Z precedence:
Keyboard 100
Navbar 99
Tabs 99
*/


import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
Window {
    width: 1024
    height: 768
    visible: true
    Rectangle {
        id: page
        width: 1024
        height: 768
        state: 'login'
/*

        Loader {
            id: pageLoader
        }

        Rectangle {
            Component.onCompleted:pageLoader.source="PatientTab.qml"
        }
*/
        TopTabs {

        }

        NavBar {

        }
    }
}
