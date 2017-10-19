class Admin::ReportsController < Admin::BaseController

  def index
  	@q = SearchParams.new(params[:search_params] || {end_time:Time.now}) 
    search_params = @q.attributes(self)

  	@columns = ["name","email","created_at"]

  	start_time_sql = params[:search_params]&&params[:search_params][:start_time].present? ? " and created_at >= '#{params[:search_params][:start_time]}' " : ""
  	end_time_sql = params[:search_params]&&params[:search_params][:end_time].present? ? " and created_at < '#{params[:search_params][:end_time]}' " : ""
    
    @employees = ActiveRecord::Base.connection.execute("select name,email,created_at from employees where id > 0 #{start_time_sql} #{end_time_sql}")
    
    @employees = Kaminari.paginate_array(@employees, total_count: @employees.size).page(params[:page]).per(20)
  end

  # 下载excell
  def download_excell_report
    @columns = ["name","email","mobile"]
    params[:search_params] = params[:report_params]
    start_time_sql = params[:search_params]&&params[:search_params][:start_time].present? ? " and created_at >= '#{params[:search_params][:start_time]}' " : ""
  	end_time_sql = params[:search_params]&&params[:search_params][:end_time].present? ? " and created_at < '#{params[:search_params][:end_time]}' " : ""
    @employees = ActiveRecord::Base.connection.execute("select name,email,mobile from employees where id > 0 #{start_time_sql} #{end_time_sql}")
    
    file = Spreadsheet::Workbook.new
 
      list = file.create_worksheet :name => "测试导出"
      list.row(0).concat @columns
   
      @employees.each_with_index { |report, i|
        list.row(i+1).concat report
      }

      xls_report = StringIO.new 
      file.write xls_report 

    send_data xls_report.string , type: 'text/xls', filename: "#{Time.now}.xls" 
  end

  # 上传excell
  def import_excell

  end

  def save_import
  	@message = {color:"#ff0000"}
    unless params[:file].blank?
      orig_name = params[:file].original_filename
      if ".XLSX" == File.extname(orig_name).upcase
        require 'roo'
        path = params[:file].tempfile.path
        workbook = Roo::Spreadsheet.open path
        worksheet = workbook.sheet(0)
        row_no = 1
        worksheet.each_row_streaming(offset: 1, pad_cells: true) do |row|
          row_no += 1
          next if row[0].blank?
          record = {excel_row: row_no, success: true}
          Employee::EMPLOYEE_COLUMNS.each do |c,i|
            record[c] = row[i]&.value 
          end
          Employee.save_from_hash(record)
        end
          @message[:color] = "#00DD00"
          @message[:detail] = "用户信息导入成功"
      else
        @message[:detail] = "文件格式要求为.xlsx格式。"
      end  
    else
      @message[:detail] = "请上传文件"
    end
    render "import_excell"
  end

end  