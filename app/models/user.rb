class User < ActiveRecord::Base
  validates :password, :presence => true, :length => {:minimum => 6}
  validates :age, :presence => true, :format => {:with => /[0-9]/}
  validates_uniqueness_of :name, :presence => true, :format => {:with => /[a-z]/ ,:message => "please enter only characters"}
  validates :email, :presence => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

#  def self.save(upload)
#    name = upload['datafile'].orignal_filename
#    directory = "publi/data"
#
#    path = File.join(directory,name)
#    File.open(path, "wb") { |f| f.write(upload['datafile'].read)  }
#    end


end
