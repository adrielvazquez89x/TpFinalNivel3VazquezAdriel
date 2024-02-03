//radiobtns
const rdbUrl = document.querySelector('#rdbUrl');
const rdbLocal = document.querySelector('#rdbLocal');

const txtUrlImagen = document.querySelector('#txtUrlImagen');
const txtImagen = document.querySelector('#txtImagen');

//botonGuardarimg

console.log("ASDASDASDASDASDASDASD");

const btnImg = document.querySelector('#btnImg');

// Eventos

rdbUrl.addEventListener('change', function () {
    txtUrlImagen.readOnly = !this.checked;
    txtImagen.disabled = this.checked;

});

rdbLocal.addEventListener('change', function () {
    txtUrlImagen.readOnly = this.checked;
    txtUrlImagen.value = "";
    txtImagen.disabled = !this.checked;
});

btnImg.addEventListener('click', forceReload);

function forceReload() {
    console.log("Se ejecut");
    location.reload(true);
}