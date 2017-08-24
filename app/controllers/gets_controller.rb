class GetsController < ApplicationController
require 'open-uri'
require 'nokogiri'

  def index
  end

  def show
  end

  def getweb
    url = params[:url]
    count = params[:count].to_i
    1.upto count do |i|
      img = Nokogiri::HTML.parse(url_set("#{url}/#{i}"), nil, 'utf-8')
      img.css('img.chapter_img_category2').each do |doc|

        p '-----------------------------------------'
        p params[:number].to_s + "-" + i.to_s
        p '-----------------------------------------'

        File.open("public/docs/#{params[:number].to_s}-#{i}.jpeg", 'wb') { |f| f.write(Net::HTTP.get_response(URI.parse(doc[:src])).body) }
      end
    end

    render 'show'
  end

  def url_set(url)
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
    return html
  end

end
