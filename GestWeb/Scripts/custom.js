function dataFormatada() {
    var data = new Date();
    var dia = data.getDate();
    if (dia.toString().length == 1) {
        dia = "0" + dia;
    }
    var mes = data.getMonth() + 1;
    if (mes.toString().length == 1) {
        mes = "0" + mes;
    }
    var ano = data.getFullYear();

    return dia + "/" + mes + "/" + ano;
}

function difDate(par1, par2) {
    DAY = 1000 * 60 * 60 * 24

    var nova1 = par1.toString().split('/');
    Nova1 = nova1[1] + "/" + nova1[0] + "/" + nova1[2];

    var nova2 = par2.toString().split('/');
    Nova2 = nova2[1] + "/" + nova2[0] + "/" + nova2[2];

    d1 = new Date(Nova1)
    d2 = new Date(Nova2)

    days_passed = Math.round((d2.getTime() - d1.getTime()) / DAY)

    return days_passed;
}


$(document).ready(function () {
    var _linha, _row, arr;
    var _cod, _tarefa, _data;

    _linha = $('#MainContent_GridView1').children('tbody').find('td');
    _row = _linha.text();

    arr = _row.split("Selecionar");

    $.each(arr, function (index, value) {
        if (value != "") {
            var n = value.length;
            var _cod, _tarefa, _data;
                _cod = value.substr(0, 2);
                _tarefa = value.substr(2, n - 12);
                _data = value.substr(n - 10, n);

            var _dia, _mes, _ano;
                _dia = parseInt(_data.substr(0, 2));
                _mes = parseInt(_data.substr(3, 2));
                _ano = parseInt(_data.substr(-4));

            var dia, mes, ano;
            var dataHoje = dataFormatada();
                dia = parseInt(dataHoje.substr(0, 2));
                mes = parseInt(dataHoje.substr(3, 2));
                ano = parseInt(dataHoje.substr(-4));
            //alert(difDate(dataHoje, _data));
            if (difDate(dataHoje, _data) < 0) {
                var mensagem = 'A tarefa com o código ' + _cod + ' está em vencida!'
                alert(mensagem);
            } 
        }
    });



});

$('#MainContent_ButtonSalvar').click(function () {
    _mensagem = $('#MainContent_mensagem');
    if (_mensagem.text().match('cadastrada')) {
        _mensagem.css('color', 'green');
    }

    //if ($('#MainContent_TextBoxDataFim').val().length; < 10)
    //alert('Digite uma data válida. Ex. 11/11/2011');

});
