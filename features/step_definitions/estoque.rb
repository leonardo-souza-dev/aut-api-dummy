Dado('que eu queira consultar estoque de um sku') do
   log("Teste iniciado")
end
  
Quando('eu consulto o sku {int} na api de estoque') do |idSku|
    @response_body = api_estoque.retorna_get(idSku)
end

Então('valido') do
    for i in 0..@response_body['estoques'].count
        if @response_body['estoques'][i] != nil && @response_body['estoques'][i]['quantidade'] > 0
            result = true
        end
    end

    expect(result).to be_truthy  
end