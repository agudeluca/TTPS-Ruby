class Customer < ActiveRecord::Base
	validates :name,  presence: true, 
                    format:{with: /\A[a-zA-Z ]+\z/,message: "ingrese solamente letras"}, 
                    length: {maximum:50},
                    allow_blank: false
	validates :last_name, presence: true, 
                        format:{with: /\A[a-zA-Z ]+\z/,message: "ingrese solamente letras"}, 
                        length: {maximum:50},
                        allow_blank: false
	validates :birthdate, presence: true,
                        allow_blank: false
	validates  :genre, presence: true,
                     inclusion: { in: %w(Male Female),message: "%{value} is not a valid genre" } ,
                     allow_blank: false
	validates  :document_number, presence: true, 
                               length: { is: 8 }, 
                               numericality: { only_integer: true },
                               uniqueness:{},
                               allow_blank: false
	validates  :cuil_cuit, presence: true,
                         format:{ with: /\A\d{2}\-\d{8}\-\d{1}\z/,message: "el cuil no respeta el formato" },
                         length: {is: 13},
                         uniqueness:{},
                         allow_blank: false
	
	validates :contacts, presence: true
	validates_associated :contacts
  has_many :contacts,dependent: :destroy
	has_many :invoices,dependent: :destroy
	accepts_nested_attributes_for :contacts

=begin



def update_contacts(datatoupdate)
    guardo=false
    datatoupdate.each do |dato|
    contact = Contact.find_by_id(dato[0])
    guardo = contact.update(type_contact: dato[1]['type_contact'].to_s,contact_value: dato[1]['contact_value'].to_s)
  end
  return guardo
end

	def update_contacts(datatoupdate)
	      datatoupdate_enum=datatoupdate.to_enum
          contacts_enum=contacts.all.to_enum
          inserto=false
        loop do
            halt
            aux=datatoupdate_enum.next
            inserto=contacts_enum.next.update(type_contact: aux[1]['type_contact'].to_s,
            	                              contact_value: aux[1]['contact_value'].to_s)
            #if !inserto
            #brake
            #end
        end
        return inserto
    end


        
 	def update_values(customer,contacts,new_contact)
        @new=Contact.new(type_contact: new_contact["type_contact"],contact_value:new_contact["contact_value"])
    	if !@new.valid?
    	(update_attributes(customer) &&  
        Contact.update(contacts.keys,contacts.values))
    	 
    	else
    	(update_attributes(customer) && 
        Contact.update(contacts.keys,contacts.values) && 
        self.contacts.new(type_contact: new_contact["type_contact"],contact_value:new_contact["contact_value"]).save)
        
        end
	    end
=end

def update_values(customer_contacts,new_contact)
    @new=Contact.new(type_contact: new_contact["type_contact"],contact_value:new_contact["contact_value"])
    if @new.valid?
      self.contacts.new(type_contact: new_contact["type_contact"],contact_value:new_contact["contact_value"]).save
    end
    self.update(customer_contacts)
end

	def calcular_edad
  		now = Time.now.utc.to_date
  		return now.year - self.birthdate.year - 
      ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
	end


	def monto_total_por_año
	@hashdeaños=Hash.new(0)
	 self.invoices.all.each do |factura|
	 	@hashdeaños[factura.date.year]+=factura.amount  
	 end
	 return @hashdeaños.sort.reverse
    end


    def monto_total_por_mes
    	@ar=[["Enero", 0],[ "Febrero", 0],[ "Marzo", 0],["Abril", 0],["Mayo", 0],
      ["Junio", 0],["Julio", 0],["Agosto", 0],["Septiembre", 0],["Octubre", 0],[ "Noviembre", 0],["Diciembre",0]]
    	@facturas=self.invoices.select { |num|  num.date.year == Date.today.year}
        @facturas.each do |fac|
           @ar[fac.date.month-1][1]+=1
        end
        return @ar
    end


    def top_personas_5  
    	@hashdepersonas=Hash.new(0)
       self.invoices.each do |fac|
         @hashdepersonas[fac.reveiver]+=fac.amount
       end
       return @hashdepersonas.sort_by {|k,v| v}.reverse.first(5)
    end


end
