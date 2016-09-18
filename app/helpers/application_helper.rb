module ApplicationHelper
  def assign_uuid
    self.uuid = UUIDTools::UUID.timestamp_create().to_s.upcase if uuid.blank?
  end
end
