module CommonModule
  extend ActiveSupport::Concern

  TAX = 1.08        # 本体価格 + 消費税率
  SCORE_BAD = 1     # 満足度:悪い
  SCORE_NORMAL = 2  # 満足度:普通
  SCORE_GOOD = 3    # 満足度:良い

  included do
    #
    # 「お食事」と「スポーツジム」の両方で利用するバリデーションです。
    #

    # 名前 必須入力 最大16文字
    validates :name, presence: true, length: { maximum: 16 }

    # メールアドレス 必須入力 最大64文字 メールアドレスの形式 重複メールアドレスは不可 
    validates :mail, presence: true, length: { maximum: 64 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

    # 年齢 必須入力 数値 整数のみ 0〜100歳
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

    # 満足度 必須入力 数値 整数のみ 1〜3 (1:悪い 2:普通 3:良い)
    validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }

    # 意見や要望 任意入力 最大150文字
    validates :request, length: { maximum: 150 }
  end

  #
  # 消費税込みの価格を計算します。
  #
  # @param price [Integer] 価格
  # @return [Integer] 消費税込みの価格
  #
  def tax_included_price(price)
    (BigDecimal(price.to_s) * BigDecimal(TAX.to_s)).floor
  end

  #
  # 満足度を言語で表示します。
  #
  # @return [String] 良い、悪いなどの満足度
  #
  def view_score
    case self.score
    when SCORE_BAD
      I18n.t('common.score.bad')
    when SCORE_NORMAL
      I18n.t('common.score.normal')
    when SCORE_GOOD
      I18n.t('common.score.good')
    else
      I18n.t('common.score.unknown')
    end
  end
end