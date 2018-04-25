import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import Qt.labs.settings 1.0
import "sharedFunctions.js" as Functions

//Seite, um Einstellungen zu tätigen
BasePage {
    //Seiteneinstellungen
    height: parent.height; width: parent.width

    titel: "DMS-App"

    menuButtonsText: [ "zurück" ]

    //Inhaltsobjekte
    Rectangle {
        property alias userToken : userToken
        id: settingsPageView
        height: parent.height
        width: parent.width
        color: "#C0D5E5"

        Text{
            id: tokenLabel;
            text: "Token:";
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.right: parent.right;
        }

        TextField {
            id: userToken;
            placeholderText: "Token";
            text: decodeURI(settings.token);
            anchors.top: tokenLabel.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            onFocusChanged: {
                if (focus){
                    settings.login = 0;
                }
                mainStackView.currentItem.menuButtonsText = [ "Speichern" ]
            }
            //Wenn Daten geändert werden, muss erst gespeichert werden, bevor es zurück geht.
            onEditingFinished: {
                settings.token = encodeURI(userToken.text);

                Functions.testUser()
                Functions.getProfileID()

                if (settings.login === 200)
                {
                    notificationLabel.text = "login ok; ID: " + settings.userID;
                    mainStackView.currentItem.menuButtonsText = [ "mainStackView.pop();" ];
                    mainStackView.pop();
                } else {
                    notificationLabel.text = "Fehler beim Login";

                }
            }
        }

        Text{
            id: notificationLabel;
            text: "";
            anchors.top: userToken.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
        }
    }

    //Auswertung des Klicks auf Speichern
    onMenuButtonClicked: {
        //Wenn gültige Login-Daten hinterlegt sind, kann auf die Seite mit der Nummernanzeige gewechselt werden.
        if (settings.login === 200) {
            switch ( buttonIndex ) {
            case 0: mainStackView.pop(); break;
            case 1: mainStackView.push( drinksPage ); break;
            default:
            }
        } else {
            settings.token = encodeURI(userToken.text);

            Functions.testUser()
            Functions.getProfileID()

            if (settings.login === 200)
            {
                notificationLabel.text = "login ok";
                mainStackView.currentItem.menuButtonsText = [ "Einstellungen" ];
                mainStackView.pop();
            } else {
                notificationLabel.text = "Fehler beim Login";

            }
        }

    }
}
