class CompaniesFilterService
    def initialize(params)
      @params = params
    end
  
    def call
      companies = Company.all
  
      if param(:name)
        companies = companies.where('name LIKE ?', "%#{param(:name)}%")
      end
  
      if param(:industry)
        companies = companies.where('industry LIKE ?', "%#{param(:industry)}%")
      end
  
      if param(:employee_count)
        companies = companies.where('employee_count >= ?', param(:employee_count).to_i)
      end
  
      if param(:limit)
        companies = companies.limit(param(:limit).to_i)
      end
  
      companies = companies.includes(:deals).order(created_at: :desc)
    end
  
    private
  
    def param(key)
      @params&.fetch(key, nil)
    end
  end
  