# encoding: utf-8
require 'spec_helper'

describe Que do
  subject { Que.new(que_content: "test content", que_title: "test title",
    que_due_date: "2013/02/13") }
    
    #質問事項(que_content)
    #値が無い場合はエラーとする
    
    #桁数が500文字を超える場合はエラーとする
    
end
