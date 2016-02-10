class CustomersController < ApplicationController
    layout 'application'
    
    def index
        @cust = Customer.all
    end

    def new
       @customer = Customer.new
       @customer.contacts.build 
    end

    def create
       @customer=Customer.new(customer_params)
		@customer.contacts.new(contact_params)
		if @customer.save
			redirect_to customers_url
		else

			render action: 'new'
		end
	end


	def edit
	  @customer=Customer.find(params[:id])
	  @contacts=@customer.contacts.all
	end


	def update
		@customer=Customer.find(params[:id])
		if  @customer.update_values(customer_params_to_update,params[:new_contact])
			redirect_to customers_url
			else
			redirect_to edit_customer_path(@customer)
		end
	end


	def destroy 
        Customer.find(params[:id]).destroy
        redirect_to customers_url
	end


	def show
		@customer=Customer.find(params[:id])
		@contact=@customer.contacts.all
		@edad=@customer.calcular_edad
		@montoPorAño=@customer.monto_total_por_año
		@montoPorMes=@customer.monto_total_por_mes
		@top5personas=@customer.top_personas_5
    end


    private


	def customer_params
        params.require(:customer).permit(:name,:last_name ,:birthdate,:genre,:document_number,:cuil_cuit )
	end


	def new_contact_params
		params.require(:new_contact).permit(:type_contact, :contact_value)
	end


	def contact_params
	    params.require(:contacts).permit(:type_contact, :contact_value)
	end
    def customer_params_to_update
		   customer_params.merge!({contacts_attributes: params[:cont].map{|key, value| 
			  {id:key,type_contact:value['type_contact'],
			  	contact_value:value['contact_value']}} }).permit(:name,:last_name,:birthdate,
			  	                                                 :genre,:document_number,:cuil_cuit,
			  	                                                 contacts_attributes:[ :id,:type_contact, :contact_value ])

	end
	
end
