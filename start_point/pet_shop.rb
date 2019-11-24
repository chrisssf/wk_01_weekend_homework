

def pet_shop_name(name)
  return @pet_shop[:name]
end


def total_cash(cash)
  return @pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop, amount)
  updated_total_cash = pet_shop[:admin][:total_cash] += amount
  return updated_total_cash
end


def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, number_of_pets_sold)
  return pet_shop[:admin][:pets_sold] += number_of_pets_sold
end


def stock_count(pet_shop)
  return pet_shop[:pets].length
end


def pets_by_breed(pet_shop, breed)
  pets_matching_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      pets_matching_breed.push(pet)
    end
  end
  return pets_matching_breed
end


def find_pet_by_name(pet_shop, pet_name)
  not_found = 0
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      not_found += 1
      return pet
    end
  end
  if not_found == 0
    return nil
  end
end


def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end


def customer_cash(customer)
  return customer[:cash]
end


def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end


def customer_pet_count(customer)
  return customer[:pets].length
end


def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(pet_shop, pet_being_bought, customer)
  if pet_being_bought == nil
    return
  elsif customer[:cash] >= pet_being_bought[:price]
    remove_customer_cash(customer, pet_being_bought[:price])
    add_pet_to_customer(customer, pet_being_bought)
    remove_pet_by_name(pet_shop, pet_being_bought[:name])
    pet_shop[:admin][:pets_sold] += 1
    pet_shop[:admin][:total_cash] += pet_being_bought[:price]
  end
end
