//radiobtns

const rdbUrl = document.querySelector('#rdbUrl');
const rdbLocal = document.querySelector('#rdbLocal');

const txtUrlImagen = document.querySelector('#txtUrlImagen');
const txtImagen = document.querySelector('#txtImagen');


rdbUrl.addEventListener('change', function () {
    txtUrlImagen.readOnly = !this.checked;
    txtImagen.disabled = this.checked;

});

rdbLocal.addEventListener('change', function () {
    txtUrlImagen.readOnly = this.checked;
    txtUrlImagen.value = "";
    txtImagen.disabled = !this.checked;
});

