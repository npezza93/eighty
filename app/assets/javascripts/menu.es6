$(document).on("turbolinks:load", () => {
  $("#hamburger").click(() => {
    if ($("#drawer").css("left") == "-250px") {
      $("#drawer").css("left", "0px");
      $("#main").css("left", "250px");
      $("#main").css("width", "calc(100% - 250px)");
    } else {
      $("#drawer").css("left", "-250px");
      $("#main").css("left", "0px");
      $("#main").css("width", "100%");
    }
  });
});
