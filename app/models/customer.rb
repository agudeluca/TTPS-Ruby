class Customer < ActiveRecord::Base
	validates :name, presence: true, format:{with: /\A[a-zA-Z ]+\z/,message: "ingrese solamente letras"}, length: {maximum:50}
	validates :last_name, presence: true, format:{with: /\A[a-zA-Z ]+\z/,message: "ingrese solamente letras"}, length: {maximum:50}
	validates :birthdate, presence: true
	validates  :genre, presence: true, inclusion: { in: %w(Male Female),message: "%{value} is not a valid genre" } 
	validates  :document_number, presence: true, length: { is: 8 }, numericality: { only_integer: true },uniqueness:{}
	validates  :cuil_cuit, presence: true, format:{ with: /[\d{2}]+\-[\d{8}]+\-[\d{1}]/ },uniqueness:{}
	has_many :contacts
	has_many :invoices
end
