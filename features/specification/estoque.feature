#language:pt
@estoque

Funcionalidade: Estoque
  Quero: Consultar estoque
  Para:  Garantir que tenha saldo para compra
  Critérios de aceite: Tenha estoque positivo em algum centro de distribuição

    Cenario: Validar estoque positivo ao consultar api de estoque
    Dado que eu queira consultar estoque de um sku
    Quando eu consulto o sku 411048 na api de estoque
    Então valido