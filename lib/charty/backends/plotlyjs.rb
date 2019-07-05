require "charty"

module Charty
  class RenderContext
    def json
      @plotter_adapter.json(self)
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

    def json(context)
      # scatter
      # bar
      # heatmap
      # bubble
      # area (scatter, tonexty)
      # barh (bar, orientation: 'h')
      # waterfall
      # pie
      # sunburst
      require 'json'
      context.series.map do |data|
        {
          x: data.xs.to_a,
          y: data.ys.to_a,
          type: 'bar'
        }
      end.to_json
    end
  end
end
