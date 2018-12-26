function barraEstado(err, msgBar) {
    console.log("ERROR" + err)
    if (err == "error") {
        msgBar.removeClass("alert-success");
        msgBar.addClass("alert-danger");
        msgBar.show()
    } else if (err == "success") {
        msgBar.addClass("alert-success");
        msgBar.removeClass("alert-danger");
        msgBar.show()
    } else {
        msgBar.hide();
    }
}