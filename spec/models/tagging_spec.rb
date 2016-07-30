require 'rails_helper'

describe Tagging do
  it { should belong_to(:tag).inverse_of(:taggings) }
  it { should belong_to(:taggable) }

  it { should validate_presence_of(:taggable_id) }
  it { should validate_presence_of(:taggable_type) }
end
