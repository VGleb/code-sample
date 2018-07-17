class Filter::Create::BuildHashsum < ::ApplicationInteractor
  def call
    context.params[:hashsum] = Digest::MD5.hexdigest(context.params.to_json)

    context.filter = ::Filter.find_by(hashsum: context.params[:hashsum])
  end
end
