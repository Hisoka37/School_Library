# frozen_string_literal: true

require_relative 'name_decorator'

class TrimmerDecorator < NameDecorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
