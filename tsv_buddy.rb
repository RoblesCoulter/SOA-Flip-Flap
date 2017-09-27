# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  ENTER = "\n".freeze
  TAB = "\t".freeze

  def take_tsv(tsv)
    records = tsv.split(ENTER)
    keys = records.shift.split(TAB)
    @data = records.map { |record| Hash[keys.zip(record.split(TAB))] }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = @data.first.keys.join(TAB) + ENTER
    @data.map! { |record| record.values.join(TAB) }
    content = @data.join(ENTER) + ENTER
    header + content
  end
end
