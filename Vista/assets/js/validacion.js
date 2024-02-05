//Validaciones clásicas

//TextBox donde está el mail
const txtUserName = document.querySelector('#txtUserName');
//TxtBox del password
const txtPassword = document.querySelector('#txtPassword');

//Mensajitos rojos debajo de los txtbox
const spanValidatorEmail = document.querySelector('#spanValidatorEmail');
const spanValidatorPass = document.querySelector('#spanValidatorPass');



//Regularexpresion

const regEx = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;

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


//Validación campo precio del admin
/*
const btnBuscar = document.querySelector('#btnBuscar');

btnBuscar.addEventListener('click', validarCampos);

const ddlCampo = document.querySelector('#ddlCampo');
const txtFiltroAvanzado = document.querySelector('#txtFiltroAvanzado');

console.log(btnBuscar);

function validarCampos() {


    if (ddlCampo.value == "Precio") {

        if (txtFiltroAvanzado.value == "") {
            txtFiltroAvanzado.classList.add('is-invalid');
        }
    }

}

*/