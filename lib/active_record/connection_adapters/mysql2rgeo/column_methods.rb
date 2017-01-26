module ActiveRecord
  module ConnectionAdapters
    module Mysql2Rgeo
      module ColumnMethods
        def spatial(name, options = {})
          raise "You must set a type. For example: 't.spatial limit: { type: 'point' }'" if options[:limit].blank? || options[:limit][:type].blank?
          column(name, options[:limit][:type], options)
        end

        def geography(name, options = {})
          type = options.dig(:limit, :type)
          column(name, type.nil? ? :geometry : type, options)
        end

        def geometry(name, options = {})
          column(name, :geometry, options)
        end

        def geometry_collection(name, options = {})
          column(name, :geometry_collection, options)
        end

        def line_string(name, options = {})
          column(name, :line_string, options)
        end

        def multi_line_string(name, options = {})
          column(name, :multi_line_string, options)
        end

        def multi_point(name, options = {})
          column(name, :multi_point, options)
        end

        def multi_polygon(name, options = {})
          column(name, :multi_polygon, options)
        end

        def point(name, options = {})
          column(name, :point, options)
        end

        def polygon(name, options = {})
          column(name, :polygon, options)
        end
      end

      MySQL::Table.send(:include, ColumnMethods)
    end
  end
end
