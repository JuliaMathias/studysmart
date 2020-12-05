function copyUrl() {

  const element = document.getElementById("copy");
    if (element) {
      console.log(element);

      /* Get the text field */
      var copyText = document.getElementById("url");

      /* Select the text field */


      /* Copy the text inside the text field */
      element.addEventListener("click", function() {
        copyText.select();
        copyText.setSelectionRange(0, 99999); /*For mobile devices*/
        document.execCommand("copy");
        console.log(copyText.value);
      });
    }

}

export { copyUrl };
