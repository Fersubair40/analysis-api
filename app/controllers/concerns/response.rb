module Response
  def json_response!(object, status)
    render json: object, status: status
  end
end
