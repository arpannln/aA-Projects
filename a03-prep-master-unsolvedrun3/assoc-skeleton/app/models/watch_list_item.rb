# == Schema Information
#
# Table name: watch_list_items
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  cost_basis    :float
#  return_basis  :float
#  start_date    :date
#  end_date      :date
#  watch_list_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WatchListItem < ApplicationRecord
  belongs_to :company,
  primary_key: :id, 
  foreign_key: :company_id,
  class_name: 'Company'
  
  belongs_to :watch_list, 
  primary_key: :id, 
  foreign_key: :watch_list_id,
  class_name: 'WatchList'
end
