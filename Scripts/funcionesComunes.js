function barraEstado(err, msgBar) {
    
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

function filtro(table, clave, col) {
    tr = table.getElementsByTagName("tr");

    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[col];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(clave.toUpperCase()) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function limpiarFiltro(table){
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[3];
        if (td) {
            tr[i].style.display = "";
        }
    }
}

function iniciarDropDowns(combos){
    for (i = 0; i < combos.length; i++) {
        combos[i].val("-1")
    }
}

function iniciarTextBoxes(txtBoxes) {
    for (i = 0; i < txtBoxes.length; i++) {
        //txtBoxes[i].attr("value", "")
        txtBoxes[i].val("")
    }
}
