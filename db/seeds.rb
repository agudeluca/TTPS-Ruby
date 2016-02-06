Customer.destroy_all
customer_list = [
  [ "anakin", "skywalker","1993/07/12","Male", 84236530 , "21-32425462-1" ],
  [ "farina","gonzalo","1992/08/01","Male", 27528236 , "21-39398893-2" ],
  [ "Belen","Perez","1990/11/04","Female", 10839905 , "21-39384983-1" ],
  [ "Cristina","Martinez", "1985/09/17","Female", 16643200, "21-83927174-2" ],
  [ "Lazaro","Baez", "1985/09/17","Male", 16683430, "21-83932174-2" ]]

contacts_list =[
   ["skype","agustindeluca15"],
   ["address","calle 8 1270 5b"],
   ["phonenumber","221679323233"],
   ["facebook","casona grande"],
   ["twitter","@larevistamanda"]]

invoices_list=[
       ["pago de internet",5000,"2015/08/12","anakin skalker", "22-32425462-1"],
       ["pago de gas",1235,"2011/07/12","isabel fedorak", "23-32425362-1"],
       ["pago de luz",250,"2012/07/12","jose maria de luca", "24-32225462-1"],
       ["pago de agua",54,"2013/07/12","agustin torres", "25-32425662-1"],
       ["pago de casa",4352,"2014/07/12","kacho castana", "26-37425462-1"],
     ]


customer_list.each do |name,last_name,birthdate,genre,document_number,cuidcuil|
  a=Customer.new( name: name,last_name: last_name, birthdate: birthdate,genre: genre,document_number: document_number,cuil_cuit:cuidcuil)
  contacts_list.each do |type,val| 
     a.contacts.new(type_contact:type,contact_value:val)
  end
  invoices_list.each do |details,amount,date,reveiver,cuidcuill|
   a.invoices.new(details:details,amount:amount,date:date,reveiver:reveiver,cuil_cuit_reveiver:cuidcuill)
   
  end
  a.save
end
