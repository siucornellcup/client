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
                //z: 100
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
                    onClicked: {patient.p_first_name = firstNameInput.text
                                patient.p_last_name = lastNameInput.text
                                patient.p_village = villageInput.text
                                patient.p_gender = genderSelector.gender
                                patient.create_record()
                                patient.load
                                page.state = 'vitalsTab'
                                }
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
                    target: txt_villageInput
                    x: 50
                    y: 156
                    width: 331
                    height: 34
                    text: qsTr("Village")
                    font.family:"DroidSans"
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
    }
