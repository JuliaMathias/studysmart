let modal = document.getElementById("attachment-modal");

// Get the button that opens the modal
let btn = document.getElementById("modalbtn");

// Get the <span> element that closes the modal
let close = document.getElementById("closebtn");

const openModal = btn.onclick = function() {
  console.log("block")
  console.log(modal)
  console.log(close)
  modal.style.display = "block";
  console.log("working?")
}

// When the user clicks on <close> (x), close the modal
const closeModal = close.onclick = function() {
  console.log("close")
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
const windowClose = window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

export { openModal, closeModal, window };
