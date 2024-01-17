require "net/http"
require "active_support"

class CEP
  attr_reader :logradouro, :bairro, :localidade, :uf

  def initialize(cep)
    url = "https://viacep.com.br/ws/#{cep}/json/"
    @cep = fetch_cep(cep, url)
    fill_in_data(@cep)
  end

  private

  def fetch_cep(cep, url)
    uri = URI(url)
    response = Net::HTTP.get uri
    cep_data = ActiveSupport::JSON.decode response
  end

  def fill_in_data(cep)
    @logradouro = cep["logradouro"]
    @bairro = cep["bairro"]
    @localidade = cep["localidade"]
    @uf = cep["uf"]
  end
end

CEP.new(32241395)