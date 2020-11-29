function copyUrl() {
  /* Copy the text inside the text field */
  var Url = document.getElementById("url");
  Url.innerHTML = window.location.href;
  console.log(Url.innerHTML)
  Url.select();
  document.execCommand("copy");
  alert("Copied the text: " + Url);
}

export { copyUrl };
