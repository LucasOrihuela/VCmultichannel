﻿function validateData(){return $("#user").val()?$("#pass").val()?!0:(showError("'Contrase\u00f1a' no puede estar vac\u00edo"),!1):(showError("'Email' no puede estar vac\u00edo"),!1)}function callValidate(a,b){var c=$(a).prop("href");b.preventDefault();return validateData()?(window.location.href=c,!0):!1};