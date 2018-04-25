function sleepFor( sleepDuration ){
    var now = new Date().getTime();
    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ }
}

function var_dump(obj) {
    var out = '';
    for (var i in obj) {         out += i + ": " + obj[i] + "\n";     }
    console.info(out);
}

//Teste, ob angegebene Zugangsdaten gültig sind
function testUser(){

    var request = new XMLHttpRequest();

    var url = 'https://dms.fachschaft.tf/api/';
    var string = "";

    request.open ('GET', url);

    request.setRequestHeader("Authorization", "Token " + settings.token);

    request.onreadystatechange = function(event) {
        if (request.readyState == XMLHttpRequest.DONE){
            //console.log(request.responseText);

            string = request.responseText;

            settings.login = request.status;
        }
    }
    request.send();

}

function readProducts(){

    var request = new XMLHttpRequest();

    var url = 'https://dms.fachschaft.tf/api/products';

    request.open ('GET', url);

    request.setRequestHeader("Authorization", "Token " + settings.token);

    request.onreadystatechange = function(event) {
        if (request.readyState == XMLHttpRequest.DONE){
            view.model = (JSON.parse(request.responseText)).filter(function(item) {
                //return item.displayed !== false;
                return item.quantity > 0;
            });
        }
    }
    request.send();
}

function readUsers(){

    var request = new XMLHttpRequest();

    var url = 'https://dms.fachschaft.tf/api/profiles';

    request.open ('GET', url);

    request.setRequestHeader("Authorization", "Token " + settings.token);

    request.onreadystatechange = function(event) {
        if (request.readyState == XMLHttpRequest.DONE){
            view.model = (JSON.parse(request.responseText)).filter(function(item) {
                return ((item.allowed_buy !== false) && (item.id !== 41));
            });
        }
    }
    request.send();
}

function getProfileID(){

    var request = new XMLHttpRequest();

    var url = 'https://dms.fachschaft.tf/api/profiles';
    var test = [];

    request.open ('GET', url);

    request.setRequestHeader("Authorization", "Token " + settings.token);

    request.onreadystatechange = function(event) {
        if (request.readyState == XMLHttpRequest.DONE){
            settings.userID = (JSON.parse(request.responseText)).filter(function(item) {
                return (item.is_current === true);
            })[0]["id"];
        }
    }

    request.send();
}

function orderDrink(userID, drinkID, text){

    var request = new XMLHttpRequest();

    var url = 'https://dms.fachschaft.tf/api/orders';
    var params = '{"product":' + drinkID + ',"profile":' + userID + '}';

    request.open ('POST', url);

    request.setRequestHeader("Authorization", "Token " + settings.token);
    request.setRequestHeader("Content-type", "application/json");

    request.onreadystatechange = function(event) {
        if(request.readyState == XMLHttpRequest.DONE) {
            titelText.text = text + " bestellt";
            titelText.color = "red";
            timer.restart();
        }

    }

    request.send(params);
}

function encode_utf8(s) {
    return unescape(encodeURIComponent(s));
}
function decode_utf8(s) {
    return decodeURIComponent(escape(s));
}

