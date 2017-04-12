class ApplicationMailer < ActionMailer::Base
  default :from => 'allied-hospitality@allied-hospitality.com'
  layout 'notifier'
end
