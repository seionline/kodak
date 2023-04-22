# frozen_string_literal: true

module ApplicationHelper
  def locale_link(text, locale)
    if request.get?
      link_to text, { locale: }, class: 'nav-item'
    else
      link_to text, root_path(locale:), class: 'nav-item'
    end
  end
end
