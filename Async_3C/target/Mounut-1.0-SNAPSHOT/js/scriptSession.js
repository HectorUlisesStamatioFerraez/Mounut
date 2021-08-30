$(document).ready(function () {
    var DOM = {
        frmLogin: $("#frmLogin"),
        txtUser: $("input#user"),
        txtClave: $("input#pass"),
        alert: $("a#contenedor")
    };

    DOM.frmLogin.on("submit", function (e) {
        e.preventDefault();
        iniciarSession();
    });

    function iniciarSession() {
        var obj = {
            usuario: DOM.txtUser.val(),
            clave: DOM.txtClave.val()};
        $.post("../session?accion=identificar",
                {datos: JSON.stringify(obj)},
                function (data) {
                    if (data.rpt) {
                        DOM.alert[0].textContent = data.msj;
                        setTimeout(function () {
                            window.location.href = "paginaPrincipalAdministrador.jsp";}, 1500);
                    } else {
                        DOM.alert[0].textContent = data.msj;
                    }
                });
    }
});

