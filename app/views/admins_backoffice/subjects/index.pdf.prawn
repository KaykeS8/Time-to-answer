prawn_document do |pdf|
  pdf.text 'Listando temas:'
  pdf.move_down 20
  pdf.table @subjects.collect{|p| [p.id, p.description]}
end