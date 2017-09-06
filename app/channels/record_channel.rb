class RecordChannel < ApplicationCable::Channel
  def subscribed
    @record = Record.find_by(id: params[:room])
    stream_for @record
    # RecordChannel.broadcast_to(@record, {record: @record})
  end

  def received(data)
    RecordChannel.broadcast_to(@record, {record: @record})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
