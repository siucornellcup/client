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

