# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string
#  website           :string
#  market_cap        :float
#  ticker_symbol     :string
#  exchange_id       :integer
#  parent_company_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Company < ApplicationRecord
  
  belongs_to :exchange, 
  primary_key: :id, 
  foreign_key: :exchange_id,
  class_name: 'Exchange',
  optional: :true
  
  belongs_to :parent_company, 
  primary_key: :id, 
  foreign_key: :parent_company_id, 
  class_name: 'Company',
  optional: :true
  
  has_many :subsidiaries,
  primary_key: :id, 
  foreign_key: :parent_company_id, 
  class_name: 'Company' 
  
  has_many :prices, 
  primary_key: :id, 
  foreign_key: :company_id, 
  class_name: 'Price'
  
  has_many :watch_lists_items, 
  primary_key: :id, 
  foreign_key: :company_id, 
  class_name: 'WatchListItem'
  
  has_many :watch_lists, 
  through: :watch_list_items, 
  source: :watch_list
  
  has_one :board, 
  primary_key: :id, 
  foreign_key: :company_id,
  class_name: 'Company'
  
  
  
  
end
