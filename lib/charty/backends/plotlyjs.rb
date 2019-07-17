module Charty
  class RenderContext
    def data
      @plotter_adapter.data(self)[0]
    end

    def to_json
      @plotter_adapter.to_json(self)
    end
  end

  class Plotlyjs < PlotterAdapter
    Name = "plotlyjs"

    def initialize
      # do nothing
      @plot = nil
    end

    def label(x, y)
    end

    def series=(series)
      @series = series
    end

    def to_json(context)
      require 'json'
      data(context)[0].to_json
    end

    def data(context)
      # scatter
      # bar
      # heatmap
      # bubble
      # area (scatter, tonexty)
      # barh (bar, orientation: 'h')
      # waterfall
      # pie
      # sunburst
      case context.method
      when :bar
        context.series.map do |data|
          y_minus = data.ys.select{|i| i < 0}
          x_minus = data.xs[0..(y_minus.size - 1)]
          y_plus = data.ys.select{|i| i >= 0}
          x_plus = data.xs[y_minus.size..-1]
          minus_color = '#cccccc'
          plus_color = '#66ff66'

          minus = {
            x: x_minus,
            y: y_minus,
            type: "#{context.method}",
            marker: {
              color: "#{minus_color}",
            }
          }
          plus = {
            x: x_plus,
            y: y_plus,
            type: "#{context.method}",
            marker: {
              color: "#{plus_color}",
            }
          }
          [minus, plus]
        end
      when :barh
        context.series.map do |data|
          y_plus = data.ys.select{|i| i >= 0}
          x_plus = data.xs[0..(y_plus.size - 1)]
          y_minus = data.ys.select{|i| i < 0}
          x_minus = data.xs[y_plus.size..-1]
          minus_color = '#cccccc'
          plus_color = '#66ff66'

          minus = {
            x: x_minus,
            y: y_minus,
            type: 'bar',
            orientation: 'h',
            marker: {
              color: "#{minus_color}",
            }
          }
          plus = {
            x: x_plus,
            y: y_plus,
            type: 'bar',
            orientation: 'h',
            marker: {
              color: "#{plus_color}",
            }
          }
          [minus, plus]
        end
      end
    end
  end
end
