// app/javascript/components/navbar.js
function initUpdateNavbarOnScroll() {
 const navbar = document.querySelector('.navbar-wagon');
 window.addEventListener('scroll', () => {
   if (window.scrollY >= window.innerHeight) {
     navbar.classList.add('navbar-home');
   } else {
     navbar.classList.remove('navbar-home');
   }
 });
}

export { initUpdateNavbarOnScroll };
