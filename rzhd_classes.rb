class Station
  attr_reader :trains, :station_name, :freight_trains, :passenger_trains

  def initialize(name)
    @station_name = name
    @trains = []
    @freight_trains = []
    @passenger_trains = []
  end

  def arrive_train(train)
    @trains << train
    @freight_trains << train if train.type == 'freight'
    @passenger_trains << train if train.type == 'passenger'
  end

  def depart_train(train)
    @trains.delete(train)
    @freight_trains.delete(train) if @freight_trains.include? train
    @passenger_trains.delete(train) if @passenger_trains.include? train
  end
end

class Route
  attr_reader :stations

  def initialize(start_st, end_st)
    @stations = [start_st, end_st]
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
