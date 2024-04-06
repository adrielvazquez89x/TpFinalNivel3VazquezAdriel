// ********************* VALIDACIONES PARA EL REGISTRO ********************* \\

//TextBox donde está el mail
const txtUserName = document.querySelector('#txtUserName');
//TxtBox del password
const txtPassword = document.querySelector('#txtPassword');

//Mensajitos rojos debajo de los txtbox
const spanValidatorEmail = document.querySelector('#spanValidatorEmail');
const spanValidatorPass = document.querySelector('#spanValidatorPass');

//Regularexpresion
const regEx = /^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

function validar() {
    //Validaciones campos vacíos;
    if (txtUserName.value == "") {

        ponerRojoCorreo("Este campo no puede ir vacío");

        return false;
    }

    ponerVerdeCorreo();


    const mailLowerCase = txtUserName.value.toLowerCase();

    if (!regEx.test(mailLowerCase)) {

        ponerRojoCorreo("Ingrese una dirección de correo válida");


        return false;
    }

    ponerVerdeCorreo();


    if (txtPassword.value == "") {

        ponerRojoPass("Este campo no puede ir vacío")

        return false;
    }

    if (txtPassword.value.length < 8) {

        ponerRojoPass("Debe contener como mínimo 8 caracteres");

        return false;
    }

    spanValidatorPass.textContent = "";
    txtPassword.classList.remove("is-invalid");
    txtPassword.classList.add("is-valid");


    return true;
}

function ponerRojoCorreo(mensaje) {

    spanValidatorEmail.textContent = mensaje;
    spanValidatorEmail.classList.add("text-danger");
    txtUserName.classList.remove("is-valid");
    txtUserName.classList.add("is-invalid");

}

function ponerVerdeCorreo() {
    spanValidatorEmail.textContent = "";
    spanValidatorEmail.classList.remove("text-danger");
    txtUserName.classList.remove("is-invalid");
    txtUserName.classList.add("is-valid");
}

function ponerRojoPass(mensaje) {

    spanValidatorPass.textContent = mensaje;
    spanValidatorPass.classList.add("text-danger");
    txtPassword.classList.add("is-invalid");

}


// ********************* VALIDACIONES PARA EL ALTA *********************

// TextBox de Codigo, Nombre y Precio.
const txtCodigo = document.querySelector('#txtCodigo');
const txtNombre = document.querySelector('#txtNombre');
const txtPrecio = document.querySelector('#txtPrecio');

//Spans para mensajes:
const spanValidatorCodigo = document.querySelector('#spanValidatorCodigo');
const spanValidatorNombre = document.querySelector('#spanValidatorNombre');
const spanValidatorPrecio = document.querySelector('#spanValidatorPrecio');

//regex solo números:

const regExNum = /^\d+(\,\d{1,2})?$/;

function validarFormulario() {

    //Validar campo vacío
    if (txtCodigo.value == "") {
        ponerRojoFormulario(txtCodigo, spanValidatorCodigo, "El código no puede ir vacío");
        
        return false;
    }
    ponerVerdeFormulario(txtCodigo, spanValidatorCodigo);

    if (txtNombre.value == "") {
        ponerRojoFormulario(txtNombre, spanValidatorNombre, "El nombre no puede ir vacío");
        return false;
    }
    ponerVerdeFormulario(txtNombre, spanValidatorNombre);

    if (txtPrecio.value == "") {
        ponerRojoFormulario(txtPrecio, spanValidatorPrecio, "Por favor, poné un precio");
        return false;
    }

    if (!regExNum.test(txtPrecio.value)) {
        ponerRojoFormulario(txtPrecio, spanValidatorPrecio, "Sólo números por favor");
        return false;
    }
    ponerVerdeFormulario(txtPrecio, spanValidatorPrecio);

    return true;
}
// ********************* VALIDACIONES PARA EL CHECKOUT *********************

const txtNombreConfirmar = document.querySelector('#txtNombreConfirmar');
const txtDni = document.querySelector('#txtDni');
const txtDireccion = document.querySelector('#txtDireccion');
const txtLocalidad = document.querySelector('#txtLocalidad');
const txtCP = document.querySelector('#txtCP');


const spanNombreConfirmar = document.querySelector('#spanNombreConfirmar');
const spanDni = document.querySelector('#spanDni');
const spanDireccion = document.querySelector('#spanDireccion');
const spanLocalidad = document.querySelector('#spanLocalidad');
const spanCp = document.querySelector('#spanCp');


function validacionConfirmar() {

    if (txtNombreConfirmar.value == "") {
        ponerRojoFormulario(txtNombreConfirmar, spanNombreConfirmar, "El nombre no puede ir vacío");
        return false;
    }

    ponerVerdeFormulario(txtNombreConfirmar, spanNombreConfirmar);

    if (txtDni.value == "") {
        ponerRojoFormulario(txtDni, spanDni, "El dni no puede ir vacío");
        return false;
    }


    if (txtDni.value.length != 8) {
        ponerRojoFormulario(txtDni, spanDni, "Formato inválido");
        return false;
    }

    ponerVerdeFormulario(txtDni, spanDni);

    if (txtDireccion.value == "") {
        ponerRojoFormulario(txtDireccion, spanDireccion, "La dirección no puede ir vacía");
        return false;
    }

    ponerVerdeFormulario(txtDireccion, spanDireccion);

    if (txtLocalidad.value == "") {
        ponerRojoFormulario(txtLocalidad, spanLocalidad, "La localidad no puede ir vacía");
        return false;
    }

    ponerVerdeFormulario(txtLocalidad, spanLocalidad);

    if (txtCP.value == "") {
        ponerRojoFormulario(txtCP, spanCp, "Ingrese un codigo postal");
        return false;
    }

    ponerVerdeFormulario(txtCP, spanCp);

    return true;
}

function ponerRojoFormulario(cajita, span, mensaje) {
    span.textContent = mensaje;
    span.classList.add("text-danger");
    cajita.classList.remove("is-valid");
    cajita.classList.add("is-invalid");
}

function ponerVerdeFormulario(cajita, span) {
    span.textContent = "";
    span.classList.remove("text-danger");
    cajita.classList.remove("is-invalid");
    cajita.classList.add("is-valid");
}