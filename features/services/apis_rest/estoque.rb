module ApiEstoque
    class MetodosRest
        include HTTParty
        headers 'x-access-key' => ENV['api-estoque-x-access-key'],
                'x-client-id'=> ENV['api-estoque-x-client-id'],
                'X-Companhia' => ENV['api-estoque-X-Companhia']
        base_uri ENV['api-estoque-base-uri']

        def retorna_get(idSku)
            filiais = ENV['api-estoque-filiais']
            endpoint = "?idcompanhia=21&skus=#{idSku}&filiais=#{filiais}"
            response = self.class.get(endpoint)
            response
        end
    end
end