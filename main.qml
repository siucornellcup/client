import QtQuick 2.0
Rectangle {
    id: page
    width: 1024
    height: 768
    color: 'white'
    state: 'base state'
    BorderImage {
        id: background
        source: "UI_BackgroundColor.jpg"
        anchors.fill: parent
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5
    }
    Image {
        id: backTabs
        source: "UI_Tab1_tabs.jpg"
        anchors.fill: parent

        Text {
            id: nurseTabText
            x: 49
            y: 17
            text: qsTr("Nurse")
            font.pixelSize: 34
        }

        Text {
            id: profileTabText
            x: 251
            y: 17
            text: qsTr("Profile")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 34
        }

        Text {
            id: vitalsTabText
            x: 467
            y: 17
            text: qsTr("Vitals")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 34
        }

        Text {
            id: symptomsTabText
            x: 631
            y: 17
            text: qsTr("Symptoms")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 34
        }

        Text {
            id: diagnosisTabText
            x: 837
            y: 17
            text: qsTr("Diagnosis")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 34
        }


        MouseArea {
            id: profileTabMouse
            x: 203
            y: 8
            width: 201
            height: 60
        }

        MouseArea {
            id: vitalsTabMouse
            x: 410
            y: 8
            width: 202
            height: 60
        }

        MouseArea {
            id: symptomsTabMouse
            x: 618
            y: 8
            width: 203
            height: 60
        }

        MouseArea {
            id: diagnosisTabMouse
            x: 827
            y: 8
            width: 189
            height: 60
        }

        MouseArea {
            id: nurseTabMouse
            x: 0
            y: 8
            width: 197
            height: 60
        }
    }

    Image {
        id:loginBack
        source: "UI_Tab1_login_back.png"
        anchors.centerIn: parent
        visible: true

        Image {
            id: userNameInput
            x: 49
            y: 59
            source: "UI_tab1_login_textinput.png"


        }

        Image {
            id: password
            x: 49
            y: 143
            source: "UI_tab1_login_textinput.png"

        }

        Image {
            id: enter
            x: 162
            y: 234
            source: "UI_Enter_Btn.png"
            anchors.centerIn: parent

            MouseArea {
                id: enterMouse
                anchors.fill: parent
                onPressed: page.state = 'enterActive'
                onReleased: page.state = 'profileState'
        }
        }

        TextInput {
            id: passwordInput
            x: 67
            y: 158
            width: 342
            height: 46
            text: qsTr("Password");
            cursorVisible: false
            font.pointSize: 16
            horizontalAlignment: TextInput.AlignLeft
            echoMode: TextInput.Password

        }

        TextInput {
            id: name
            x: 67
            y: 74
            width: 342
            height: 47
            text: qsTr("Username")
            cursorVisible: true
            font.pointSize: 16
            horizontalAlignment: TextInput.AlignLeft
            transformOrigin: Item.Center
        }

        Text {
            id: or
            x: 229
            y: 321
            color: "#000000"
            text: qsTr("OR")
        }

        Image {
            id: finger
            source: "UI_fingerprint_Btn.png"
            x: 166
            y: 343
            MouseArea {
                id: fingerMouse
                anchors.fill: parent
                onPressed: page.state = 'fingerActive'
                onReleased: page.state = 'base state'
            }
        }

    }

    Image {
        id: navBar
        x: 0
        y: 689
        source: "UI_NavBar.png"
        anchors.bottom: page.bottom
        anchors.left: page.left
        visible: true

        Text {
            id: device
            x: 146
            y: 32
            width: 64
            height: 22
            color: "#ffffff"
            text: qsTr("Devices")
            font.pointSize: 16
        }
    }

    Image {
        id: leftArrow
        x: 30
        y: 709
        source: "UI_NavBar_Left_Btn.png"
        visible: true
        MouseArea {
            id: leftArrowMouse
            anchors.fill: parent
            onPressed: page.state = 'arrowActive'
            onReleased: page.state = 'base state'
        }
    }

    Image {
        id: heartMonitor
        x: 236
        y: 709
        width: 60
        height: 51
        source: "UI_NavBar_BlPressure_Btn.png"
        visible: true
        MouseArea {
            id: heartMonitorMouse
            anchors.fill: parent
            onPressed: page.state = 'heartActive'
            //Except this will not be clickable, instead will have to read when this sensor is connected, then switch states
            onReleased: page.state = 'base state'
        }
    }

    Image {
        id: tempMonitor
        x: 334
        y: 709
        width: 28
        height: 51
        source: "UI_NavBar_Temp_Btn.png"
        visible: true
        MouseArea {
            id: tempMouse
            anchors.fill: parent
            //Except this will not be clickable, instead will have to read when this sensor is connected, then switch states
            onPressed: page.state = 'tempActive'
            onReleased: page.state = 'base state'
        }
    }
    Image {
        id: weightMonitor
        x: 402
        y: 709
        width: 60
        height: 51
        source: "UI_NavBar_Weight_Btn.png"
        visible: true
        MouseArea {
            id: weightMouse
            anchors.fill: parent
            //Except this will not be clickable, instead will have to read when this sensor is connected, then switch states
            onPressed: page.state = 'weightActive'
            onReleased: page.state = 'base state'
        }
    }

    Image {
        id: stethoMonitor
        x: 482
        y: 709
        width: 60
        height: 51
        source: "UI_NavBar_Stetho_Btn.png"
        visible: true
        MouseArea {
            id: stethoMouse
            anchors.fill: parent
            //Except this will not be clickable, instead will have to read when this sensor is connected, then switch states
            onPressed: page.state = 'stethoActive'
            onReleased: page.state = 'base state'
        }
    }

    Text {
        id: signalText
        x: 748
        y: 725
        color: "#ffffff"
        text: qsTr("Signal")
        font.pointSize: 16
        visible: true
    }

    Image {
        id: signal
        x: 818
        y: 705
        width: 64
        height: 59
        source: "UI_NavBar_Signal0_Btn.png"
        visible: true
    }
    Image {
        id: battery
        x: 610
        y: 712
        width: 100
        height: 46
        source: "UI_NavBar_Battery5_Btn.png"
        visible: true
    }
    Image {
        id: profileBack
        x: 198
        y: 85
        visible: false
        source: "UI_Tab2_Profile_back.png"
        Text {
            id: newPatient
            x: 50
            y: 48
            width: 125
            height: 26
            text: qsTr("New Patient")
            font.pointSize: 22
            opacity: 1
        }
        Image {
            id: profileNameInput
            x: 37
            y: 81
            width: 353
            height: 57
            source: "UI_Profile_TextInsert.png"
            opacity: 1
        }
        Image {
            id: villageInput
            source: "UI_Profile_TextInsert.png"
            opacity: 1
            x: 37
            y: 144
        }
        Image {
            id: genderSelection
            x: 37
            y: 222
            width: 138
            height: 63
            opacity: 1
            source: "UI_Profile_Gender_Btn.png"

            MouseArea {
                id: maleSelect
                width: 69
                height: 63
                onClicked: page.state = 'maleSelected'
            }

            MouseArea {
                id: femaleSelect
                width: 69
                height: 63
                anchors.top: parent.top
                anchors.left: maleSelect.right
                onClicked: page.state = 'femaleSelected'
            }
        }
        Text {
            id: notes
            x: 583
            y: 55
            width: 61
            height: 26
            text: qsTr("Notes")
            font.pointSize: 22
            opacity: 1
        }
        Image {
            id: genderFemaleSelected
            x: 103
            y: 223
            width: 72
            height: 63
            opacity: 1
            source: "UI_Profile_Gender_Active_Btn.png"
        }
        Image {
            id: genderMaleSelected
            x: 39
            y: 223
            width: 72
            height: 63
            source: "UI_Profile_Gender_Active_Btn.png"
        }

        Image {
            id: male
            x: 59
            y: 238
            width: 32
            height: 32
            opacity: 1
            source: "UI_Profile_Gender_Male.png"
        }

        Image {
            id: female
            x: 128
            y: 235
            width: 22
            height: 37
            opacity: 1
            source: "UI_Profile_Gender_Female.png"
        }

        Image {
            id: diabeticCheck
            x: 77
            y: 435
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: diabeticMouse
                anchors.fill: parent
                onClicked: page.state = 'diabeticActive'
            }

        }

        Image {
            id: asthmaticCheck
            x: 77
            y: 475
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: asthmaticMouse
                anchors.fill: parent
                onClicked: page.state = 'asthmaticActive'
            }
        }

        Image {
            id: typhoidCheck
            x: 77
            y: 515
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: typhoidMouse
                anchors.fill: parent
                onClicked: page.state = 'typhoidActive'
            }
        }
        Image {
            id: peanutAllergyCheck
            x: 227
            y: 435
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: peanutAllergy
                anchors.fill: parent
                onClicked: page.state = 'peanutAllergyActive'
            }
        }
        Image {
            id: hepatitisACheck
            x: 227
            y: 475
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: hepatitisAMouse
                anchors.fill: parent
                onClicked: page.state = 'hepatitisAActive'
            }
        }
        Image {
            id: hepatitisBCheck
            x: 227
            y: 515
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: hepatitisBMouse
                anchors.fill: parent
                onClicked: page.state = 'hepatitisBActive'
            }
        }
        Image {
            id: rabiesCheck
            x: 377
            y: 435
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: rabiesMouse
                anchors.fill: parent
                onClicked: page.state = 'rabiesActive'
            }
        }
        Image {
            id: malariaCheck
            x: 377
            y: 475
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: malariaMouse
                anchors.fill: parent
                onClicked: page.state = 'malariaActive'
            }
        }
        Image {
            id: yellowFeverCheck
            x: 377
            y: 515
            source: "UI_Profile_ConditionsSelect.png"
            MouseArea {
                id: yellowFeverMouse
                anchors.fill: parent
                onClicked: page.state = 'yellowFeverActive'
            }
        }

        Text {
            id: diabetesText
            anchors.left: diabeticCheck.right
            anchors.verticalCenter: diabeticCheck.verticalCenter
            text: qsTr("Diabetes")
            font.pixelSize: 12
        }

        Text {
            id: asthmaticText
            anchors.left: asthmaticCheck.right
            anchors.verticalCenter: asthmaticCheck.verticalCenter
            text: qsTr("Asthmatic")
            font.pixelSize: 12
        }

        Text {
            id: typhoidText
            anchors.verticalCenter: typhoidCheck.verticalCenter
            anchors.left: typhoidCheck.right
            text: qsTr("Typhoid")
            font.pixelSize: 12
        }

        Text {
            id: peanutAllergyText
            anchors.left: peanutAllergyCheck.right
            anchors.verticalCenter: peanutAllergyCheck.verticalCenter
            text: qsTr("Peanut Allergy")
            font.pixelSize: 12
        }

        Text {
            id: hepatitisAText
            anchors.left: hepatitisACheck.right
            anchors.verticalCenter: hepatitisACheck.verticalCenter
            text: qsTr("Hepatitis A")
            font.pixelSize: 12
        }

        Text {
            id: hepatitisBText
            anchors.left: hepatitisBCheck.right
            anchors.verticalCenter: hepatitisBCheck.verticalCenter
            text: qsTr("Hepatitis B")
            font.pixelSize: 12
        }

        Text {
            id: rabiesText
            anchors.left: rabiesCheck.right
            anchors.verticalCenter: rabiesCheck.verticalCenter
            text: qsTr("Rabies")
            font.pixelSize: 12
        }

        Text {
            id: malariaText
            anchors.left: malariaCheck.right
            anchors.verticalCenter: malariaCheck.verticalCenter
            text: qsTr("Malaria")
            font.pixelSize: 12
        }

        Text {
            id: yellowFeverText
            anchors.left: yellowFeverCheck.right
            anchors.verticalCenter: yellowFeverCheck.verticalCenter
            text: qsTr("Yellow Fever")
            font.pixelSize: 12
        }

    }

    Image {
        id: fingerProfile
        x: 44
        y: 276
        width: 130
        height: 118
        source: "UI_fingerprint_Btn.png"
        visible: false
        MouseArea {
            id: fingerProfileMouse
            anchors.fill: parent
            onPressed: page.state = 'fingerProfileActive'
            onReleased: page.state = 'profileState'
        }
    }

    Image {
        id: cameraButton
        x: 44
        y: 130
        width: 130
        height: 118
        visible: false
        source: "UI_Profile_Photo_Btn.png"
        MouseArea {
            id: cameraButtonMouse
            anchors.fill: parent
            onPressed: page.state = 'cameraButtonActive'
            onReleased: page.state = 'profileState'
        }
    }




    states:
        [
        State {
            name: "enterActive"
            PropertyChanges {
                target: enter
                source: "UI_Enter_Active_Btn.png"
            }
        },
        State {
            name: "fingerActive"
            PropertyChanges {
                target: finger
                x: 160
                y: 335
                source: "UI_fingerprint_Active_Btn.png"
            }
        },
        State {
            name: 'profileState'
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: finger
                visible: false
            }
            PropertyChanges {
                target: enter
                visible: false
            }
            PropertyChanges {
                target: or
                visible: false
            }
            PropertyChanges {
                target: userNameInput
                visible: false
            }
            PropertyChanges {
                target: password
                visible: false
            }
            PropertyChanges {
                target: name
                visible: false
            }
            PropertyChanges {
                target: passwordInput
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }

            PropertyChanges {
                target: cameraButtonMouse
                enabled: true
            }
            PropertyChanges {
                target: genderFemaleSelected
                visible: true
            }
            PropertyChanges {
                target: genderMaleSelected
                visible: false
            }

            PropertyChanges {
                target: text1
                x: 106
                y: 440
                text: qsTr("Diabetic")
                opacity: 1
            }

            PropertyChanges {
                target: text2
                x: 106
                y: 480
                text: qsTr("Asthmatic")
                opacity: 1
            }

            PropertyChanges {
                target: text3
                x: 106
                y: 520
                text: qsTr("Typhoid")
                opacity: 1
            }

            PropertyChanges {
                target: text4
                x: 256
                y: 440
                text: qsTr("Peanut Allergy")
                opacity: 1
            }

            PropertyChanges {
                target: text5
                x: 256
                y: 480
                text: qsTr("Hepatits A")
                opacity: 1
            }

            PropertyChanges {
                target: text6
                x: 256
                y: 520
                text: qsTr("Hepatitis B")
                opacity: 1
            }

            PropertyChanges {
                target: text7
                x: 406
                y: 440
                text: qsTr("Rabies")
                opacity: 1
            }

            PropertyChanges {
                target: text8
                x: 406
                y: 480
                text: qsTr("Malaria")
                opacity: 1
            }

            PropertyChanges {
                target: text9
                x: 406
                y: 520
                text: qsTr("Yellow Fever")
                opacity: 1
            }


        },
        State {
            name: 'fingerProfileActive'
            PropertyChanges {
                target: fingerProfile
                x: 37
                y: 266
                width: 140
                height: 132
                visible: true
                source: "UI_fingerprint_Active_Btn.png"
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: genderFemaleSelected
                visible: true
            }
        },
        State {
            name: 'cameraButtonActive'
            PropertyChanges {
                target: cameraButton
                visible: true
                source: "UI_Profile_Photo_Active_Btn.png"
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: genderFemaleSelected
                visible: true
            }
            PropertyChanges {
                target: genderMaleSelected
                visible: false
            }
        },
        State {
            name: 'arrowActive'
            PropertyChanges {
                target: leftArrow
                source: "UI_NavBar_Left_Active_Btn.png"
            }
        },
        State {
            name: 'heartActive'
            PropertyChanges {
                target: heartMonitor
                source: "UI_NavBar_BlPressure_Active_Btn.png"
            }
        },
        State {
            name: 'tempActive'
            PropertyChanges {
                target: tempMonitor
                source: "UI_NavBar_Temp_Active_Btn.png"
            }
        },
        State {
            name: 'weightActive'
            PropertyChanges {
                target: weightMonitor
                source: "UI_NavBar_Weight_Active_Btn.png"
            }
        },
        State {
            name: 'stethoActive'
            PropertyChanges {
                target: stethoMonitor
                source: "UI_NavBar_Stetho_Active_Btn.png"
            }
        },
        State {
            name: 'femaleSelected'
            PropertyChanges {
                target: genderFemaleSelected
                visible: true
            }
            PropertyChanges {
                target: genderMaleSelected
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'maleSelected'
            PropertyChanges {
                target: genderMaleSelected
                visible: true
            }
            PropertyChanges {
                target: genderFemaleSelected
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
        },
        State {
            name: 'diabeticActive'
            PropertyChanges {
                target: diabeticCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'asthmaticActive'
            PropertyChanges {
                target: asthmaticCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'typhoidActive'
            PropertyChanges {
                target: typhoidCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'peanutAllergyActive'
            PropertyChanges {
                target: peanutAllergyCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'hepatitisAActive'
            PropertyChanges {
                target: hepatitisACheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'hepatitisBActive'
            PropertyChanges {
                target: hepatitisBCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'rabiesActive'
            PropertyChanges {
                target: rabiesCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'malariaActive'
            PropertyChanges {
                target: malariaCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        },
        State {
            name: 'yellowFeverActive'
            PropertyChanges {
                target: yellowFeverCheck
                source: "UI_Profile_ConditionsSelected_Active.png"
            }
            PropertyChanges {
                target: loginBack
                visible: false
            }
            PropertyChanges {
                target: backTabs
                source: "UI_Tab2_tabs.jpg"
            }

            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: profileBack
                visible: true
            }
            PropertyChanges {
                target: fingerProfile
                visible: true
            }
            PropertyChanges {
                target: cameraButton
                visible: true
            }
        }

    ]
}

