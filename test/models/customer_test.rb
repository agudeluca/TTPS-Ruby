require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
		
        test "no debe guardar un cliente vacio" do
  		customer = Customer.new
  		assert_not customer.save,"Se guardo un cliente sin informacion"
	    end


	    test "Sin datos de contacto" do
         a=Customer.new(    name:'asdasd',
                            last_name:'saffgdg',
                            genre:'Male',
                            birthdate:Date.today,
                            cuil_cuit:"23-36512477-9",
                            document_number:36058018)
         assert_not a.save,"Se guardo un cliente sin datos de contacto"
	    end


	     test  "Con datos de contacto" do
	     	a=Customer.new( name:'sadsad',
                            last_name:'saffgdg',
                            genre:'Male',
                            birthdate:Date.today,
                            cuil_cuit:'23-36512477-9',
                            document_number:36058018)
            
            a.contacts.new(type_contact:'email',
                           contact_value:'adsadas@sadsa')
            assert a.save,"Se guardo un cliente con datos de contacto"  
	     end


        test "Borrado de algun cliente sin facturas" do
        	a=Customer.new( name:'sadsad',
                            last_name:'saffgdg',
                            genre:'Male',
                            birthdate:Date.today,
                            cuil_cuit:'23-36512477-9',
                            document_number:32322323)
        	a.contacts.new( type_contact:'email',
                            contact_value:'adsadas@sadsa')
            assert a.destroy
        end


        test "Borrado de algun cliente con facturas" do
        	a=Customer.new( name:'sadsad',
                            last_name:'saffgdg',
                            genre:'Male',
                            birthdate:Date.today,
                            cuil_cuit:'23-36512477-9',
                            document_number:32322323)
            a.invoices.new( details:"compra de casa",
                            cuil_cuit_reveiver:"23-36212465-9",
                            amount:15,
                            date:Date.today,
                            reveiver:"agus")
            a.contacts.new( type_contact:'email',
                            contact_value:'adsadas@sadsa')
            a.save
            assert a.destroy
        end

    end         