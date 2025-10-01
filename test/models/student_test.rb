require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test '有効な学籍番号、氏名、メールアドレスがsaveされること' do
    s = Student.new(sid: '2311140072', name: '峯村勇輝', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert s.save
  end
  
  test '空の学籍番号がsaveされないこと' do
    s = Student.new(sid: '', name: '峯村勇輝', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert_not s.save
  end
  
  test '空の氏名がsaveされないこと' do
    s = Student.new(sid: '2311140072', name: '', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert_not s.save
  end
  
  test '空のメールアドレスがsaveされないこと' do
    s = Student.new(sid: '2311140072', name: '峯村勇輝', email: '')
    assert_not s.save
  end
  
  test '数字以外を含む学籍番号がsaveされないこと' do
    s = Student.new(sid: '231114aaaa', name: '峯村勇輝', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert_not s.save
  end
  
  #学籍番号の桁数で境界値テスト
  test '10桁超過の学籍番号がsaveされないこと' do
    #11桁
    s = Student.new(sid: '23111400720', name: '峯村勇輝', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert_not s.save
  end
  
  test '10桁未満の学籍番号がsaveされないこと' do
    #9桁
    s = Student.new(sid: '231114007200000', name: '峯村勇輝', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert_not s.save
  end
  
  test '3文字目から6文字目がパターンに合致しない学籍番号がsaveされないこと' do
    s = Student.new(sid: '2311160072', name: '峯村勇輝', email: '2311140072d@ed.fuk.kindai.ac.jp')
    assert_not s.save
  end
  
  test '形式が適切でないメールアドレスがsaveされないこと' do
    #@をふくまない
    s = Student.new(sid: '2311140072', name: '峯村勇輝', email: '2311140072ded.fuk.kindai.ac.jp')
    assert_not s.save
  end
end
