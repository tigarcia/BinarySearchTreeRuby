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
  end
end
