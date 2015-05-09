require 'jouba/aggregate'
require 'securerandom'

class Track < Hashie::Dash
  include Jouba::Aggregate.new(prefix: :on)

  property :uuid
  property :title

  def self.create(attributes)
    attributes[:uuid] = SecureRandom.uuid
    Track.new(attributes).tap do |customer|
      customer.create(attributes)
    end
  end

  def create(attributes)
    emit(:created, attributes)
  end

private

  def on_created(attributes)
    update_attributes!(attributes)
  end
end