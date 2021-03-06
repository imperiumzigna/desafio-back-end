require "cpf_cnpj"

class CnabService
  attr_reader :line

  def initialize(line = nil)
    @line = line
  end

  def self.build(line)
    new(line).build
  end

  def build
    extract
  end

  def extract
    company = build_company
    cpf = CPF.new(line[19..29]).formatted
    kind = build_transaction_kind
    multiplier = kind.try(:multiplier) || 0
    time = normalize_time

    {
      transaction_kind_id: kind.try(:id),
      exec_date: normalize_date,
      value_cents: normalize_value(multiplier),
      cpf: cpf,
      card: line[30..41],
      exec_time: time,
      company_id: company
    }
  end

  private
    def build_company
      Company.find_by(name: line[62..80].strip).try(:id)
    end

    def build_transaction_kind
      TransactionKind.find_by(kind: line[0])
    end

    def normalize_value(multiplier)
      line[9..18].to_i * multiplier
    end

    def normalize_date
      Date.parse(line[1..8]).strftime("%d-%m-%Y")
    end

    def normalize_time
      Time.parse("#{line[42..43]}:#{line[44..45]}:#{line[46..47]}").strftime("%H:%M:%S")
    end
end
