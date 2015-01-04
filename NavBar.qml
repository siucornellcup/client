import QtQuick 1.1

    BorderImage {
        id: navBar
        source: "images/navbar/UI_NavBar.png"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        Text {
            id: device
            x: 146
            y: 37
            width: 64
            height: 22
            color: "#ffffff"
            text: qsTr("Devices")
            font.pointSize: 12
            font.family:"DroidSans"
        }

        Image {
            id: leftArrow
            anchors.left: parent.left
            anchors.leftMargin: 30
            y: 20
            source: "images/navbar/UI_NavBar_Left_Btn.png"
            MouseArea {
                id: leftArrowMouse
                anchors.fill: parent
                onPressed: leftArrow.source = "images/navbar/UI_NavBar_Left_Active_Btn.png"
                onReleased: leftArrow.source = "images/navbar/UI_NavBar_Left_Btn.png"
            }
        }
        Image {
            id: rightArrow
            anchors.right: parent.right
            anchors.rightMargin: 30
            y: 20
            source: 'images/navbar/UI_NavBar_Right_Btn.png'
        }
        Row{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 6
            x: 230
            spacing: 20

            Image{
                id: pulseMonitor
                source: 'images/navbar/UI_NavBar_HeartRate_Btn.png'
            }
            Image {
                id: tempMonitor
                source: "images/navbar/UI_NavBar_Temp_Btn.png"
            }
            Image {
                id: weightMonitor
                source: "images/navbar/UI_NavBar_Weight_Btn.png"
            }

            Image {
                id: stethoMonitor
                source: "images/navbar/UI_NavBar_Stetho_Btn.png"
            }
            Image {
                id: pressureMonitor
                source: "images/navbar/UI_NavBar_BlPressure_Btn.png"
                anchors.verticalCenter: parent.verticalCenter
            }

        }
        Text {
            id: signalText
            x: 748
            y: 36
            color: "#ffffff"
            text: qsTr("Signal")
            font.pointSize: 14
            font.family:"DroidSans"
        }

        Image {
            id: signal
            x: 818
            y: 16
            width: 64
            height: 59
            source: "images/navbar/UI_NavBar_Signal0_Btn.png"
        }
        Image {
            id: batteryShape
            source: 'images/navbar/UI_NavBar_Battery_Shape.png'
            opacity: 1
            x: 610
            anchors.verticalCenter: signal.verticalCenter
            Image {
                id: battery
                anchors.fill: parent
                source: "images/navbar/UI_NavBar_Battery5_Btn.png"
            }
        }
}

