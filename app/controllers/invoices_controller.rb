class InvoicesController < ApplicationController
    layout 'application'
	def index
		@customer=Customer.find(params[:customer_id])
		@invoice=@customer.invoices
    end
  def new
    @customer=Customer.find(params[:customer_id])
     @invoice=@customer.invoices.new
  end 
  def create
       @customer=Customer.find(params[:customer_id])
      if @customer.invoices.create(invoice_params)
        redirect_to customer_invoices_url
      else
      render action: 'edit'
    end
  end 
    def edit
       @customer=Customer.find(params[:customer_id])
       @invoice=@customer.invoices.find(params[:id])
    end 
    def destroy
        @customer=Customer.find(params[:customer_id])
        @customer.invoices.find(params[:id]).destroy
         redirect_to customer_invoices_url
    end
    def update
        @customer=Customer.find(params[:customer_id])
       @invoice=@customer.invoices.find(params[:id])
       
       if  @invoice.update_attributes(invoice_params)
      redirect_to customer_invoices_url
      else
      render action: 'edit'
    end
    end
    private
	def invoice_params
        params.require(:invoice).permit(:details,:reveiver,:date,:amount )
	end
	
end