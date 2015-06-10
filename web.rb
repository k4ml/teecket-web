require 'sinatra'

require 'teecket'
require 'teecket/printer'

get '/' do
  "Hello, world"
  code = "<%= Time.now %>"

  if params[:from] && params[:to] && params[:date]
    output = Teecket.search({ from: params[:from], to: params[:to], date: params[:date]})
    @output = Printer.table(output)
  else
    @output = ''
  end

  erb :index
end
