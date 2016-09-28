require 'rspec'
require './binary_search_tree.rb'
require 'pry'

describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  describe "initialize" do
    it 'should initialize when given multiple values' do
      init_tree = BinarySearchTree.new([5, 2, 4, 1])
      expect(init_tree).to respond_to(:size)
      expect(init_tree.size).to eq(4)
    end
  end 

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
      expect(tree.size).to eq(5)
    end
  end

  describe "delete" do
    it 'should respond to delete' do
      expect(tree).to respond_to(:delete).with(1).argument
    end

    it 'should delete a single node' do
      tree.insert(1)
      expect(tree.size).to eq(1)
      expect(tree.delete(1)).to eq(1)
      expect(tree.size).to eq(0)
      tree.insert(1)
      expect(tree.size).to eq(1)
    end

    it 'should delete from a tree with 2 items' do
      tree.insert(1).insert(2)
      expect(tree.size).to eq(2)
      expect(tree.delete(1)).to eq(1)
      expect(tree.size).to eq(1)
      tree.insert(1)
      expect(tree.size).to eq(2)
    end

    it 'should return nil when the item is not found' do
      tree.insert(1).insert(2)
      expect(tree.delete(4)).to be_nil()
      expect(tree.size).to eq(2)
    end

    it 'should delete from a tree with 5 items' do
      tree.insert(5).insert(4).insert(8).insert(6).insert(7)
      expect(tree.size).to eq(5)
      expect(tree.delete(5)).to eq(5)
      expect(tree.size).to eq(4)
      expect(tree.find(5)).to be_nil()
      tree.insert(5)
      expect(tree.size).to eq(5)
      expect(tree.find(5)).to eq(5)
    end

    it 'should delete an item that\'s not the root' do
      tree.insert(5).insert(4).insert(8).insert(6).insert(7).insert(9).insert(10)
      expect(tree.size).to eq(7)
      expect(tree.delete(8)).to eq(8)
      expect(tree.size).to eq(6)
      expect(tree.find(8)).to be_nil()
      tree.insert(8)
      expect(tree.size).to eq(7)
      expect(tree.find(8)).to eq(8)
    end

    it 'should delete an item in the middle of a long list of nodes' do
      tree.insert(5).insert(4).insert(3).insert(2)
      expect(tree.size).to eq(4)
      expect(tree.delete(4)).to eq(4)
      expect(tree.size).to eq(3)
      expect(tree.find(4)).to be_nil()
      tree.insert(4)
      expect(tree.size).to eq(4)
      expect(tree.find(4)).to eq(4)
    end

    it 'should delete an item in the middle of a long list of nodes' do
      tree.insert(6).insert(3).insert(4).insert(2).insert(11).insert(7).insert(9).insert(8).insert(10).insert(22)
      expect(tree.size).to eq(10)
      expect(tree.delete(6)).to eq(6)
      expect(tree.size).to eq(9)
      expect(tree.find(6)).to be_nil()
      expect(tree.find(3)).to eq(3)
      expect(tree.find(4)).to eq(4)
      expect(tree.find(2)).to eq(2)
      expect(tree.find(11)).to eq(11)
      expect(tree.find(7)).to eq(7)
      expect(tree.find(9)).to eq(9)
      expect(tree.find(8)).to eq(8)
      expect(tree.find(10)).to eq(10)
      expect(tree.find(22)).to eq(22)
      tree.insert(6)
      expect(tree.size).to eq(10)
      expect(tree.find(6)).to eq(6)
    end
  end
end
