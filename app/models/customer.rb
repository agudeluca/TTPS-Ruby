class Customer < ActiveRecord::Base
	validates :name, presence: true, format:{with: /\A[a-zA-Z ]+\z/,message: "ingrese solamente letras"}, length: {maximum:50}
	validates :last_name, presence: true, format:{with: /\A[a-zA-Z ]+\z/,message: "ingrese solamente letras"}, length: {maximum:50}
	validates :birthdate, presence: true
	validates  :genre, presence: true, inclusion: { in: %w(Male Female),message: "%{value} is not a valid genre" } 
	validates  :document_number, presence: true, length: { is: 8 }, numericality: { only_integer: true },uniqueness:{}
	validates  :cuil_cuit, presence: true, format:{ with: /[\d{2}]+\-[\d{8}]+\-[\d{1}]/ },uniqueness:{}
	has_many :contacts
	has_many :invoices
	accepts_nested_attributes_for :contacts
	def update_contacts(param)
	      contacts.destroy_all
	      param.values.each do |t|
		   contacts.new(t)
		  end
		 save
		end	
        
 	def update_values(customer,contacts,new_contact)
        @new=Contact.new(type_contact: new_contact["type_contact"],contact_value:new_contact["contact_value"])
    	if !@new.valid?
    	(update_attributes(customer) &&  update_contacts(contacts))
    	else
    	(update_attributes(customer) && update_contacts(contacts) && self.contacts.create(type_contact: new_contact["type_contact"],contact_value:new_contact["contact_value"]))

        end
	    end
	def calcular_edad
  		now = Time.now.utc.to_date
  		return now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
	end
	def monto_total_por_año
	@hashdeaños=Hash.new(0)
	 self.invoices.all.each do |factura|
	 	@hashdeaños[factura.date.year]+=factura.amount  
	 end
	 return @hashdeaños.sort.reverse
    end
    def monto_total_por_mes
    	@ar=[["Enero", 0],[ "Febrero", 0],[ "Marzo", 0],["Abril", 0],["Mayo", 0],["Junio", 0],["Julio", 0],["Agosto", 0],["Septiembre", 0],["Octubre", 0],[ "Noviembre", 0],["Diciembre",0]]
    	@facturas=self.invoices.select { |num|  num.date.year == Date.today.year}
        @facturas.each do |fac|
           @ar[fac.date.month-1][1]+=fac.amount
        end
        return @ar
    end
    def top_personas_5
    	@hashdepersonas=Hash.new(0)
       self.invoices.each do |fac|
         @hashdepersonas[fac.reveiver]+=1
       end
       return @hashdepersonas.sort_by {|k,v| v}.reverse.first(5)
    end
end
