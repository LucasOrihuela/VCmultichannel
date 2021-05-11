function validateData() {
    if (!$("#user").val()) {
        showError("'Email' no puede estar vacío");
        return false;
    }
    else if (!$("#pass").val()) {
        showError("'Contraseña' no puede estar vacío");
        return false;
    }
    return true;
}

function callValidate(ctl, event) {
    // STORE HREF ATTRIBUTE OF LINK CTL (THIS) BUTTON
    var defaultAction = $(ctl).prop("href");
    // CANCEL DEFAULT LINK BEHAVIOUR
    event.preventDefault();
    if (validateData()) {
        // RESUME THE DEFAULT LINK ACTION
        window.location.href = defaultAction;
        return true;
    }
    else {
        return false;
    }
}