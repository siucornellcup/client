import QtQuick 1.1

Image {
    id: backTabs
    source: "images/tabs/UI_Tab1_tabs.jpg"
    anchors.fill: parent

    Tabtext {text: "Nurse"; x: 49; y: 25}

    Tabtext {text: "Profile"; x: 251; y: 25}

    Tabtext {text: "Vitals"; x: 470; y: 25}

    Tabtext {text: "Symptoms"; x: 670; y: 25}

    Tabtext {text: "Diagnosis"; x: 870; y: 25}

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
        onClicked: page.state = "symptomsTab"
    }

    MouseArea {
        id: diagnosisTabMouse
        x: 827
        y: 8
        width: 189
        height: 60
        onClicked: page.state = "diagnosisTab"
    }

    MouseArea {
        id: nurseTabMouse
        x: 0
        y: 8
        width: 197
        height: 60
        onClicked: page.state = "nursePortal"
    }
}

