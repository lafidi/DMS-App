import QtQuick 2.3
import QtQuick.Dialogs 1.2
import "sharedFunctions.js" as Functions

Rectangle {
    id: content;
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

    MessageDialog {
        id: confirmOrder
        title: "Bestellung"
        text: {product.text + " für " + userIDName + " bestellen?"}
        icon: StandardIcon.Question
        standardButtons: StandardButton.Yes | StandardButton.No
        onNo: {
            confirmOrder.close();
        }
        onYes: {
            Functions.orderDrink(userIDOrder, productID.text, product.text);
            mainStackView.pop(); mainStackView.pop(); userIDOrder = settings.userID; userIDName = "dich";
            confirmOrder.close();
        }

        visible: false
    }

    MouseArea{
        anchors.fill: parent;
        onPressed: {
            parent.scale = 0.9;
        }
        onReleased: {
            parent.scale = 1;
            confirmOrder.open();
        }
    }

    Text{id: productID; text: modelData.id; visible: false}
    Text{id: product; text: modelData.name; visible: false}
    Text{
        anchors.fill: parent;
        text: {if (modelData.price_cent !== null) {modelData.name + ' | ' + modelData.price_cent/100.0 + " Euro"} else {modelData.name}}
        width: parent.width;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter
    }
}
