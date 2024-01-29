const btnMenu = document.querySelector('#btnMenu');
const navBar = document.querySelector('.navBar');
const btnContainer = document.querySelector('.btnContainer');
const header = document.querySelector('#header');

btnMenu.addEventListener('click', () => {
    navBar.classList.toggle('active');

})


window.addEventListener('DOMContentLoaded', () => {
    if (window.innerWidth >= 768) {
        header.appendChild(btnContainer);
    }
    else {
        navBar.appendChild(btnContainer);
    }
})

window.addEventListener('resize', () => {
    if (window.innerWidth >= 768) {
        header.appendChild(btnContainer);
    }
    else {
        navBar.appendChild(btnContainer);
    }
})