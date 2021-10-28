require_relative 'rzhd_classes'

station_aaa = Station.new('AAA')
station_bbb = Station.new('BBB')
station_ccc = Station.new('CCC')
station_ddd = Station.new('DDD')
station_hhh = Station.new('HHH')
station_iii = Station.new('III')
station_jjj = Station.new('JJJ')
station_kkk = Station.new('KKK')

route01 = Route.new(station_aaa, station_ddd)
route02 = Route.new(station_hhh, station_kkk)

train01 = Train.new('123', 'freight', 15)
train02 = Train.new('234', 'passenger', 9)
train03 = Train.new('345', 'freight', 24)
train04 = Train.new('456', 'freight', 19)
train05 = Train.new('567', 'passenger', 10)


# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
puts 'Станции:'
puts "Станция #{station_aaa.station_name}"
puts "Станция #{station_bbb.station_name}"
puts "Станция #{station_ccc.station_name}"
puts "Станция #{station_ddd.station_name}"
puts "Станция #{station_hhh.station_name}"
puts "Станция #{station_iii.station_name}"
puts "Станция #{station_jjj.station_name}"
puts "Станция #{station_kkk.station_name}"
puts ''

# Может принимать поезда (по одному за раз)
puts 'На станцию ААА прибыл поезд №123'
station_aaa.arrive_train(train01)
puts 'На станцию ААА прибыл поезд №234'
station_aaa.arrive_train(train02)
puts 'На станцию ААА прибыл поезд №345'
station_aaa.arrive_train(train03)
puts 'На станцию HHH прибыл поезд №456'
station_hhh.arrive_train(train04)
puts 'На станцию HHH прибыл поезд №567'
station_hhh.arrive_train(train05)
puts ''

# Может возвращать список всех поездов на станции, находящиеся в текущий момент
puts 'Список поездов по станциям:'
puts 'Поезда на станции ААА:'
station_aaa.trains.each { |train| puts train.number}
puts 'Поезда на станции HHH:'
station_hhh.trains.each { |train| puts train.number}
puts ''

# Может возвращать список поездов на станции по типу
puts 'Грузовые поезда на станции ААА:'
station_aaa.freight_trains.each { |train| puts train.number}
puts 'Пассажирские поезда на станции ААА:'
station_aaa.passenger_trains.each { |train| puts train.number}
puts 'Грузовые поезда на станции HHH:'
station_hhh.freight_trains.each { |train| puts train.number}
puts 'Пассажирские поезда на станции HHH:'
station_hhh.passenger_trains.each { |train| puts train.number}
puts ''

# Может отправлять поезда
puts 'Поезд №123 уехал со станции ААА'
station_aaa.depart_train(train01)
puts 'Поезд №567 уехал со станции HHH'
station_hhh.depart_train(train05)

puts 'На станции ААА остались:'
station_aaa.trains.each { |train| puts train.number}
puts 'На станции HHH остались:'
station_hhh.trains.each { |train| puts train.number}
puts ''


# Класс Route (Маршрут):
# Имеет начальную и конечную станцию
puts 'Станции маршрута 01:'
route01.stations.each { |station| puts station.station_name }
puts 'Станции маршрута 02:'
route02.stations.each { |station| puts station.station_name }
puts ''

# Может добавлять промежуточную станцию в список
route01.add_station(station_bbb)
route01.add_station(station_ccc)
route02.add_station(station_iii)
route02.add_station(station_jjj)

puts 'В маршрут 01 добавлены станции BBB и CCC'
puts 'Станции маршрута 01:'
route01.show_stations
puts 'В маршрут 02 добавлены станции III и JJJ'
puts 'Станции маршрута 02:'
route02.show_stations
puts ''

# Может удалять промежуточную станцию из списка
route01.del_station(station_bbb)
route02.del_station(station_iii)

puts 'Из маршрута 01 убрана станция BBB'
puts 'Станции маршрута 01:'
route01.show_stations
puts 'Из маршрута 02 убрана станция III'
puts 'Станции маршрута 02:'
route02.show_stations
puts ''
# Может выводить список всех станций по-порядку от начальной до конечной


# Класс Train (Поезд):
# Имеет номер, тип и количество вагонов
puts 'Описание поездов'
puts "Поезд 1. Номер: #{train01.number}, тип: #{train01.type}, количество вагонов: #{train01.wagons}"
puts "Поезд 2. Номер: #{train02.number}, тип: #{train02.type}, количество вагонов: #{train02.wagons}"
puts ''

# Может набирать скорость
puts 'Паровозик может ездить!'
puts "Скорость поезда 1: #{train01.speed}"
train01.speed = 50

# Может возвращать текущую скорость
puts "Скорость поезда 1: #{train01.speed}"

# Может тормозить (сбрасывать скорость до нуля)
puts 'И тормозить!'
train01.speed = 0
puts "Скорость поезда 1: #{train01.speed}"
puts ''

# Может возвращать количество вагонов
puts "Количество вагонов поезда 1: #{train01.wagons}"

# Может прицеплять/отцеплять вагоны
train01.add_wagon
puts 'Вагон добавлен'
puts "Количество вагонов поезда 1: #{train01.wagons}"
train01.subtract_wagon
puts 'Вагон отцеплен'
puts "Количество вагонов поезда 1: #{train01.wagons}"
puts ''

# Может принимать маршрут следования
train01.route = route01
puts "Число станций в маршруте: #{train01.route.stations.size}"

puts 'Станции в маршруте:'
train01.route.stations.each { |station| puts station.station_name }
puts ''

# поезд автоматически помещается на первую станцию в маршруте
train01.route.stations[0].arrive_train(train01)

puts "Поезда на станции #{train01.route.stations[train01.current_station].station_name}:"
train01.route.stations[train01.current_station].trains.each { |train| puts train.number }
puts ''

# Может перемещаться между станциями, указанными в маршруте
puts 'Перемещаемся'
puts "Станция #{train01.route.stations[train01.current_station].station_name}"
train01.route.stations[train01.current_station].depart_train(train01)
puts "Станция #{train01.route.stations[train01.forward].station_name}"
train01.route.stations[train01.current_station].arrive_train(train01)
puts "Поезда на станции #{train01.route.stations[train01.current_station].station_name}:"
train01.route.stations[train01.current_station].trains.each { |train| puts train.number }
puts "Поезда на станции #{train01.route.stations[train01.current_station - 1].station_name}:"
train01.route.stations[train01.current_station - 1].trains.each { |train| puts train.number }
puts ''

# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
if train01.current_station.positive?
  puts "Предыдущая станция: #{train01.route.stations[train01.current_station - 1].station_name}"
end

puts "Текущая станция: #{train01.route.stations[train01.current_station].station_name}"
if (train01.current_station + 1) < train01.route.stations.size
  puts "Следующая станция: #{train01.route.stations[train01.current_station + 1].station_name}"
end
