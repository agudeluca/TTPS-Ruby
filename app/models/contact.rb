class Contact < ActiveRecord::Base
	validates :type_contact, presence: true, inclusion: { in: %w(skype email phonenumber address facebook twitter linkedin),message: "%{value} is not a valid type(skype email phonenumber address, facebook,twitter,linkedin)" } ,allow_blank: false
	validates :contact_value, presence: true,allow_blank: false

end
