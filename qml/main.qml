import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import Qt.labs.settings 1.0

//Haupt-Fenster
ApplicationWindow {
    id: mainWindow
    //Größe nur für Desktop interessant
    //width: 1024; height: 500;

    //Settings-Objekt zur Speicherung wichtiger Daten des Benutzers
    Settings {
        id: settings
        //enthält Benutzertoken
        property string token: ""
        //Speichert, ob aktuell gültige Zugangsdaten vorliegen
        property int login: 0;
        property int userID: 0;
    }

    //Hauptobjekt, dass alles weitere enthält
    Rectangle {
        id: root
        anchors.fill: parent

        //Definition der drei einzelnen Seiten
        Drinks { id: drinksPage }
        Settingss { id: settingsPage }
        Users { id: usersPage }

        //Titel oben
        Rectangle {
            id: titel
            anchors { top: parent.top; left: parent.left; right: parent.right }
            height: mainWindow.height/7;

            Text {
                id: titelText
                anchors.fill: parent
                text: mainStackView.currentItem.titel
                font.pointSize: 24
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter
            }
            z: 1000;
        }

        //Hauptfenster für Inhalte
        StackView {
            id: mainStackView
            anchors{ top: titel.bottom; left: parent.left; right: parent.right; bottom: menuAppPage.top }
            initialItem: drinksPage // Qt.resolvedUrl("Home.qml")
        }

        //Menü unten
        AppMenu {
            id: menuAppPage
            anchors{ left: parent.left; right: parent.right; bottom: parent.bottom }
            height: mainWindow.height/7;

            //Übergabe der Inhaltselemente an Unterdatei
            buttonsText: mainStackView.currentItem.menuButtonsText
            buttonsIcons: mainStackView.currentItem.menuButtonsText
            onButtonClicked: mainStackView.currentItem.menuButtonClicked( buttonIndex )
        }
    }

    //Anzeige der Inhalte, wenn komplett gezeichnet
    Component.onCompleted: show()
}
