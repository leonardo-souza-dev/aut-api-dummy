module Helpers  
    def get_dynamic_sku(type)
      begin
        require 'openssl'
        require 'net/http'  
        case type
        when 'sku_comum'
          comand = 'MassaDeDadosObterSkuComum'
        when 'sku_retira_leve'
          comand = 'MassaDeDadosObterSkuRetiraLeve'
        else
          comand = 'MassaDeDadosObterSkuRetiraPesado'
        end
        
        url = URI("http://massa-de-dados-b2c.ocp-eqx.dc.nova/api/obter-skus?comando=#{comand}&siglaBandeira=CB&qtd=1&requisicaoDaApi=true")  
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = false
        request = Net::HTTP::Get.new(url)
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        response = http.request(request)
        sku_response = JSON.parse(response.read_body)  
  
        unless sku_response.nil? || sku_response["skus"].nil? || sku_response["skus"][0].nil? || sku_response["skus"][0]["idSku"].nil?
          sku_id = sku_response["skus"][0]["idSku"]
          sku_id
        end
      rescue
        return nil
      ensure
        return sku_id
      end
    end
end
  