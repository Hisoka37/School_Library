# frozen_string_literal: true

require_relative 'name_decorator'

class CapitalizeDecorator < NameDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
