class HTMLWithPygments < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
  include ActionView::Helpers::FormHelper

  def list(content, list_type)
    task_list = "class='task-list'" if content.include?("task-list-item")
    case list_type
    when :ordered
      %(<ol #{task_list}>#{content}</ol>)
    when :unordered
      %(<ul #{task_list}>#{content}</ul>)
    end
  end

  def list_item(text, list_type)
    if text.start_with?("[x]", "[X]", "[ ]")
      task_list_item(text)
    elsif list_type == :ordered || list_type == :unordered
      %(<li>#{text}</li>)
    end
  end

  private

  def task_list_item(text)
    text[3..-1] = "<span>#{text[3..-1].strip}</span>"
    if text.start_with?("[x]", "[X]")
      text[0..2] = task_list_check_box(true)
      %(<li class="task-list-item checked">#{text}</li>)
    elsif text.start_with?("[ ]")
      text[0..2] = task_list_check_box
      %(<li class="task-list-item">#{text}</li>)
    end
  end

  def task_list_check_box(checked = false)
    check_box_tag(
      nil, nil, checked, class: "task-list-item-checkbox", disabled: true
    )
  end
end
