class LogsDatatable
	delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Log.count,
      iTotalDisplayRecords: logs.total_count,
      aaData: data
    }
  end

private

  def data
    logs.map do |logs|
      [
        (logs.alien_id),
        (logs.product_id),
        (logs.planet_id),
        (logs.stage),
        (logs.created_date),
        (logs.close_date),
        (logs.closed),
        (logs.setup_charge),
        (logs.revenue_month)
      ]
    end
  end

  def logs
    @logs ||= fetch_logs
  end

  def fetch_logs
    logs = Log.order("#{sort_column} #{sort_direction}")
    logs = logs.page(page).per(per_page)
    if params[:sSearch].present?
      logs = logs.where("stage :search", search: "%#{params[:sSearch]}%")
    end
    logs
  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
  	
    columns = %w[alien_id]
    columns[params[:iSortCol_0].to_i]

  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end