require 'rexml/parsers/sax2parser'
require 'rubygems'
require 'active_record'
require 'yaml'

dbconfig = YAML::load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

class Spectacle < ActiveRecord::Base
end

parser = REXML::Parsers::SAX2Parser.new( File.new( 'RPT_Spec1.xml' ) )
parser.listen( :start_element, %w(QR_Spec) )  { @spec = Spectacle.new   }
parser.listen( :characters, %w(ID)  )    {|text| @spec.sid    = text }
parser.listen( :characters, %w(FK_Pat))  {|text| @spec.fk_pat = text }
parser.listen( :characters, %w(Bin) )    {|text| @spec.bin    = text }
parser.listen( :characters, %w(Lens))    {|text| @spec.lens   = text }
parser.listen( :characters, %w(Tint))    {|text| @spec.tint   = text }
parser.listen( :characters, %w(SphR))    {|text| @spec.sphr   = text }
parser.listen( :characters, %w(CylR))    {|text| @spec.cylr   = text }
parser.listen( :characters, %w(AxisR))   {|text| @spec.axisr  = text }
parser.listen( :characters, %w(SphL))    {|text| @spec.sphl   = text }
parser.listen( :characters, %w(CylL))    {|text| @spec.cyll   = text }
parser.listen( :characters, %w(AxisL))   {|text| @spec.axisl  = text }
parser.listen( :characters, %w(OC))      {|text| @spec.oc     = text }
parser.listen( :characters, %w(Frame))   {|text| @spec.frame  = text }
parser.listen( :characters, %w(Eyesize)) {|text| @spec.eyesize= text }
parser.listen( :characters, %w(Bridge))  {|text| @spec.bridge = text }
parser.listen( :characters, %w(Comments)){|text| @spec.comments=text }
parser.listen( :characters, %w(T_Spec.GC)){|text|@spec.tgc    = text }
parser.listen( :characters, %w(BF)  )    {|text| @spec.bf     = text }
parser.listen( :characters, %w(Add) )    {|text| @spec.add    = text }
parser.listen( :characters, %w(NC)  )    {|text| @spec.nc     = text }
parser.listen( :characters, %w(Location)){|text| @spec.location=text }
parser.listen( :characters, %w(Notes))   {|text| @spec.notes  = text }
parser.listen( :characters, %w(Comment)) {|text| @spec.comment= text }
parser.listen( :characters, %w(Dates))   {|text| @spec.dates  = text }
parser.listen( :characters, %w(Comment)) {|text| @spec.comment= text }
parser.listen( :characters, %w(RE)  )    {|text| @spec.re     = text }
parser.listen( :characters, %w(LE)  )    {|text| @spec.le     = text }
parser.listen( :characters, %w(QR_Spec.GC)){|text|@spec.qrgc  = text }
parser.listen( :end_element,%w(QR_Spec)) { @spec.save }

parser.parse

puts "#{Spectacle.count} Spectacles read from xml and written to database"
