const btn = document.querySelector(".theme-toggle");
const prefersDarkScheme = window.matchMedia("(prefers-color-scheme: dark)");

btn.addEventListener("click", function () {
  if (prefersDarkScheme.matches) {
    document.querySelector(":root").classList.toggle("lightmode");
  } else {
    document.querySelector(":root").classList.toggle("darkmode");
  }
});