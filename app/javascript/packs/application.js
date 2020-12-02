// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
// import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { openModal } from '../components/modal';
import { dropdown } from '../components/dropdown';

// When the user clicks on the button, open the modal



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  openModal();
  dropdown();

  $('.has-sub').on('click', function(e) { // Get all dropdown menu toggles
      $('.dropdown-menu').not($(this).children('.dropdown-menu')).removeClass('dropdown-shown'); // Hide all other dropdown menus
      $('.has-sub').not($(this)).removeClass('active'); // Remove the active selector from the other dropdown toggles
      $(this).children('.dropdown-menu').toggleClass('dropdown-shown'); // Show/hide the dropdown menu associated with the toggle being clicked
      $(this).toggleClass('active'); // Toggle the active selector on the nav-item
  });
});

require("trix")
require("@rails/actiontext")
