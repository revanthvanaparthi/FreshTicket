class AgentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role_id, :report_to
end
