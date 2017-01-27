$(document).on("turbolinks:load", () => {
  $(document).one('focus.expand', 'textarea.expand', function(){
    const savedValue = this.value;
    this.value = '';
    this.baseScrollHeight = this.scrollHeight;
    this.value = savedValue;
  }).on('input.expand', 'textarea.expand', function(){
    const minRows = this.dataset.minRows|0;
    let rows;
    this.rows = minRows;
    if (this.baseScrollHeight == undefined) {
      $(this).trigger("focus");
    }
    rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 24);
    this.rows = minRows + rows;
    $(this).closest("form").submit();
  });

  function preview(e) {
    let evtobj = window.event? event : e
    if (evtobj.keyCode == 80 && evtobj.ctrlKey) {
      $("#edit_note").submit();
      Turbolinks.visit($(".toggle-preview").attr("href"));
    }
  }

  document.onkeydown = preview;
  $("textarea.expand").trigger("input");

  $('.js-task-list-container').taskList();
  return null;
});
