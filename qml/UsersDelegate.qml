import QtQuick 2.3
import QtQuick.Dialogs 1.2
import "sharedFunctions.js" as Functions

Rectangle {
    id: content2;
    anchors {left: parent.left; right: parent.right;}
    anchors.margins: mainWindow.width/20;
    height: mainWindow.height/8;
    //height: column.implicitHeight;
    border.width: 2;
    border.color: "#C0D5E5";
    color: "#B40000";
    radius: mainWindow.width/10;
    clip: true;
    Behavior on scale {NumberAnimation {easing.type: Easing.OutQuad;}}

    MouseArea{
        anchors.fill: parent;
        onPressed: {
            parent.scale = 0.9;
        }
        onReleased: {
            parent.scale = 1;
            //console.info(usersID.text);
            mainStackView.push(drinksPage, {userIDOrder: usersID.text, userIDName: user.text});
        }
    }
    Text{id: usersID; text: modelData.id; visible: false}
    Text{id: user; text: modelData.first_name + " " + modelData.last_name; visible: false}
    Text{
        anchors.fill: parent;
        text: {modelData.first_name + " " + modelData.last_name}
        width: parent.width;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter
    }
}
