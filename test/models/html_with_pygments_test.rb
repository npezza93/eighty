# frozen_string_literal: true
require "test_helper"

class HTMLWithPygmentsTest < ActiveSupport::TestCase
  include MarkdownHelper

  test "an unordered task list can be created from markdown" do
    note = notes(:unordered_task_list)
    markdown = markdown(note)
    assert markdown ==
      "<ul class=\"task-list\"><li class=\"task-list-item\"><input "\
      "type=\"checkbox\" class=\"task-list-item-checkbox\" disabled><span>"\
      "Task 1</span></li><li class=\"task-list-item\"><input type=\"checkbox\""\
      " class=\"task-list-item-checkbox\" disabled>"\
      "<span>Task 2</span></li></ul>"
  end

  test "an ordered task list can be created from markdown" do
    note = notes(:ordered_task_list)
    markdown = markdown(note)

    assert markdown =~ /<ol class=\"task-list\">/
    assert markdown.include?(
      "<li class=\"task-list-item\"><input type=\"checkbox\" "\
      "class=\"task-list-item-checkbox\" disabled>"\
      "<span>Task 1</span></li>"
    )
  end

  test "a completed unordered task list checks inputs" do
    note = notes(:completed_unordered_task_list)
    markdown = markdown(note)

    assert markdown ==
      "<ul class=\"task-list\"><li class=\"task-list-item checked\"><input "\
      "type=\"checkbox\" class=\"task-list-item-checkbox\" "\
      "disabled checked><span>Task 1</span>"\
      "</li></ul>"
  end

  test "regular unordered lists are generated" do
    note = notes(:regular_unordered_list)
    markdown = markdown(note)

    assert markdown == "<ul><li>Item 1\n</li></ul>"
  end
end
