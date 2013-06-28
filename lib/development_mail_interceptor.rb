class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} - #{message.cc}"
    message.to = "subhash.bhushan@gmail.com"
    message.cc = ""
  end
end