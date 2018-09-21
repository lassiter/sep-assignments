include RSpec

require_relative 'node'
require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:matrix) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(matrix) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  # Assumptions:
  # 1. The left node and right node should be less than tree.root.
  # 2. The left node should be less than the right node.
  # 3. The default placement is from left to right.
  # Root 87
  describe "#insert(data)" do
    it "properly inserts a new node as a new root" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "Braveheart"
      expect(tree.root.right.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, district)
      expect(tree.root.left.left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.left.title).to eq "Inception"
    end

    it "properly inserts a new node as a right-left-left child" do
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, hope)
      expect(tree.root.rating < tree.root.left.rating).to eq true
      expect(tree.root.left.rating < tree.root.right.rating).to eq true
      expect(tree.root.right.left.rating < tree.root.right.right.rating).to eq true
      expect(tree.root.right.left.left.rating < tree.root.right.left.right.rating).to eq true
      expect(tree.root.right.left.left.title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it "properly finds a root node" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left node" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, matrix.title).title).to eq "The Matrix"
    end

    it "properly finds a right node" do
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly finds a left-left node" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly finds a left-right node" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly finds a right-left node" do
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end

    it 'properly finds a right-right-left node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(tree.root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(tree.root, hope)
      tree.delete(tree.root, hope.title)
      expect(tree.find(tree.root, hope.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      tree.delete(tree.root, pacific_rim.title)
      expect(tree.find(tree.root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.delete(tree.root, inception.title)
      expect(tree.find(tree.root, inception.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(tree.root, district)
      tree.delete(tree.root, district.title)
      expect(tree.find(tree.root, district.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.delete(tree.root, martian.title)
      expect(tree.find(tree.root, martian.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      tree.delete(tree.root, mad_max_2.title)
      expect(tree.find(tree.root, mad_max_2.title)).to be_nil
    end
    it 'properly finds a right-right-left node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, mad_max_2)
      tree.delete(tree.root, shawshank.title)
      expect(tree.find(tree.root, shawshank.title)).to eq nil
      expect(tree.root.right.right.title).to eq mad_max_2.title
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nInception: 86\nStar Wars: A New Hope: 93\nThe Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nStar Wars: The Empire Strikes Back: 94\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       tree.insert(tree.root, hope)
       tree.insert(tree.root, empire)
       tree.insert(tree.root, jedi)
       tree.insert(tree.root, martian)
       tree.insert(tree.root, pacific_rim)
       tree.insert(tree.root, inception)
       tree.insert(tree.root, braveheart)
       tree.insert(tree.root, shawshank)
       tree.insert(tree.root, district)
       tree.insert(tree.root, mad_max_2)
       expect { tree.printf(tree.root) }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Martian: 92\nThe Matrix: 87\nMad Max 2: The Road Warrior: 98\nThe Shawshank Redemption: 91\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\n"
       tree.insert(tree.root, mad_max_2)
       tree.insert(tree.root, district)
       tree.insert(tree.root, shawshank)
       tree.insert(tree.root, braveheart)
       tree.insert(tree.root, inception)
       tree.insert(tree.root, pacific_rim)
       tree.insert(tree.root, martian)
       tree.insert(tree.root, jedi)
       tree.insert(tree.root, empire)
       tree.insert(tree.root, hope)
       expect { tree.printf(tree.root) }.to output(expected_output).to_stdout
     }
  end
end
