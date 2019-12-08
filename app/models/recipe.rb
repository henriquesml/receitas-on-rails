class Recipe < ApplicationRecord

    validates :name, :stuff, :duration, :prepare_mode, presence:true
    validates_length_of :stuff, maximum: 200
    validates_length_of :prepare_mode, maximum: 300
    validates_numericality_of :calories, greather_than_or_equal_to: 0, presence:true
    validates_format_of :poster, with: /\w+\.(jpeg|png)\z/i, message: "Utilizar somente arquivos JPEG ou PNG."
    
    KIND = %w(Carner Aves Peixes Massas Saladas Doces)
    validates_inclusion_of :kind, in: KIND

    def light?
        calories.blank? || calories < 100
    end

end
