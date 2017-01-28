$(document).on("turbolinks:load", () => {
  $("#hamburger").click(() => {
    if ($("#drawer").css("left") == "-275px") {
      $("#drawer").css("left", "0px");
      $("#main").css("left", "275px");
      $("#main").css("width", "calc(100% - 275px)");
    } else {
      $("#drawer").css("left", "-275px");
      $("#main").css("left", "0px");
      $("#main").css("width", "100%");
    }
  });
});
