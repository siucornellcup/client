import QtQuick 1.0

    Image {
        id: patientPageBack
        anchors.centerIn: parent
        visible: false
        source: 'images/patientpage/UI_PatientPage_back.png'

    Rectangle{
        id: patientListBoundingBox
        color: 'transparent'
        z: 100
        opacity: 0.75
        anchors.fill: parent
        anchors.rightMargin: 270
        anchors.topMargin: 100
        anchors.leftMargin: 25
        anchors.bottomMargin: 100

    GridView{
        id: patientListView
        clip: true
        anchors.fill: parent
        anchors.topMargin: 30
        width: parent.width
        height: parent.height
        cellWidth: 150
        cellHeight: 150
        snapMode: GridView.SnapOneRow
        flow: GridView.TopToBottom
        model: patientListModel
        delegate: Component {
                Column {
                   Rectangle { 
                        id: patient_id_picture
                        color: 'orange'
                        width: 114
                        height: 100
                    }
                    Flow {
                        id: patient_name
                        spacing: 5
                        Text {
                            id: first_name
                            color: '#857c66'
                            font.family: 'DroidSans'
                            font.pointSize: 10
                            verticalAlignment: Text.AlignVCenter
                            text: model.patient.p_first_name
                        }
                        Text {
                            id: last_name
                            color: '#857c66'
                            font.family: 'DroidSans'
                            font.pointSize: 10
                            text: model.patient.p_last_name
                        }
                    }
                        Text {
                            id: village
                            color: '#58595b'
                            font.family: 'DroidSans'
                            font.pointSize: 10
                            text: model.patient.p_village
                        }
                    
                }
            }
            }        
   }
        Text {
            id: patientsText
            x: 62
            y: 31
            text: qsTr("Patients")
            font.family: 'DroidSans'
            font.pointSize: 16
            color: '#857c66'
        }
        Text {
            id: searchText
            x: 733
            y: 31
            text: qsTr("Search")
            font.family: 'DroidSans'
            color: '#857c66'
            font.pointSize: 16
        }

        Image {
            id: nameTextInput
            x: 733
            y: 61
            source: "images/patientpage/UI_PatientPage_TextInput.png"
            TextInput {
                id: nameTextInputInput
                x: 15
                y: 10
                width: 200
                text: qsTr("Name")
                color: '#857c66'
                font.family: 'DroidSans'
                visible: true
            }
        }

        Image {
            id: villageTextInput
            x: 733
            y: 100
            source: "images/patientpage/UI_PatientPage_TextInput.png"
            TextInput {
                id: villageTextInputInput
                x: 15
                y: 10
                width: 200
                text: qsTr("Village")
                font.family: 'DroidSans'
            }
        }

        Image {
            id: enterBtn
            x: 778
            y: 155
            source: "images/patientpage/UI_PatientPage_Enter_Btn.png"
            MouseArea {
                id: enterBtnMouse
                anchors.fill: parent
                onPressed: enterBtn.source = "images/patientpage/UI_PatientPage_Enter_Active_Btn.png"
                onReleased: enterBtn.source = "images/patientpage/UI_PatientPage_Enter_Btn.png"
            }
        }

        Text {
            id: orText
            x: 825
            y: 240
            text: qsTr("OR")
            font.family: 'DroidSans'
            font.pointSize: 28
        }

        Image {
            id: fingerPatient
            x: 780
            y: 290
            source: 'images/patientpage/UI_PatientPage_fingerprint_Btn.png'
            MouseArea {
                id: fingerPatientMouse
                anchors.fill: parent
                onPressed: fingerPatient.source = 'images/patientpage/UI_PatientPage_fingerprint_Active_Btn.png'
                onReleased: fingerPatient.source = 'images/patientpage/UI_PatientPage_fingerprint_Btn.png'
            }
        }

        Image {
            id: newPatientBtn
            x: 790
            y: 445
            source: 'images/patientpage/UI_PatientPage_New_Btn.png'
            MouseArea {
                id: newPatientBtnMouse
                anchors.fill: parent
                onPressed: newPatientBtn.source = 'images/patientpage/UI_PatientPage_New_Active_Btn.png'
                onReleased: newPatientBtn.source = 'images/patientpage/UI_PatientPage_New_Btn.png'
                onClicked: page.state = 'profileState'
            }
        }

        Image {
            id: sortByDrop
            y: 31
            x: 500
            source: 'images/patientpage/UI_PatientPage_DropDown_Closed.png'
            state: 'closed'
            MouseArea {
                id: sortByDropMouse
                anchors.fill: parent
                //onClicked: page.state == 'sortByOpen' ? page.state = 'sortByClosed' : page.state = 'sortByOpen';
            }
        }
    }
