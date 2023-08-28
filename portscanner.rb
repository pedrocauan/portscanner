require 'socket'
require 'timeout'

#intervalo de portas
ports = 0..1024
opens = Array.new #portas abertas
closeds = Array.new #portas fechadas

#Entradas
print "IP: "
ip = gets.chomp.strip 
print "Velocidade([f]ast, [m]edium, [s]low): "
type_scan = gets.chomp.strip

#tipo do scanner
case type_scan
    when 'f'
        velocity = 0.024
    when 'm'
        velocity = 0.2
    when 's'
        velocity = 1
    else
        velocity = 0.024
end 

ports.each do |scan|
    begin
        Timeout::timeout(velocity) {TCPSocket.new("#{ip}", scan)}
    rescue
        closeds.push(scan)
    else 
        puts "Aberta: #{scan}"
        opens.push(scan)
    end
end
#mostra o total de portas abertas
print "abertas: "
opens.each { |port| print port.to_s + " " }
puts
#tempo para encerrar a conexão
sleep 4


