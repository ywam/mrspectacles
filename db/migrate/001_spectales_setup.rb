# hand written from looking at RPT_Loc.xsd exported from MS Access version
# would be interesting to rite a ActiveRecord::Migration class generator
# from an XML Schema...

class SpectalesSetup < ActiveRecord::Migration
  def self.up
    create_table :spectacles do |t|
      t.integer :sid, :null => false
      t.integer :bin 

VA is  s.VAR and .VaL and has left and right search values


QF_SpecMatch3 -sort 

SpecSearch2 first
SpecRanking2

SpecMatch2
   rv = Abs(sSRd + sCRd / 2) + Abs(sCRd)
   lv = Abs(sSLd + sCLd / 2) + Abs(sCLd)

SpecRanking2 = (rv * 100 * s.VAR) + (lv * 100 * s.Val)

Bifocal R Add > 0


SQL Version
Used in search:
      t.float   :sphr, :cylr, :axisr

:sphl, step 0.25, -20 -> +20 (-3 -> +5)
sphere (range and focus)

:cyll, step 0.25, -20 -> +20 (-2 -> +2)
cylinder (distortion correction of sphere)

:axisl, step 1, 0 -> 180 (all over)
axis (direction of distortion)

      t.string  :tint, :limit => 50
sunglasses or not, white means clear glass

:oc
?????
May not be needed

      t.string  :frame, :limit => 50
Currently used for style and possible
women

      t.float   :eyesize
How far the eyes are apart
      t.float :bridge
Hieght above nose????

      t.string  :comments, :limit => 50
Children etc (patient data ???)

      t.string  :bf, :limit => 50
Normal glass, Bifocal, Progressive
PRG PROG
+0 + to :add

      t.float   :add
How much does the progressive add

                 t.float , :nc
 ????? ONLY ONE AT 56, dropping

      t.float  :re
      t.float  :le
#calulatable from above from cylyder and sphere
MS  Mean Sphere (le, re) - can be calculated
MS = cyl+.5(sphere)

:qrgc     #qrgc is QR_Spec.GC
Geometric Center (not used)
add eyesize and bridge to calculate

    end
  end

  def self.down
    drop_table :spectacles
  end
end
