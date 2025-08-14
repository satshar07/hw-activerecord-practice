require 'sqlite3'
require 'active_record'
require 'byebug'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'customers.sqlite3')
# Show queries in the console.
# Comment this line to turn off seeing the raw SQL queries.
ActiveRecord::Base.logger = Logger.new($stdout)

# Normally a separate file in a Rails app.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Customer < ApplicationRecord
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end

  #  NOTE: Every one of these can be solved entirely by ActiveRecord calls.
  #  You should NOT need to call Ruby library functions for sorting, filtering, etc.

  def self.any_candice
    # YOUR CODE HERE to return all customer(s) whose first name is Candice
    # probably something like:  Customer.where(....)
    where(first: "Candice")
  end

  def self.with_valid_email
    # YOUR CODE HERE to return only customers with valid email addresses (containing '@')
    where("email LIKE '%@%'")
  end
  # etc. - see README.md for more details
  def self.with_dot_org_email
    # return only customers whose email ends in '.org'
    where("email LIKE '%.org'")
  end

  def self.with_invalid_email
    # return customers with invalid but nonblank email (does not contain '@')
    where("email IS NOT NULL AND email <> '' AND email NOT LIKE '%@%'")
  end

  def self.with_blank_email
    # return customers with blank email
    where("email IS NULL OR email = ''")
  end

  def self.born_before_1980
    # return customers born before 1 Jan 1980
    where("birthdate < ?", Date.new(1980, 1, 1))
  end

  def self.with_valid_email_and_born_before_1980
    # return customers with valid email AND born before 1 Jan 1980
    where("email LIKE '%@%' AND birthdate < ?", Date.new(1980, 1, 1))
  end

  def self.last_names_starting_with_b
    # return customers whose last names start with "B", sorted by birthdate
    where("last LIKE 'B%'").order(:birthdate)
  end

  def self.twenty_youngest
    # return 20 youngest customers, in any order
    order(birthdate: :desc).limit(20)
  end

  def self.update_gussie_murray_birthdate
    # update the birthdate of Gussie Murray to February 8, 2004
    if (c = find_by(first: "Gussie", last: "Murray"))
      c.update!(birthdate: Time.parse("2004-02-08"))
    end
  end

  def self.change_all_invalid_emails_to_blank
    # change all invalid emails to be blank
    where("email IS NOT NULL AND email <> '' AND email NOT LIKE '%@%'")
      .update_all(email: "")
  end

  def self.delete_meggie_herman
    # delete customer Meggie Herman
    where(first: "Meggie", last: "Herman").delete_all
  end

  def self.delete_everyone_born_before_1978
    # delete all customers born on or before 31 Dec 1977
    cutoff = Time.zone.parse("1978-01-01")
    where("birthdate < ?", cutoff).delete_all
  end
end
