module ActivityLogsHelper

  def show_log(log)
    if log.model_type == "content"
      [link_to(log.item.file_file_name, folder_content_path(log.item.folder.token, log.item.id)), " uploaded by #{log.item.hidden_ip}"].join.html_safe
    elsif log.model_type == "comment"
      [log.item.name, " posted a ", link_to("comment.", folder_content_comments_path(log.item.content.folder.token, log.item.content.id))].join.html_safe 
    end
  end

end
