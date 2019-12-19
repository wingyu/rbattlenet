module RBattlenet
  class ResultCollection < OpenStruct
    def <<(response)
      raise RBattlenet::Errors::ConnectionError.new unless response.code == 200
      (self.results ||= []) << JSON.parse(response.body, object_class: Result)
      self.code = response.code
    end

    def first
      raise RBattlenet::Errors::NoResultsError.new if !self.results
      self.results.first
    end

    def size
      raise RBattlenet::Errors::NoResultsError.new if !self.results
      self.results.size
    end
  end

  class Result < OpenStruct; end
end
