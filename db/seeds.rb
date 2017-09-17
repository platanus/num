# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# Write the code in a way that can be executed multiple times without duplicating the information.
#
# For example:
#
# Country.create(name: "Chile") # BAD
# Country.find_or_create_by(name: "Chile") # GOOD
#

#AccountType
AccountType.find_or_create_by(symbol: 'cta_cte').update!(name: "Cuenta Corriente")
AccountType.find_or_create_by(symbol: 'vista').update!(name: "Cuenta Vista")
AccountType.find_or_create_by(symbol: 'ahorro').update!(name: "Cuenta Ahorro")

#Bank
Bank.find_or_create_by(symbol: :bbva).update!(country: 'CL', name: "BBVA")
Bank.find_or_create_by(symbol: :bci).update!(country: 'CL', name: "Banco de Crédito e Inversiones (Bci)")
Bank.find_or_create_by(symbol: :bice).update!(country: 'CL', name: "Banco BICE")
Bank.find_or_create_by(symbol: :bancoestado).update!(country: 'CL', name: "Banco Estado")
Bank.find_or_create_by(symbol: :corpbanca).update!(country: 'CL', name: "CorpBanca")
Bank.find_or_create_by(symbol: :consorcio).update!(country: 'CL', name: "Consorcio")
Bank.find_or_create_by(symbol: :de_chile).update!(country: 'CL', name: "Banco de Chile")
Bank.find_or_create_by(symbol: :falabella).update!(country: 'CL', name: "Banco Falabella")
Bank.find_or_create_by(symbol: :hsbc).update!(country: 'CL', name: "Banco HSBC")
Bank.find_or_create_by(symbol: :paris).update!(country: 'CL', name: "Banco Paris")
Bank.find_or_create_by(symbol: :itau).update!(country: 'CL', name: "Itaú")
Bank.find_or_create_by(symbol: :ripley).update!(country: 'CL', name: "Banco Ripley")
Bank.find_or_create_by(symbol: :security).update!(country: 'CL', name: "Banco Security")
Bank.find_or_create_by(symbol: :santander).update!(country: 'CL', name: "Santander")
Bank.find_or_create_by(symbol: :scotiabank).update!(country: 'CL', name: "Scotiabank")
Bank.find_or_create_by(symbol: :tbanc).update!(country: 'CL', name: "TBanc")
