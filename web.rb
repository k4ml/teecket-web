require 'sinatra'

require 'teecket'
require 'teecket/printer'

get '/' do
  @message = ''
  @output = ''

  if params[:from] || params[:to] || params[:date]
    if !params[:from].empty? && !params[:to].empty? && !params[:date].empty?
      output = Teecket.search({ from: params[:from], to: params[:to], date: params[:date]})
      @output = Printer.table(output)
    else
      @message = "Please enter From, To and Date"
    end
  end

  erb :index
end
