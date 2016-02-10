require 'test_helper'

class CustomerTest < ActiveSupport::TestCase


	test  "Crear una factura con algun dato no valido (destinatario vacio) " do
	     	a=Customer.new(   name:'sadsad',
                              last_name:'saffgdg',
                              genre:'Male',
                              birthdate:Date.today,
                              cuil_cuit:'23-36512477-9',
                              document_number:32324143)
            a.invoices.new(details:"compra de casa",
                           amount:0.3,date:Date.today,
                           reveiver:"",
                           cuil_cuit_reveiver:'23-36512465-9')
            a.contacts.new(type_contact:'email',
                  contact_value:'adsadas@sadsa')
            assert_not a.save,"No se guardo un cliente con una factura invalida"  
	     end


	     test "Con alguna factura valida" do
            a=Customer.new(   name:'sadsad',
                              last_name:'saffgdg',
                              genre:'Male',
                              birthdate:Date.today,
                              cuil_cuit:'23-36512477-9',
                              document_number:32322323)
            a.invoices.new(   details:"compra de casa",
                              amount:0.3,
                              date:Date.today,
                              reveiver:"12324523",
                              cuil_cuit_reveiver:'23-36212469-9')
            a.contacts.new(type_contact:'email',
                           contact_value:'adsadas@sadsa')
            assert a.save,"Se guardo un cliente con una factura valida" 
	     end
	     
end  