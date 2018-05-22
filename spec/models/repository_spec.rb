require 'rails_helper'

describe Repository, type: :model do
  it { should belong_to :user }
  it { should have_many :issues }
  it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
end