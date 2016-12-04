var userAgent = navigator.userAgent || navigator.vendor || window.opera;

  if( userAgent.match( /iPad/i ) || userAgent.match( /iPhone/i ) || userAgent.match( /iPod/i ) ) {
    document.body.className += ' ios';
  } else {

    document.body.className += ' android';
  }
function toggleMenu () {
  document.querySelector('.hamburger-menu').classList.toggle('nav-visible');
  document.querySelector('.overlay-shadow').classList.toggle('hidden');
}