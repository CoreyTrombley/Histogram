class HistogramController < ApplicationController
  def search
  end
  def result
    result = HTTParty.get("http://#{params[:url]}")
    answer = result.gsub(/(\W|\d)/, " ").split
    @answer = answer.inject(Hash.new(0)) { |h, x| h[x] += 1; h}.sort_by {|k,v| v.to_i }.reverse
  end
end
