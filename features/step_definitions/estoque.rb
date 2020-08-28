Dado('que eu queira consultar estoque de um sku') do
   log("Teste iniciado")
end
  
Quando('eu consulto o id_sku {int} na api de estoque') do |id_sku|
    @response_body = api_estoque.retorna_get(id_sku)
end
  
Quando('eu consulto um sku dinamico na api de estoque') do 
    id_sku = get_dynamic_sku('comum')
    log("id_sku dinamico: #{id_sku}")
    @response_body = api_estoque.retorna_get(id_sku)
end

Então('faço a validação') do
    result = false
    if @response_body['estoques'] != nil
        for i in 0..@response_body['estoques'].count
            if @response_body['estoques'][i] != nil && @response_body['estoques'][i]['quantidade'] > 0
                result = true
            end
        end
    end

    expect(result).to be_truthy  
end