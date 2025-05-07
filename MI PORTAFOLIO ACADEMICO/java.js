// script.js
document.addEventListener("DOMContentLoaded", () => {
    const navResponsive = document.querySelector('.nav-responsive');
    const nav = document.querySelector('nav');

    navResponsive.addEventListener('click', () => {
        nav.classList.toggle('responsive');
    });

    // Scroll suave para el menú
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});

