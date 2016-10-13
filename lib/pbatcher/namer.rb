module PBatcher
  class Namer < ProcHandler
    def name(item)
      call(item)
    end
  end
end
