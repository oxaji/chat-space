require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    context 'messageを保存できる場合'
      it 'contentがあれば保存できる' do
      expect(build(:message, image:nil)).to be_vilid
      end

      it 'imageがあれば保存できる' do
      expect(build(:message, content:nil)).to be_vilid
      end
 
      it 'messageとimageがあれば保存できる' do
      expect(bulid(:message)).to be_valid
      end
  end

    context 'messageを保存できない場合' do
      it 'messageもimageもないと保存できない' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to inclide("を入力してください")
      end

      it 'group_idがないと保存されないこと' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to inclide("を入力してください")
      end

      it 'user_idがないと保存されないこと' do
        message = build(:message, user_id:nil)
        message.valid?
        expect(message.errors[:user]).to inclide("を入力してください")
      end
    end
  end
 