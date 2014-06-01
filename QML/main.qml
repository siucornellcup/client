/*
Z precedence:
Keyboard 100
Navbar 99
Tabs 99
*/

import QtQuick 1.0
import 'colibri'

    Rectangle {
        id: page
        width: 1024
        height: 768
        state: 'login'
        BorderImage {
            id: background
            source: "images/UI_BackgroundColor.jpg"
            anchors.fill: parent
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5

        }
        NavBar {
            id: navbar
            z: 99
        }

        TopTabs {
            //Z is 0 even though precedence should be 99 because the tab image covers the entire screen
            id: backTabs
            z: 0
        }
 
        PatientTab {
            id: patientsTab
            z: 0
            visible: false
        }
        VitalsTab {
            id: vitalsTab
            z: 0
            visible: false
        }

        SymptomsTab {
            id: symptomsTab
            z: 0
        }

        DiagnosisTab {
            id: diagnosisTab
            z: 0
        }

        Messages {
            id: messages
            visible: false
            z: 100
        }
            Item {
                id: nursePortalItem
                opacity: 0
                Image {
                    id: nursePortalPatient
                    //image width is 243
                    x: 122
                    y: 260
                    visible: false
                    source: "images/nurseportal/UI_NursePortal_Patient_Btn.png"
                    MouseArea {
                        id: nursePortalPatientMouse
                        anchors.fill: parent
                        onPressed: nursePortalPatient.source = "images/nurseportal/UI_NursePortal_Patient_Active_Btn.png"
                        onReleased: nursePortalPatient.source = "images/nurseportal/UI_NursePortal_Patient_Btn.png"
                        onClicked: page.state = 'patientsTab'
                    }
                }
                Image {
                    id: nursePortalCalendar
                    //image width is 243
                    x: 425
                    y: 260
                    visible: false
                    source: "images/nurseportal/UI_NursePortal_Calendar_Btn.png"
                    MouseArea {
                        id: nursePortalCalendarMouse
                        anchors.fill: parent
                        onPressed: nursePortalCalendar.source = "images/nurseportal/UI_NursePortal_Calendar_Active_Btn.png"
                        onReleased: nursePortalCalendar.source = "images/nurseportal/UI_NursePortal_Calendar_Btn.png"
                        onClicked: page.state = 'calendarState'
                    }
                }
                Text{
                    text: "Log Off"
                    color: 'orange'
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    
                }

                Image {
                    id: nursePortalMail
                    //image width is 243
                    x: 728
                    y: 260
                    visible: false
                    source: "images/nurseportal/UI_NursePortal_Mail_Btn.png"
                    MouseArea {
                        id: nursePortalMailMouse
                        anchors.fill: parent
                        onPressed: nursePortalMail.source = "images/nurseportal/UI_NursePortal_Mail_Active_Btn.png"
                        onReleased: nursePortalMail.source = "images/nurseportal/UI_NursePortal_Mail_Btn.png"
                        onClicked: page.state = 'messagesState'
                    }
            }
            }
            Image {
                id: logo
                anchors.centerIn: parent
                source: 'images/logos/Blue/vertical_black.png'
                opacity: 0
            }
         
//LOGIN
        Image {
            id:loginBack
            source: "images/tabs/UI_Tab1_login_back.png"
            anchors.centerIn: parent
            visible: false
            
            Textfield {
                id: userNameInput
                x: 60
                y: 75
                width: 375
                text: "Name"
            }

            Textfield {
                id: passwordInput
                x: 60
                y: 143
                z: 50
                width: 375 
                echoMode: TextInput.Password
                text: "Password"
            }


            Image {
                id: enter
                x: 162
                y: 234
                source: "images/UI_Enter_Btn.png"
                anchors.centerIn: parent

                MouseArea {
                    id: enterMouse
                    anchors.fill: parent
                    onPressed: enter.source = "images/UI_Enter_Active_Btn.png"
                    onReleased: enter.source = "images/UI_Enter_Btn.png"
                    onClicked: {
                                 nurse.userpass_login(userNameInput.text)
                                 page.state = 'nursePortal'
                    }
                }
            }
            Text {
                id: or
                x: 229
                y: 321
                color: "#000000"
                text: qsTr("OR")
                font.family:"DroidSans"
            }

            Image {
                id: finger
                source: "images/UI_fingerprint_Btn.png"
                x: 166
                y: 343
                MouseArea {
                    id: fingerMouse
                    anchors.fill: parent

                    onPressed: finger.source = "images/UI_fingerprint_Active_Btn.png"
                    onReleased: finger.source = "images/UI_fingerprint_Btn.png"
                    onClicked: {nurse.fp_login("00372a6fb1a467b54992df4daf0dfa49")
                                page.state = 'nursePortal'
                                userNameInput.text = nurse.n_name}
                }
            }

        }


        Image {
            id: profileBack
            x: 198
            y: 85
            visible: false
            source: "images/tabs/UI_Tab2_Profile_back.png"
            Text {
                id: newPatient
                x: 50
                y: 48
                width: 125
                height: 26
                text: qsTr("New Patient")
                font.pointSize: 22
                font.family:"DroidSans"
                opacity: 1
            }

            Textfield {
                id: firstNameInput
                x: 37
                y: 81
                width: 200
                text: "First Name"
                z:100
            }

            Textfield {
                id: lastNameInput
                anchors.left: firstNameInput.right 
                x: 90
                y: 81
                width: 200
                text: "Last Name"
                z: 99
            }

            Textfield {
                id: villageInput
                text: "Village"
                x: 37
                y: 144
                width: 353
                height: 57
            }

            GenderSelect {id: genderSelector
                          z: 50}

            Text {
                id: notes
                x: 583
                y: 55
                width: 61
                height: 26
                text: qsTr("Notes")
                font.family:"DroidSans"
                font.pointSize: 22
                opacity: 1
            }


            Checkbox {text: "Asthma"; y:475; x:77}

            Checkbox {text: "Typhoid"; x: 77; y:515}

            Checkbox {text: "Medication Allergy"; x: 227; y: 435}

            Checkbox {text: "Hepatitus A"; x: 227; y: 475}

            Checkbox {text: "Hepatitus B"; x: 227; y: 515}

            Checkbox {text: "Peanut Allergy"; x: 377; y: 435}

            Checkbox {text: "Malaria"; x: 377; y: 475}

            Checkbox {text: "Yellow Fever"; x: 377; y: 515}

            Checkbox {text: "Diabetes"; x: 77; y: 435}
//ETHNICITY DROP DOWN
    Image {
        id: ethnicityDrop
        source: "images/profile/UI_Profile_Ethnicity_Closed.png"
        x: 250
        y: 234
        Text {
            id: ethnicityText
            text: qsTr('Ethnicity')
            font.pointSize: 16
            x: 15
            y: 12
        }

        MouseArea {
            id: ethnicityMouse
            anchors.fill: parent
            onClicked: ethnicityDrop.state == 'ethnicityOpen' ? ethnicityDrop.state = 'ethnicityClosed' : ethnicityDrop.state = 'ethnicityOpen'
        }
        states: [
            State {
                name: 'ethnicityOpen'
                PropertyChanges {
                    target: ethnicityDrop
                    source: 'images/profile/UI_Profile_Ethnicity_Dropdown.png'
                    z: 3
                }
                PropertyChanges {
                    target: ethnicityOver
                    visible: true
                }
            },
            State {
                name: 'ethnicityClosed'
                PropertyChanges {
                    target: ethnicityDrop
                    source: "images/profile/UI_Profile_Ethnicity_Closed.png"
                    z: 1
                }
                PropertyChanges {
                    target: ethnicityOver
                    visible: false
                }
            }

        ]
        Item {
            id: ethnicityOver
            visible: false
            Image {
                source: 'images/profile/UI_Profile_Ethnicity_Dropdown_Overlap.png'
                y: 80
                x: 3
            }
            Text {
                text: qsTr('White'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                height: 20
                width: 157
                y: 40
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ethnicityDrop.state = 'ethnicityClosed'
                        ethnicityText.text = qsTr('White')
                    }
                }
            }
            Text {
                text: qsTr('Black'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                height: 20
                width: 157
                y: 60
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ethnicityDrop.state = 'ethnicityClosed'
                        ethnicityText.text = qsTr('Black')
                    }
                }
            }
            Text {
                text: qsTr('American Indian'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                height: 20
                width: 157
                y: 80
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ethnicityDrop.state = 'ethnicityClosed'
                        ethnicityText.text = qsTr('American Indian')
                    }
                }
            }
            Text {
                text: qsTr('Chinese'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                height: 20
                width: 157
                y: 105
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ethnicityDrop.state = 'ethnicityClosed'
                        ethnicityText.text = qsTr('Chinese')
                    }
                }
            }
            Text {
                text: qsTr('Asain Indian'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                height: 20
                width: 157
                y: 130
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ethnicityDrop.state = 'ethnicityClosed'
                        ethnicityText.text = qsTr('Asain Indian')
                    }
                }
            }
        }
    }

//MONTH DROPDOWN
    Image {
        id: monthDrop
        x: 50
        y: 324
        source: "images/profile/UI_Profile_MonYearDropdown_Closed.png"

        MouseArea {
            id: monthMouse
            anchors.fill: parent
            onClicked: monthDrop.state == 'monthDropOpen' ? monthDrop.state = 'monthDropClosed' : monthDrop.state = 'monthDropOpen'
            }
        Text {
            id: monthText
            text: qsTr('Month')
            font.pointSize: 16
            x: 15
            y: 12
            height: 20
            width: 125
        }

        states:
            [
            State {
                name: 'monthDropOpen'
                PropertyChanges {
                    target: monthItem
                    visible: true
                }
                PropertyChanges {
                    target: monthDrop
                    source: 'images/profile/UI_Profile_MonYearDropdown.png'
                }
                PropertyChanges {
                    target: monthItemText
                    visible: true
                }
            },
            State {
                name: 'monthDropClosed'
                PropertyChanges {
                    target: monthItem
                    visible: false
                }
                PropertyChanges {
                    target: monthDrop
                    source: 'images/profile/UI_Profile_MonYearDropdown_Closed.png'
                }
                PropertyChanges {
                    target: monthItemText
                    visible: false
                }
            }

        ]
        }
    Item {
        id: monthItem
        visible: false
        Image {
            id: monthDrop1
            x: 53
            y: 467
            source:"images/profile/UI_Profile_MonYearDropdownOverlap.png"
        }
        Image {
            id: monthDrop2
            x: 53
            y: 493
            source: "images/profile/UI_Profile_MonYearDropdownOverlap.png"
        }
        Image {
            id: monthDrop3
            x: 53
            y: 575
            source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
        }
    }
    Item {
        id: monthItemText
        visible: false
        Text {
            text: qsTr('January'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 365
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('January'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('February'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 392
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('February'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('March'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 418
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('March'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('April'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 445
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('April'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('May'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 472
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('May'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('June'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 497
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('June'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('July'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 524
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('July'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('August'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 551
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('August'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('September'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 578
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('September'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('October'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 605
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('October'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('November'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 632
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('November'); monthDrop.state = 'monthDropClosed'}
            }
        }
        Text {
            text: qsTr('December'); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            x: 53
            y: 659
            width: 125
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {monthText.text = qsTr('December'); monthDrop.state = 'monthDropClosed'}
            }
        }
    }

            Image {
                id: dayDrop
                x: 214
                y: 324
                source: "images/profile/UI_Profile_DayDropdown_Closed.png"
                MouseArea {
                    id: dayDropMouse
                    anchors.fill: parent
                    onClicked: dayDrop.source = "images/profile/UI_Profile_DayDropdown.png"
                }
                Text {
                    anchors.fill: parent
                    anchors.rightMargin: 12
                    text: "Day"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "DroidSans"
                    font.pointSize: 12
                }            
            }

    MouseArea {
        x: 347
        y: 324
        height: yearDrop.height
        width: yearDrop.width
        onClicked: yearDrop.state == 'yearDropOpen' ? yearDrop.state = 'yearDropClosed' : yearDrop.state = 'yearDropOpen'
    }
    Image {
        id: hiddenYearDrop
        source: 'images/profile/UI_Profile_MonYearDropdown_Closed.png'
        x: 347
        y: 324
        Text {
            id: hiddenYearText
            text: qsTr('Year')
            x: 15
            y: 12
            font.pointSize: 16
        }
    }
    Flickable {
        id: yearFlick
        x: 347
        y: 324
        height: yearDrop.height
        width: yearDrop.width
        contentHeight: yearDrop.height*17
        flickableDirection: Flickable.VerticalFlick
        enabled: false
        z: 2
        Image {
            id: yearDrop
            source: "images/profile/UI_Profile_MonYearDropdown_Closed.png"


            Text {
                id: yearText
                text: qsTr('Year')
                x: 15
                y: 12
                font.pointSize: 16
            }
            MouseArea {
                id: yearDropMouse
                width: yearDrop.width
                height: yearDrop.height
                onClicked: {
                    yearDrop.state == 'yearDropOpen' ? yearDrop.state = 'yearDropClosed' : yearDrop.state = 'yearDropOpen'
                }
            }
            states:
                [
                State {
                    name: 'yearDropOpen'
                    PropertyChanges {
                        target: yearDrop
                        source: "images/profile/UI_Profile_MonYearDropdown.png"
                    }
                    PropertyChanges {
                        target: yearItem
                        visible: true
                    }
                    PropertyChanges {
                        target: yearFlick
                        enabled: true
                        height: yearDrop.height
                        z: 2
                    }
                    PropertyChanges {
                        target: yearDropMouse
                        height: yearDrop.height*20
                    }
                    PropertyChanges {
                        target: yearColumn
                        visible: true
                    }
                    PropertyChanges {
                        target: hiddenYearDrop
                        visible: false
                    }
                },
                State {
                    name: 'yearDropClosed'
                    PropertyChanges {
                        target: yearDrop
                        visible: false
                    }
                    PropertyChanges {
                        target: yearItem
                        visible: false
                    }
                    PropertyChanges {
                        target: yearFlick
                        enabled: false
                        height: yearDrop.height
                        z: 1
                    }
                    PropertyChanges {
                        target: yearDropMouse
                        height: yearDrop.height
                    }
                    PropertyChanges {
                        target: yearColumn
                        visible: false
                    }
                    PropertyChanges {
                        target: hiddenYearDrop
                        visible: true
                    }
                }

            ]

        }
        Item {
            id: yearItem
            visible: false
            x: 3

            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 143
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 245
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 347
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 449
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 551
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 653
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 755
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 857
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 959
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1061
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1163
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1265
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1367
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1469
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1571
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1673
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1775
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1877
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 1979
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2081
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2183
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2285
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2387
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2489
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2591
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2693
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2795
            }
            Image {
                source: 'images/profile/UI_Profile_MonYearDropdownOverlap.png'
                y: 2897
            }
        }
        Column {
            id: yearColumn
            spacing: 10
            x: 42.5
            y: 42.5
            visible: false
            Repeater {
                model: 115
                Text {
                    text: (2014 - model.index); verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {yearDrop.state = 'yearDropClosed'; hiddenYearText.text = (2014 - model.index)}
                    }
                }
            }
        }
}


//PATIENT PAGE SAVE BUTTON
            Button {
                id:saveButton
                x: 630
                y: 470

                function clickHandler() {
                    patient.p_first_name = firstNameInput.text
                    patient.p_last_name = lastNameInput.text
                    patient.p_village = villageInput.text
                    patient.p_gender = genderSelector.gender
                    patient.create_record()
                    patient.load
                    patientListModel.update()
                    page.state = 'vitalsTab'
                }

                Component.onCompleted: {
                    saveButton.clicked.connect(clickHandler)
                }
            }
        }

        Image {
            id: fingerProfile
            x: 44
            y: 276
            width: 130
            height: 118
            source: "images/UI_fingerprint_Btn.png"
            visible: false
            MouseArea {
                id: fingerProfileMouse
                anchors.fill: parent
                onPressed: parent.source = "images/UI_fingerprint_Active_Btn.png"
                onReleased: parent.source = "images/UI_fingerprint_Btn.png"
                onClicked: patient.create_patient_fp()
            }
        }

        Image {
            id: cameraButton
            x: 44
            y: 130
            width: 130
            height: 118
            visible: false
            source: "images/profile/UI_Profile_Photo_Btn.png"
            MouseArea {
                id: cameraButtonMouse
                anchors.fill: parent
                onPressed: parent.source = "images/profile/UI_Profile_Photo_Active_Btn.png"
                onReleased: parent.source = "images/profile/UI_Profile_Photo_Btn.png"
                onClicked: patient.p_photo_id = 'test_img.jpg'
            }
        }

        Image {
            id: calendarBack
            anchors.centerIn: parent
            visible: false
            source: "images/calendar/UI_Calendar_back.png"

            Text {
                id: calendarText
                x: 60
                y: 50
                text: qsTr("Calendar")
                font.pointSize: 19
            }

            Text {
                id: upcomingText
                x: 785
                y: 58
                text: qsTr("Upcoming")
                font.pointSize: 22
            }
        }

//STATES
        states: [
            State {
                name: 'login'
                PropertyChanges{
                    target: loginBack
                    visible: true
                }
            },
            State {
                name: 'patientsTab'
                PropertyChanges{
                    target: loginBack
                    visible: false
                    z: 0
                }
                PropertyChanges{
                    target: patientsTab
                    visible: true
                    z: 1
                }
            },            
            State {
                name: 'profileState'
                PropertyChanges {
                    target: backTabs
                    anchors.rightMargin: -6
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 6
                    anchors.topMargin: 0
                    source: "images/tabs/UI_Tab2_tabs.jpg"
                }
                PropertyChanges{
                    target: loginBack
                    visible: false
                }
                PropertyChanges{
                    target: patientsTab
                    visible: false
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
                    target: calendarBack
                    x: 27
                    y: 96
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 4
                }
            },
            State{
                name: 'messagesState'
                PropertyChanges {
                    target: messages
                    visible: true
                }
            },
            State {
                name: 'vitalsTab'
                PropertyChanges{
                    target: backTabs
                    source: "images/tab_vitals/UI_Tab3_tabs.jpg"
                }
                PropertyChanges {
                    target: vitalsTab
                    anchors.bottomMargin: 63
                    visible: true
                    z: 1
                }
                PropertyChanges{
                    target: backTabs
                    anchors.topMargin: 0
                    visible: true
                    z: 0
                }
                PropertyChanges {
                    target: loginBack
                    visible: false
                }
                PropertyChanges {
                    target: diagnosisTab
                    visible: false
                }
            },
            State {
                name: 'symptomsTab'
                PropertyChanges {
                    target: symptomsTab
                    visible: true
                    z: 50
                }
                PropertyChanges {
                    target: vitalsTab
                    anchors.bottomMargin: 63
                    visible: false
                    z: 0
                }
                PropertyChanges{
                    target: backTabs
                    anchors.topMargin: 0
                    visible: true
                    source: 'images/tab_symptoms/UI_Tab4_tabs.jpg'
                    z: 0
                }
                PropertyChanges {
                    target: loginBack
                    visible: false
                }
                PropertyChanges {
                    target: diagnosisTab
                    visible: false
                }
            },
            State {
                name: 'diagnosisTab'
                PropertyChanges {
                    target: vitalsTab
                    visible: false
                }
                PropertyChanges{
                    target: backTabs
                    anchors.topMargin: 0
                    visible: true
                    source: 'images/tab_diagnosis/UI_Tab5_tabs.jpg'
                }
                PropertyChanges {
                    target: loginBack
                    visible: false
                }
                PropertyChanges {
                    target: diagnosisTab
                    visible: true
                    z: 1
                }
            },

            State {
                name: 'nursePortal'
                PropertyChanges {
                    target: loginBack
                    visible: false
                }
                PropertyChanges {
                    target: nursePortalPatient
                    visible: true
                }
                PropertyChanges {
                    target: nursePortalCalendar
                    visible: true
                }
                PropertyChanges {
                    target: nursePortalMail
                    visible: true
                }
            },
            State {
                name: 'calendarState'
                PropertyChanges {
                    target: calendarBack
                    visible: true
                }
            }
        ]
        transitions: 
        Transition {
            from: "login"
            to: "nursePortal"
            SequentialAnimation {
                PropertyAnimation {
                    target: logo
                    properties: 'opacity'; from: 0; to: 1; easing.type: Easing.InQuint; duration: 1000
                }

            PropertyAnimation {
                target: logo
                properties: 'opacity'; from: 1.0; to: 0; easing.type: Easing.InQuint; duration: 1000
            }
            PropertyAnimation {
                target: nursePortalItem
                properties: 'opacity'; from: 0; to: 1; easing.type: Easing.Linear; duration: 1000
            }
            }

        }
    
}
