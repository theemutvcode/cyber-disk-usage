import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQml.Models 2.2
import MeuiKit 1.0 as Meui
import org.cyber.DiskUsage 1.0

ApplicationWindow {
    visible: true
    id: rootWindow
    title: qsTr("Disk Usage")
    width: 500
    height: 400
    minimumWidth: 500
    minimumHeight: 400

    background: Rectangle {
        color: Meui.Theme.backgroundColor
    }

    Backend {
        id: backend
    }


    DelegateModel {
        id: driveModel
        model: backend.getDrives

        delegate: DiskItem {
            required property variant modelData
            anchors.left: parent.left
            anchors.right: parent.right

            key: modelData['name']
            value: modelData['usage']
            image: "qrc:/images/drive-partition.svg"
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: driveModel

        ScrollBar.vertical: ScrollBar {}
    }
}
