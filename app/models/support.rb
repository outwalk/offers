# == Schema Information
#
# Table name: support
#
#  id          :integer          not null, primary key
#  language    :string(255)      not null
#  slug        :string(255)      not null
#  title       :string(255)      not null
#  description :text(65535)
#  body        :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Support < ActiveRecord::Base
  # Includes

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)
  self.table_name = 'support'

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many

  # Validations: presence > by type > validates
  validates :language, :slug, :title, :body, presence: true
  validates :slug, uniqueness: { scope: :language }

  # Other properties (e.g. accepts_nested_attributes_for)

  # Model dictionaries, state machine

  # Scopes

  # Other model methods
  def to_param
    slug
  end

  # Private methods (for example: custom validators)
  private

end
