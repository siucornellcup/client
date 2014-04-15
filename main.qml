import QtQuick 1.0

    Rectangle {
        id: page
        width: 1024
        height: 768

        BorderImage {
            id: background
            source: "images/UI_BackgroundColor.jpg"
            anchors.fill: parent
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
        }

        NavBar {
            z: 100
        }

//TABS  
        VitalsTab {
            id: vitalsTab
        }

        TopTabs {
            id: backTabs
        }

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
                    onClicked: page.state = 'profileState'
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
                }
            }
         
//LOGIN
        Image {
            id:loginBack
            source: "images/tabs/UI_Tab1_login_back.png"
            anchors.centerIn: parent
            visible: true

            Image {
                id: userNameInput
                x: 49
                y: 59
                source: "images/tabs/UI_Tab1_login_textinput.png"


            }

            Image {
                id: password
                x: 49
                y: 143
                source: "images/tabs/UI_Tab1_login_textinput.png"

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
                                 nurse.userpass_login(name.text)
                                 page.state = 'nursePortal'
                    }
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
                font.family:"DroidSans"
                horizontalAlignment: TextInput.AlignLeft
                echoMode: TextInput.Password

            }

            TextInput {
                id: name
                x: 67
                y: 74
                width: 342
                height: 47
                text: qsTr("Name")
                cursorVisible: true
                font.pointSize: 16
                font.family:"DroidSans"
                horizontalAlignment: TextInput.AlignLeft
                transformOrigin: Item.Center
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
                                name.text = nurse.n_name}
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
            Image {
                id: profileNameInput
                x: 37
                y: 81
                width: 353
                height: 57
                source: "images/profile/UI_Profile_TextInsert.png"
              
                TextInput {
                    id: txt_profileNameInput
                    x: 13
                    y: 17
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.topMargin: 10
                    horizontalAlignment: TextInput.AlignLeft
                    transformOrigin: Item.Center
                    text: qsTr("Patient Name")
                    font.pointSize: 16
                }
            }
            Image {
                id: villageInput
                source: "images/profile/UI_Profile_TextInsert.png"
                x: 37
                y: 144
                width: 353
                height: 57

                TextInput {
                    id: txt_villageInput
                    anchors.fill: parent
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                    x: 13
                    y: 17
                    text: qsTr("Village")
                    font.pointSize: 16
                    horizontalAlignment: TextInput.AlignLeft
                    transformOrigin: Item.Center
                }
            }

            GenderSelect {id: genderSelector}

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


            Checkbox {text: "Asthma"; y:475; x:77}

            Checkbox {text: "Typhoid"; x: 77; y:515}

            Checkbox {text: "Medication Allergy"; x: 227; y: 435}

            Checkbox {text: "Hepatitus A"; x: 227; y: 475}

            Checkbox {text: "Hepatitus B"; x: 227; y: 515}

            Checkbox {text: "Peanut Allergy"; x: 377; y: 435}

            Checkbox {text: "Malaria"; x: 377; y: 475}

            Checkbox {text: "Yellow Fever"; x: 377; y: 515}

            Checkbox {text: "Diabetes"; x: 77; y: 435}

            EthnicityDropDown {}

            Image {
                id: monthDrop
                x: 50
                y: 324
                source: "images/profile/UI_Profile_MonYearDropdown_Closed.png"
                MouseArea {
                    id: monthMouse
                    anchors.fill: parent
                    onClicked: {
                        monthDrop.source = "images/profile/UI_Profile_MonYearDropdown.png"
                        //monthDrop.height = 176
                    }
                Text {
                    anchors.fill: parent
                    anchors.rightMargin: 12
                    text: "Month"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "DroidSans"
                    font.pointSize: 12
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
            Image {
                id: yearDrop
                x: 347
                y: 324
                source: "images/profile/UI_Profile_MonYearDropdown_Closed.png"
                MouseArea {
                    id: yearDropMouse
                    anchors.fill: parent
                    onClicked: yearDrop.source = "images/profile/UI_Profile_MonYearDropdown.png"
                }
                Text {
                    anchors.fill: parent
                    anchors.rightMargin: 12
                    text: "Year"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "DroidSans"
                    font.pointSize: 12
                }       
            }
//PATIENT PAGE SAVE BUTTON
            Image {
                id: saveButton
                x: 630
                y: 470
                source: "images/profile/UI_Profile_Save_Btn.png"
                MouseArea {
                    id: saveButtonMouse
                    anchors.fill: parent
                    onPressed: saveButton.source = "images/profile/UI_Profile_Save_Active_Btn.png"
                    onReleased: saveButton.source = "images/profile/UI_Profile_Save_Btn.png"
                    onClicked: {patient.p_name = txt_profileNameInput.text
                                patient.p_village = txt_villageInput.text
                                patient.p_gender = genderSelector.gender}
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
                name: 'profileState'
                PropertyChanges {
                    target: backTabs
                    anchors.rightMargin: -6
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 6
                    anchors.topMargin: 0
                    source: "images/tabs/UI_Tab2_tabs.jpg"
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
                    target: txt_villageInput
                    x: 50
                    y: 156
                    width: 331
                    height: 34
                    text: qsTr("Village")
                    visible: true
                    clip: false
                    selectionColor: "#2f8bc5"
                }

                PropertyChanges {
                    target: txt_profileNameInput
                    visible: true
                    clip: false
                    selectionColor: "#2f8bc5"
                }

                PropertyChanges {
                    target: calendarBack
                    x: 27
                    y: 96
                    anchors.verticalCenterOffset: 0
                    anchors.horizontalCenterOffset: 4
                }
            },
            State {
                name: 'vitalsTab'
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
    }
