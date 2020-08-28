#language:pt
@estoque

Funcionalidade: Estoque
  Quero: Consultar estoque
  Para:  Garantir que tenha saldo para compra
  Critérios de aceite: Tenha estoque positivo em algum centro de distribuição

    Cenario: Validar estoque positivo ao consultar api de estoque
    Dado que eu queira consultar estoque de um sku
    Quando eu consulto o id_sku 411048 na api de estoque
    # Quando eu consulto um sku dinamico na api de estoque
    Então faço a validação
