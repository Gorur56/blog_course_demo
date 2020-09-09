class Contact < MailForm::Base
    attribute :name,        :validate => true
    attribute :email,       :validate => /\A([\W\.%\+\-]+)@([\W\-]+\.)+([\W]{2,})\z/i
    attribute :message,     :validate => true
    attribute :nickname,    :captcha => true

    def headers 
        {
          :subject => "Contact Form",
          :to => "mackenzie@unicasts.com",
          :from => %("#{name}" <#{mail}>)
        }
    end 
end
    