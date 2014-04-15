import QtQuick 1.1

Image {
    id: backTabs
    source: "images/tabs/UI_Tab1_tabs.jpg"
    anchors.fill: parent

    Tabtext {text: "Nurse"; x: 49; y: 17}

    Tabtext {text: "Profile"; x: 251; y: 17}

    Tabtext {text: "Vitals"; x: 467; y: 17}

    Tabtext {text: "Symptoms"; x: 631; y: 17}

    Tabtext {text: "Diagnosis"; x: 837; y: 17}

    MouseArea {
        id: profileTabMouse
        x: 203
        y: 8
        width: 201
        height: 60
        onClicked: page.state = "profileState"
    }

    MouseArea {
        id: vitalsTabMouse
        x: 410
        y: 8
        width: 202
        height: 60
        onClicked: page.state = "vitalsTab"
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
        onClicked: page.state = "nursePortal"
    }
//DASHBOARD (nursePortal)
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
}
