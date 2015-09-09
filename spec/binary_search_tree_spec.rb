require 'rspec'
require './binary_search_tree.rb'
require 'pry'

describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  describe "size" do
    it 'starts out with a size of 0' do
      expect(tree).to respond_to(:size)
      expect(tree.size).to eq(0)
    end

    it 'should not allow the size be assigned' do
      expect(tree).to_not respond_to(:size=)
    end
  end

  describe "insert" do
    it 'should respond to insert' do
      expect(tree).to respond_to(:insert).with(1).argument
    end

    it 'insert items into the tree' do
      expect(tree.size).to eq(0)
      tree.insert(5)
      expect(tree.size).to eq(1)
      tree.insert(1)
      expect(tree.size).to eq(2)
      tree.insert(3).insert(4).insert(0)
      binding.pry
      expect(tree.size).to eq(5)
    end
  end
end
