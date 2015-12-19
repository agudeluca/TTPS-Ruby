customer_list = [
  [ "agustin", "de luca","1993-7-12","Male", 84236530 ,"Male", 21-32325462-1 ],
  [ "amado","Boudu","1992-8-1","Male", 27528236 ,"Male", 21-39398893-2 ],
  [ "Belen","Perez","1990-11-4", 10839905 ,"Female", 81424520, 21-39382983-1 ],
  [ "Cristina","Martinez", "1985-9-17" 16680000,"Female", 81831000, 21-83927174-2 ],
]

contacts_list =[
   ["skype","agustindeluca15"]
   ["address","calle 8 1270 5b"]
   ["phonenumber","221679323233"]
   ["facebook","casona grande"]
   ["twitter","@larevistamanda"] 
]
customer_list.each do |name,last_name,birthdate,genre,document_number,cuidcuil|
  a=Customer.create( name: name,last_name: last_name, birthdate: birthdate,genre: genre,document_number: document_number,cuid_cuil:cuidcuil )
  a.contacts.create()
end