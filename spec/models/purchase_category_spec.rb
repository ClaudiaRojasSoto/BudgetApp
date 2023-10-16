require 'rails_helper'

RSpec.describe PurchaseCategory, type: :model do
  it { should belong_to(:purchase) }
  it { should belong_to(:category) }
end
