# -*- coding: utf-8 -*-
require 'helper'

class TestRegressionRichString05 < Test::Unit::TestCase
  def setup
    setup_dir_var
  end

  def teardown
    File.delete(@xlsx) if File.exist?(@xlsx)
  end

  def test_rich_string05
    @xlsx = 'rich_string05.xlsx'
    workbook  = WriteXLSX.new(@xlsx)
    worksheet = workbook.add_worksheet

    worksheet.set_column('A:A', 30)

    bold   = workbook.add_format(:bold   => 1)
    italic = workbook.add_format(:italic => 1)

    worksheet.write('A1', 'Foo', bold)
    worksheet.write('A2', 'Bar', italic)
    worksheet.write_rich_string('A3', 'This is ', bold, 'bold', ' and this is ', italic, 'italic')

    workbook.close
    compare_xlsx_for_regression(File.join(@regression_output, @xlsx), @xlsx)
  end
end
