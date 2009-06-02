class Kind < ActiveRecord::Base
  has_select_options(:method_name => 'dashboard_options', :label_column => :display_name,
                     :order => 'test_type ASC, name ASC',  :conditions => {:test_type => ['C32', 'PIX', 'PDQ']})
  has_select_options(:method_name => 'xds_options', :label_column => :display_name,
                     :conditions => {:test_type => 'XDS'}, :order => 'test_type ASC, name ASC')

  def display_name
    "#{test_type} #{name}"
  end

  def self.find_by_display_name(display_name)
    find_by_sql(%{
      SELECT * FROM kinds WHERE test_type||' '||name = '#{display_name}' LIMIT 1
    }).first
  end

  # FIXME need a better way to identify kinds
  def xds_qnr?
    display_name == "XDS Query and Retrieve"
  end
end
