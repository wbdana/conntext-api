class RecordChannel < ApplicationCable::Channel
  def subscribed
    @record = Record.find_by(id: params[:room])
    stream_for @record
  end

  def received(data)
    RecordChannel.broadcast_to(@record, {record: @record})
  end

  def unsubscribed
  end
end
