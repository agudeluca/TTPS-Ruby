class Invoice < ActiveRecord::Base
	validates :details, presence: true, 
						length: {maximum:200}, 
						format:{with: /\A[a-zA-Z\d ]+\z/,message: "ingrese solamente letras y numeros"},
						allow_blank: false
      validates :amount, presence: true,
 	                   numericality: { :greater_than_or_equal_to => 0 },
                         allow_blank: false
      validates :date, presence: true,
                       allow_blank: false
      validates :reveiver, presence: true, 
					       format:{with: /\A[a-zA-Z\d\- ]+\z/,message: "ingrese solamente letras y numeros"},
					       length: {maximum:50},
					       allow_blank: false
	  validates  :cuil_cuit_reveiver, presence: true,
                         format:{ with: /\A\d{2}\-\d{8}\-\d{1}\z/,message: "el cuil no respeta el formato" },
                         length: {is: 13},
                         allow_blank: false			       
end
