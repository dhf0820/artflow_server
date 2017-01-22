module Error
  class NotCustomerClassError < StandardError
    attr_accessor :failed_action
    def initialize(msg='Not a customer CLASS', data='')
      @data = data
      super(msg)
    end
  end
end
