module EyeEmConnector

  class Client

    module Photos
      # for the options of different albums endpoints, see https://github.com/eyeem/Public-API/wiki/Albums 

      def photos(options={})
        response = request('photos',options)
        Hashie::Rash.new(MultiJson.decode(response.body))
      end

      def photo(id,options={})
        response = request('photos/'+id.to_s,options)
        Hashie::Rash.new(MultiJson.decode(response.body))
      end

      def photo_likers(id,options={})
        response = request('photos/'+id.to_s+'/likers',options)
      end

      def photo_liker(photo_id,liker_id,options={})
        response = request("photos/#{photo_id.to_s}/likers/#{liker_id}",options)
        response.status == 200
      end

      def photo_comments(id,options={})
        response = request('photos/'+id.to_s+'/comments',options)
        Hashie::Rash.new(MultiJson.decode(response.body))
      end

      def photo_comment(photo_id,contributer_id,options={})
        response = request("photos/#{photo_id.to_s}/comments/#{contributer_id}",options)
        Hashie::Rash.new(MultiJson.decode(response.body))
      end

    end
  end
end