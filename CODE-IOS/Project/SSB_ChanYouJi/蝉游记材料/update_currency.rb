file = "CurrencyUnit.plist"
lines = []
exchange_currency = 'CNY'
exchange_rate = 1
File.open(file, 'r') do |f|
  while line = f.gets
    if line =~ /EnName/
      lines << line
      lines << line = f.gets
      exchange_currency = line.scan(/>(.*)</).last.first
p exchange_currency
    elsif line =~ /ExchangeRate/
      lines << line
      f.gets
      result = `curl -s 'http://www.webservicex.net/CurrencyConvertor.asmx/ConversionRate?FromCurrency=#{exchange_currency}&ToCurrency=CNY'`
      lines << "			<string>#{result.scan(/>(.*)</).last.first}</string>\n"
    else
      lines << line
    end
  end
end
File.open(file, 'w') {|f| f.write lines.join("")}
