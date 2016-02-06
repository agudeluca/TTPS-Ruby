require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

	test  "Con algun dato no valido(dni <> 8)" do
	     	a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32323236058018)
            a.invoices.new(details:"compra de casa",amount:0.3,date:Date.today,reveiver:"12324523451",cuil_cuit_reveiver:'23-36512465-9')
            puts a.invoices.first.cuil_cuit
            a.contacts.new(type_contact:'email',contact_value:'adsadas@sadsa')
            assert_not a.save,"Se guardo un cliente con datos de contacto"  
	     end

	     test "Con alguna factura valida" do
            a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32322323)
            a.invoices.new(details:"compra de casa",amount:0.3,date:Date.today,reveiver:"12324523",cuil_cuit_reveiver:'23-36212469-9')
            puts a.invoices.first.cuil_cuit
            a.contacts.new(type_contact:'email',contact_value:'adsadas@sadsa')
            assert a.save,"Se guardo un cliente con una factura valida" 
	     end
	     
end  