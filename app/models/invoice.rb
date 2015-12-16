class Invoice < ActiveRecord::Base
	validates :details, presence: true, length: {maximum:200}, format:{with: /\A[a-zA-Z\d ]+\z/,message: "ingrese solamente letras y numeros"}
      validates :amount, presence: true, numericality: { :greater_than_or_equal_to => 0 }
      validates :date, presence: true 
      validates :reveiver, presence: true, format:{with: /\A[a-zA-Z\d\- ]+\z/,message: "ingrese solamente letras y numeros"}, length: {maximum:50}
end
