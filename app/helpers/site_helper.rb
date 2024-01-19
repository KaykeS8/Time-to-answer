module SiteHelper
  def msg_header
    case params[:action]
      when 'index'
        "Ultimas perguntas casdastradas..."
      when 'questions'
        "Resultados para o termo \"#{sanitize params[:term]}\""
      when 'subject'
        "Mostrando questões para o assunto #{sanitize params[:subject]}"
    end
  end
end
