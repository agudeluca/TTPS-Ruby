require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
		test "the truth" do
         assert true
        end
        test "no debe guardar un cliente vacio" do
  		customer = Customer.new
  		assert_not customer.save,"Se guardo un cliente sin informacion"
	    end
	    test "Sin datos de contacto" do
         a=Customer.new(name:'asdasd',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:36058018)
         assert a.save,"Se guardo un cliente sin datos de contacto"
	    end
	     test  "Con datos de contacto" do
	     	a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:36058018)
            
            a.contacts.new(type_contact:'email',contact_value:'adsadas@sadsa')
            assert a.save,"Se guardo un cliente con datos de contacto"  
	     end
	     test  "Con algun dato no valido(dni <> 8)" do
	     	a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32323236058018)
            a.invoices.new(details:"compra de casa",amount:0.3,date:Date.today,reveiver:"12324523451")
            a.contacts.new(type_contact:'email',contact_value:'adsadas@sadsa')
            assert_not a.save,"Se guardo un cliente con datos de contacto"  
	     end
	     test "Con alguna factura valida" do
            a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32322323)
            a.invoices.new(details:"compra de casa",amount:0.3,date:Date.today,reveiver:"12324523451")
            assert a.save,"Se guardo un cliente con una factura valida" 
	     end
	     test "Con alguna factura con errores de validación (monto negativo, destinatario vacio)" do
	     	a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32322323)
            a.invoices.new(details:"compra de casa",amount:-1,date:Date.today,reveiver:"")
            assert_not a.save,"Se guardo un cliente con datos de contacto" 
        end
        test "Borrado de algun cliente sin facturas" do
        	a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32322323)
        	assert a.destroy
        end
        test "Borrado de algun cliente con facturas" do
        	a=Customer.new(name:'sadsad',last_name:'saffgdg',genre:'Male',birthdate:Date.today,cuil_cuit:'23-36512477-9',document_number:32322323)
            a.invoices.new(details:"compra de casa",amount:-1,date:Date.today,reveiver:"")
            assert a.destroy
        end
    end         