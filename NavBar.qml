import QtQuick 1.1

    BorderImage {
        id: navBar
        x: 0
        y: 689
        source: "images/navbar/UI_NavBar.png"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        Text {
            id: device
            x: 146
            y: 32
            width: 64
            height: 22
            color: "#ffffff"
            text: qsTr("Devices")
            font.pointSize: 16
            font.family:"DroidSans"
        }

        Image {
            id: leftArrow
            x: 30
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
            id: heartMonitor
            x: 236
            y: 20
            width: 60
            height: 51
            source: "images/navbar/UI_NavBar_BlPressure_Btn.png"
            visible: true
        }

        Image {
            id: tempMonitor
            x: 334
            y: 20
            width: 28
            height: 51
            source: "images/navbar/UI_NavBar_Temp_Btn.png"
            visible: true

        }
        Image {
            id: weightMonitor
            x: 402
            y: 20
            width: 60
            height: 51
            source: "images/navbar/UI_NavBar_Weight_Btn.png"
            visible: true
        }

        Image {
            id: stethoMonitor
            x: 482
            y: 20
            width: 60
            height: 51
            source: "images/navbar/UI_NavBar_Stetho_Btn.png"
            visible: true
        }

        Text {
            id: signalText
            x: 748
            y: 36
            color: "#ffffff"
            text: qsTr("Signal")
            font.pointSize: 16
            font.family:"DroidSans"
            visible: true
        }

        Image {
            id: signal
            x: 818
            y: 16
            width: 64
            height: 59
            source: "images/navbar/UI_NavBar_Signal0_Btn.png"
            visible: true
        }
        Image {
            id: battery
            x: 610
            y: 23
            width: 100
            height: 46
            source: "images/navbar/UI_NavBar_Battery5_Btn.png"
            visible: true
        }
}

