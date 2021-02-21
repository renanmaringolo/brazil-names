# frozen_string_literal: true

require 'spec_helper'

module Terminal
  describe Table do
    before :each do
      @table = Table.new
    end

    it 'should select columns' do
      @table << ['Alta Floresta dOeste']
      @table.column(0).should eq ['Alta Floresta dOeste']
    end
  end
end
