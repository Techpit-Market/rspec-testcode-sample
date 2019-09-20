class FoodEnquete < ApplicationRecord
  include CommonModule  # 「お食事」と「スポーツジム」モデルの共通モジュール

  ADULIT_AGE = 20

  # 食事した料理 必須入力 数値 整数のみ 0〜2 (0:ラーメン 1:カレー 2:やきそば)
  validates :food_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }

  # 応募するプレゼント 必須入力 数値 整数のみ 0〜1 (0:ソフトドリンク飲み放題 1:ビール飲み放題)
  validates :present_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  # 未成年が選択できないプレゼントか検証
  validate :cannot_present_to_minor

  # 食事した料理の選択肢 ラーメン、カレー、やきそば
  @@foods  = [
    { id: 0, 
      name: FoodEnquete.human_attribute_name(:food_list)[0][:name], 
      price: FoodEnquete.human_attribute_name(:food_list)[0][:price] }, 
    { id: 1, 
      name: FoodEnquete.human_attribute_name(:food_list)[1][:name], 
      price: FoodEnquete.human_attribute_name(:food_list)[1][:price] }, 
    { id: 2, 
      name: FoodEnquete.human_attribute_name(:food_list)[2][:name], 
      price: FoodEnquete.human_attribute_name(:food_list)[2][:price] }
  ]

  # プレゼントの選択肢 ソフトドリンク飲み放題、ビール飲み放題
  @@presents  = [
    { id: 0, 
      name: FoodEnquete.human_attribute_name(:present_list)[0][:name], 
      price: FoodEnquete.human_attribute_name(:present_list)[0][:price], 
      adult_only: false }, 
    { id: 1, 
      name: FoodEnquete.human_attribute_name(:present_list)[1][:name], 
      price: FoodEnquete.human_attribute_name(:present_list)[1][:price], 
      adult_only: true }
  ]

  #
  # 食事した料理のリストを作成します。
  # 料理の名前、価格、消費税込みの価格がアンケートフォームに表示されます。
  #
  # @return [String] アンケートフォームに表示する料理のリスト
  #
  def food_choices
    @@foods.map {|item| [I18n.t('common.price_and_tax', name: item[:name], price: item[:price], tax_included_price: tax_included_price(item[:price])), item[:id]] }
  end

  #
  # プレゼントのリストを作成します。
  # プレゼントの名前、価格、消費税込みの価格がアンケートフォームに表示されます。
  #
  # @return [String] アンケートフォームに表示するプレゼントのリスト
  #
  def present_choices
    @@presents.map {|item| [I18n.t('common.price_and_tax', name: item[:name], price: item[:price], tax_included_price: tax_included_price(item[:price])), item[:id]] }
  end

  #
  # 選択された料理の名前を表示します。
  #
  # @return [String] 一覧や詳細ページに表示する料理の名前
  #
  def food_name
    food = @@foods.find { |food| food[:id] == food_id }
    food&.dig :name
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

  private
  #
  # 未成年が選択できないプレゼントか検証するバリデーションです。
  #
  def cannot_present_to_minor
    return if age.nil?
    if !adult?(age) && @@presents.any? { |present| present[:id] == present_id && present[:adult_only] == true }
      errors.add(:present_id, :cannot_present_to_minor)
    end
  end

  #
  # 未成年が選択できないプレゼントか検証するバリデーションです。
  # @param age [Integer] 年齢
  # @return [True] 成人
  # @return [False] 未成年
  #
  def adult?(age)
    age >= ADULIT_AGE
  end
end
