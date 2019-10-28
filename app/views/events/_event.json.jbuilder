date_format ='%Y-%m-%d'

json.id event.id

json.title event.title

json.something event.something

json.document event.document

json.speaker event.speaker

json.duration event.duration

json.start event.startDate.strftime(date_format)

json.end event.endDate.strftime(date_format)

json.update_url group_event_path(event.group_id, event, method: :patch)
json.edit_url edit_group_event_path(event.group_id, event)