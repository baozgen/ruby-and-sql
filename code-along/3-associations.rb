# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company
puts "There are #{Company.all.count} companies"
puts "There are #{Company.all.count} contacts"

apple = Company.find_by({"name" => "Apple"})
puts apple.inspect

tim = Contact.new
tim["first_name"] = "Tim"
tim["last_name"] = "Cook"
tim["email"] = "tim@apple.com"
tim["company_id"] = apple["id"]
tim.save

craig = Contact.new
craig["first_name"] = "Craig"
craig["last_name"] = "Fedegrighni"
craig["email"] = "craig@apple.com"
craig["company_id"] = apple["id"]
craig.save


amazon = Company.find_by({"name" => "Amazon"})

contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save


# 2. How many contacts work at Apple?

apple_contacts = Contact.where({"company_id" => apple["id"]})
puts "Number of contacts at Apple #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?
for contact in apple_contacts
    first_name = contact["first_name"]
    last_name = contact["last_name"]
    full_name = "#{first_name} #{last_name}"
    puts "---- #{full_name}"
end