import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    width: 400
    height: 250
    visible: true
    title: "Hello Qt6 Quick"
    Material.theme: Material.Light

    Text {
        text: "Hello, Qt6 Quick!"
        anchors.centerIn: parent
        font.pixelSize: 24
    }
}