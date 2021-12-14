class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  def names_by_age
    actors.select(:name).order(:age)
  end

  def average_age
    actors.average(:age)
  end
end
