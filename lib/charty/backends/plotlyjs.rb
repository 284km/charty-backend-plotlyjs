module Charty
  class RenderContext
    def data
      @plotter_adapter.data(self)
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
      data(context).to_json
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
      context.series.map do |data|
        {
          x: data.xs.to_a,
          y: data.ys.to_a,
          type: "#{context.method}",
          marker: {
            color: '#66ff66',
          }
        }
      end
    end
  end
end
