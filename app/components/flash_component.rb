class FlashComponent < ViewComponent::Base
  STYLES = {
    "notice" => "border-green-200 bg-green-50 text-green-900",
    "alert" => "border-red-200 bg-red-50 text-red-900"
  }.freeze

  TITLES = {
    "notice" => "Success",
    "alert" => "Something went wrong"
  }.freeze

  def initialize(type:, message:)
    @type = type.to_s
    @message = message
  end

  def style_classes
    STYLES.fetch(@type, STYLES.fetch("notice"))
  end

  def title
    TITLES.fetch(@type, "Notice")
  end
end
