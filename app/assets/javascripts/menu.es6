$(document).on("turbolinks:load", () => {
  $("#hamburger").click(() => {
    if ($("#drawer").css("left") == "-275px") {
      $("#drawer").css("left", "0px");
      $("#main").css("left", "275px");
      $("#main").css("width", "calc(100% - 275px)");
      $("nav").css("left", "276px");
      $("nav").css("width", "calc(100% - 306px)")
    } else {
      $("#drawer")[0].style.removeProperty("left");
      $("#main")[0].style.removeProperty("left");
      $("#main")[0].style.removeProperty("width");
      $("nav")[0].style.removeProperty("left");
      $("nav")[0].style.removeProperty("width");
    }
  });
});
