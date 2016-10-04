fix_for "dua-2", depends_on: ['noempty-1'] do
  @xml.xpath('//unitdate[
    (contains(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "circa") or
     contains(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "ca") or
     contains(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "ca.") or
     contains(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "c.") or
     starts-with(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "c.") or
     contains(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "approximately") or
     contains(translate(./text(), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), "approx"))
      and @certainty != "approximate"]').each do |ud|
      a = ud.text
      a = a.gsub!(/\b(?:c(?:a)|circa|c.|ca|approx(?:imately)?|\?)[,.]?/, '').gsub(/[\[\]]/, '').strip.gsub(/\s+/, ' ')
      ud.content = a
  end
end
