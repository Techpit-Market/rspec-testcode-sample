class GymEnquete < ApplicationRecord
  include CommonModule # 「お食事」と「スポーツジム」モデルの共通モジュール

  # 参加したコース 必須入力 数値 整数のみ 0〜1 (0:脂肪燃焼 1:ヨガ)
  validates :course_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  # 応募するプレゼント 必須入力 数値 整数のみ 0〜1 (0:サプリメントセット 1:温泉旅行)
  validates :present_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  # 参加したコースの選択肢 脂肪燃焼、ヨガ
  @@courses  = [
    { id: 0, 
      name: GymEnquete.human_attribute_name(:course_list)[0][:name], 
      price: GymEnquete.human_attribute_name(:course_list)[0][:price] }, 
    { id: 1, 
      name: GymEnquete.human_attribute_name(:course_list)[1][:name], 
      price: GymEnquete.human_attribute_name(:course_list)[1][:price] }
  ]

  # プレゼントの選択肢 サプリメントセット、温泉旅行
  @@presents  = [
    { id: 0, name: GymEnquete.human_attribute_name(:present_list)[0][:name] }, 
    { id: 1, name: GymEnquete.human_attribute_name(:present_list)[1][:name] }
  ]

  #
  # 参加したコースのリストを作成します。
  # コースの名前、価格、消費税込みの価格がアンケートフォームに表示されます。
  #
  # @return [String] アンケートフォームに表示するコースのリスト
  #
  def course_choices
    @@courses.map {|item| [I18n.t('common.price_and_tax', name: item[:name], price: item[:price], tax_included_price: tax_included_price(item[:price])), item[:id]] }
  end

  #
  # プレゼントのリストを作成します。
  # プレゼントの名前、価格、消費税込みの価格がアンケートフォームに表示されます。
  #
  # @return [String] アンケートフォームに表示するプレゼントのリスト
  #
  def present_choices
    @@presents.map {|item| [item[:name], item[:id]] }
  end

  #
  # 選択されたコースの名前を表示します。
  #
  # @return [String] 一覧や詳細ページに表示するコースの名前
  #
  def course_name
    course = @@courses.find { |course| course[:id] == course_id }
    course&.dig :name
  end

  #
  # 選択されたプレゼントの名前を表示します。
  #
  # @return [String] 一覧や詳細ページに表示するプレゼントの名前
  #
  def present_name
    present = @@presents.find { |present| present[:id] == present_id }
    present&.dig :name
  end
end
