import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const input = document.querySelector(".datepicker");
  if (input) {
    flatpickr(".datepicker", {
      altInput: true,
      enableTime: true,
    });
  }
}


export { initFlatpickr }
