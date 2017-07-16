# frozen_string_literal: true

module SanitizeHelper
  def sanitization_filter(allowed_elements = elements)
    {
      elements: allowed_elements,
      remove_contents: remove_contents,
      attributes: attributes,
      protocols: protocols,
      transformers: [list_transformer, table_transformer]
    }
  end

  def elements
    %w(
      h1 h2 h3 h4 h5 h6 h7 h8 br b i strong em a pre code img tt input div ins
      del sup sub p ol ul table thead tbody tfoot blockquote span dl dt dd kbd
      q samp var hr ruby rt rp li tr td th s strike summary details
    )
  end

  private

  def remove_contents
    %w(script)
  end

  def attributes
    {
      "a"          => %w(href),
      "img"        => %w(src longdesc),
      "div"        => %w(itemscope itemtype),
      "blockquote" => %w(cite),
      "del"        => %w(cite),
      "ins"        => %w(cite),
      "q"          => %w(cite),
      all:         default_permitted_attributes
    }
  end

  def default_permitted_attributes
    %w(abbr accept accept-charset accesskey action align alt axis border
       cellpadding cellspacing charoff checked clear cols colspan color
       coords dir disabled enctype for frame headers height hreflang
       ismap label lang maxlength media method multiple name nohref
       nowrap open prompt readonly rel rev rows rowspan rules scope
       shape size span start summary tabindex target title type usemap
       value vspace width itemprop charset datetime class char valign
       compact hspace noshade selected)
  end

  def protocols
    {
      "a"          => { "href" => anchor_schemes },
      "blockquote" => { "cite" => ["http", "https", :relative] },
      "del"        => { "cite" => ["http", "https", :relative] },
      "ins"        => { "cite" => ["http", "https", :relative] },
      "q"          => { "cite" => ["http", "https", :relative] },
    }
  end

  def table_transformer
    # Table child elements that are not contained by a <table> are removed.
    lambda do |env|
      name = env[:node_name]
      node = env[:node]
      if table_items.include?(name) &&
          node.ancestors.none? { |n| n.name == table }
        node.replace(node.children)
      end
    end
  end

  def list_transformer
    # Top-level <li> elements are removed because they can break out of
    # containing markup.
    lambda do |env|
      name = env[:node_name]
      node = env[:node]
      if name == list_item &&
          node.ancestors.none?{ |n| lists.include?(n.name) }
        node.replace(node.children)
      end
    end
  end

  def anchor_schemes
    ["http", "https", "mailto", :relative, "github-windows", "github-mac"]
  end

  def lists
    Set.new(%w(ul ol))
  end

  def list_item
    "li"
  end

  def table_items
    Set.new(%w(tr td th thead tbody tfoot))
  end

  def table
    "table"
  end
end
