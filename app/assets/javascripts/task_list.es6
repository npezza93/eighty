let codeFencesPattern;
let complete;
let completePattern;
let escapePattern;
let incomplete;
let incompletePattern;
let itemPattern;
let itemsInParasPattern;
let updateTaskListItem;
const indexOf = [].indexOf || function(item) { for (let i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

incomplete = "[ ]";
complete = "[x]";

escapePattern = str => str.replace(/([\[\]])/g, "\\$1").replace(/\s/, "\\s").replace("x", "[xX]");

incompletePattern = RegExp(`${escapePattern(incomplete)}`);
completePattern = RegExp(`${escapePattern(complete)}`);

itemPattern = RegExp(`^(?:\\s*(?:>\\s*)*(?:[-+*]|(?:\\d+\\.)))\\s*(${escapePattern(complete)}|${escapePattern(incomplete)})\\s+(?!\\(.*?\\))(?=(?:\\[.*?\\]\\s*(?:\\[.*?\\]|\\(.*?\\))\\s*)*(?:[^\\[]|$))`);

codeFencesPattern = /^`{3}(?:\s*\w+)?[\S\s].*[\S\s]^`{3}$/mg;

itemsInParasPattern = RegExp(`^(${escapePattern(complete)}|${escapePattern(incomplete)}).+$`, "g");

updateTaskListItem = (source, itemIndex, checked) => {
  let clean;
  let index;
  let line;
  let result;
  clean = source.replace(/\r/g, '').replace(codeFencesPattern, '').replace(itemsInParasPattern, '').split("\n");
  index = 0;
  result = ((() => {
    let i;
    let len;
    let ref;
    let results;
    ref = source.split("\n");
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      line = ref[i];
      if (indexOf.call(clean, line) >= 0 && line.match(itemPattern)) {
        index += 1;
        if (index === itemIndex) {
          line = checked ? line.replace(incompletePattern, complete) : line.replace(completePattern, incomplete);
        }
      }
      results.push(line);
    }
    return results;
  }))();
  return result.join("\n");
};

$(document).on('change', '.task-list-item-checkbox', function() {
  let $container;
  let $field;
  let checked;
  let index;
  $container = $(this).closest('.js-task-list-container');
  $field = $container.find('.js-task-list-field');
  index = 1 + $container.find('.task-list-item-checkbox').index($(this));
  checked = $(this).prop('checked');
  $(this).parent().toggleClass("checked");
  $field.val(updateTaskListItem($field.val(), index, checked));
  $container.find("form").submit();
});


$.fn.taskList = function() {
  let $container;
  $container = $(this).closest('.js-task-list-container');
  if ($container.find('.js-task-list-field').length > 0) {
    $container.find('.task-list-item').addClass('enabled').find('.task-list-item-checkbox').attr('disabled', null);
    return $container.addClass('is-task-list-enabled').trigger('tasklist:enabled');
  }

  return null;
};
