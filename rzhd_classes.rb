class Station
  attr_reader :trains, :station_name

  def initialize(name)
    @station_name = name
    @trains = []
  end

  def arrive_train(train)
    @trains << train
  end

  def depart_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(name)
    @stations.insert(-2, name)
  end

  def del_station(name)
    @stations.delete(name)
  end

  def show_stations
    @stations.each { |station| puts station.station_name }
  end
end

class Train
  attr_accessor :speed, :route
  attr_reader :number, :type, :wagons, :current_station

  def initialize(number, type, wagons, route = nil, current_station = 0)
    @speed = 0
    @number = number
    @type = type
    @wagons = wagons
    @route = route
    @current_station = current_station
  end

  def add_wagon
    @wagons += 1 if @speed.zero?
  end

  def subtract_wagon
    @wagons -= 1 if @speed.zero? && @wagons.positive?
  end

  def forward
    @current_station += 1
  end

  def back
    @current_station -= 1 if @current_station.positive?
  end
end
