# hand written from looking at RPT_Loc.xsd exported from MS Access version
# would be interesting to rite a ActiveRecord::Migration class generator
# from an XML Schema...

class SpectalesSetup < ActiveRecord::Migration
  def self.up
    create_table :spectacles do |t|
      t.integer :sid, :null => false
      t.integer :fk_pat, :bin
      t.string  :lens, :tint, :limit => 50
      t.float   :sphr, :cylr, :axisr, :sphl, :cyll, :axisl, :oc
      t.string  :frame, :limit => 50
      t.float   :eyesize, :bridge
      t.string  :comments, :limit => 50
      t.float   :tgc     #T_Spec.GC
      t.string  :bf, :limit => 50
      t.float   :add, :nc
      t.string  :location, :notes, :limit => 50
      t.text    :comment, :limit => 255
      t.datetime :dates
      t.float   :re, :le, :qrgc     #qrgc is QR_Spec.GC
    end
  end

  def self.down
    drop_table :spectacles
  end
end
