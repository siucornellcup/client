import QtQuick 1.0

Item {
	id: tabTextContainer
	property alias text: tabText.text

    Text {
    id: tabText
    text: qsTr("Tab text")
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.pointSize: 15
    font.family:"DroidSans"
    color: "#404040"
	}


}