require 'rails_helper'

describe Issue, type: :model do
  it { should belong_to :repository }
  it { should validate_uniqueness_of(:number).scoped_to(:repository_id) }
end